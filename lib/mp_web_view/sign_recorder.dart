import 'dart:async';
import 'dart:collection';
import 'dart:math';

//import 'package:pandas/pandas.dart';
//import 'package:numpy/numpy.dart';

//import 'utils/dtw.dart';
import '../models/sign_model.dart';
import 'landmark_utils.dart';
import 'package:matrix2d/matrix2d.dart';

class SignRecorder {
  Matrix2d m2d = const Matrix2d();
  late bool isRecording;
  final Map<String, List<dynamic>> Function(SignModel, Map<String, List<dynamic>>) dtwDistances;
  int seqLen;
  late List<Map<String, dynamic>> recordedResults;
  //FIXME Find a dataframe version for dart
  Map<String, List> referenceSigns;

  SignRecorder({
    required this.dtwDistances,
    required this.referenceSigns,
    this.seqLen = 50,
  }) {
    isRecording = false;
    recordedResults = [];
  }

  void record() {
    referenceSigns["distance"] =
        m2d.zeros(0, referenceSigns["distance"]!.length);
    isRecording = true;
  }

  List processResults(Map<String, dynamic> results) {
    if (isRecording) {
      if (recordedResults.length < seqLen) {
        recordedResults.add(results);
      } else {
        computeDistances();
        //print(referenceSigns);
      }
    }

    if (m2d.sum(referenceSigns["distance"]!) == 0) {
      return ["", isRecording];
    }
    return [_getSignPredicted(), isRecording];
  }

  Future<void> computeDistances() async {
    List<List<double>> leftHandList = [];
    List<List<double>> rightHandList = [];
    for (Map<String, dynamic> result in recordedResults) {
      var _, leftHand, rightHand = extractLandmarks(result);
      leftHandList.add(leftHand);
      rightHandList.add(rightHand);
    }

    // Create a SignModel object with the landmarks gathered during recording
    SignModel recordedSign = SignModel(leftHandList, rightHandList);

    // Compute sign similarity with DTW (ascending order)
    referenceSigns = dtwDistances(recordedSign, referenceSigns);

    // Reset variables
    recordedResults = [];
    isRecording = false;
  }

  String _getSignPredicted({
    int batchSize = 5,
    double threshold = 0.2,
  }) {
    // Get the list (of size batch_size) of the most similar reference signs
    //List<String> signNames = referenceSigns.iloc[:batchSize]["name"].values;
    List signNames = referenceSigns["name"]!.sublist(0, batchSize);

    // Count the occurrences of each sign and sort them by descending order
    //Map<String, int> signCounter = Counter(signNames).mostCommon();
    var signCounter = signNames.fold<Map<String, int>>({}, (map, element) {
      map[element] = (map[element] ?? 0) + 1;
      return map;
    });
    var Max = signCounter.values.reduce(max);
    String predictedSign =
        signCounter.keys.singleWhere((element) => signCounter[element] == Max);
    int count = signCounter.values.first;
    if (count / batchSize < threshold) {
      return "Signe inconnu";
    }
    return predictedSign;
  }
}

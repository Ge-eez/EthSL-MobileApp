import 'dart:typed_data';

import 'hand_model.dart';

class SignModel {
  late bool hasLeftHand;
  late bool hasRightHand;
  late List<List<double>> lhEmbedding;
  late List<List<double>> rhEmbedding;

  SignModel(
    List<List<double>> leftHandList,
    List<List<double>> rightHandList,
  ) {

    //TODO Replace isNotEmpty with summation check != 0
    hasLeftHand = leftHandList.isNotEmpty;
    hasRightHand = rightHandList.isNotEmpty;
    lhEmbedding = _getEmbeddingFromLandmarkList(leftHandList);
    rhEmbedding = _getEmbeddingFromLandmarkList(rightHandList);
  }

  static List<List<double>> _getEmbeddingFromLandmarkList(
    List<List<double>> handList,
  ) {
    List<List<double>> embedding = [];
    for (int frameIdx = 0; frameIdx < handList.length; frameIdx++) {
      //TODO Replace isEmpty with summation check != 0
      if (handList[frameIdx].isEmpty) {
        continue;
      }

      HandModel handGesture = HandModel(handList[frameIdx]);
      embedding.add(handGesture.featureVector);
    }
    return embedding;
  }
}

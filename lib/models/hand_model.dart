import 'dart:typed_data';

class HandModel {
  late List<int> connections;
  late List<double> featureVector;

  HandModel(List<double> landmarks) {
    //TODO Find alt for getting the connections from mediapipe
    //connections = mp.solutions.holistic.HAND_CONNECTIONS;
    connections = [];
    //TODO User array library to find reshape the files
    //landmarks = Numpy.array(landmarks).reshape((21, 3));
    featureVector = _getFeatureVector(landmarks);
  }

  List<double> _getFeatureVector(landmarks) {
    List<dynamic> connections = _getConnectionsFromLandmarks(landmarks);

    List<double> anglesList = [];
    for (var connectionFrom in connections) {
      for (var connectionTo in connections) {
        double angle = _getAngleBetweenVectors(connectionFrom, connectionTo);
        if (angle != double.nan) {
          anglesList.add(angle);
        } else {
          anglesList.add(0);
        }
      }
    }
    return anglesList;
  }

  List<dynamic> _getConnectionsFromLandmarks(
    landmarks,
  ) {
    return landmarks.map((t) => landmarks[t[1]] - landmarks[t[0]]).toList();
  }

  static double _getAngleBetweenVectors(u, v) {
    if (u.equals(v)) {
      return 0;
    }
    //double dotProduct = Numpy.dot(u, v);
    //double norm = Numpy.linalg.norm(u) * Numpy.linalg.norm(v);
    //return Numpy.arccos(dotProduct / norm);
    return 0.0;
  }
}

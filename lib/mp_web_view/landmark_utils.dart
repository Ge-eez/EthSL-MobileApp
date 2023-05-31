// TODO Implement this library.
import 'package:matrix2d/matrix2d.dart';

extractLandmarks(results) {
  Matrix2d m2d = Matrix2d();
  // Extract the pose landmarks.
  List pose = landmarkToArray(results.poseLandmarks).reshape(99,0).toList();

  // Extract the left hand landmarks.
  List leftHand = List.filled(63, 0);
  if (results.leftHandLandmarks != null) {
    leftHand = landmarkToArray(results.leftHandLandmarks).reshape(63,0).toList();
  }

  // Extract the right hand landmarks.
  List rightHand = List.filled(63, 0);
  if (results.rightHandLandmarks != null) {
    rightHand = landmarkToArray(results.rightHandLandmarks).reshape(63,0).toList();
  }

  // Return the pose, left hand, and right hand landmarks.
  return [pose, leftHand, rightHand];
}
List<double> landmarkToArray(mpLandmarkList) {
  // Create a list to store the keypoints.
  List<double> keypoints = [];

  // Loop through the landmarks.
  for (var landmark in mpLandmarkList) {
    // Add the x, y, and z coordinates of the landmark to the list.
    keypoints.add(landmark.x);
    keypoints.add(landmark.y);
    keypoints.add(landmark.z);
  }

  // Return the list of keypoints.
  return keypoints;
}

import 'package:get/get.dart';
import 'package:mobile_dev_project/features/comments/business/entities/comment.dart';

class ListOfCommentsController extends GetxController {
  var listOfComments = <Comment>[].obs;

  ListOfCommentsController({required listOfComments_}) {
    listOfComments.value = listOfComments_;
  }
}

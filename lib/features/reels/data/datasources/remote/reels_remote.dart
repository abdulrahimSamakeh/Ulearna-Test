import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';
import 'package:ulearna_test/features/reels/domain/entities/response/reels_response_entite.dart';

import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../../../core/error/exception.dart';

abstract class ReelsRemote {
  //Get Reels Abstract Metod
  Future<ReelsResponseEntite> getReels(
      {required ReelsRequestEntite reelsRequestEntite});
}

class ReelsRemoteImplements extends ReelsRemote {
  //Calling Api End Point Impelementation

  //Call Get Article Remote Implementation
  @override
  Future<ReelsResponseEntite> getReels(
      {required ReelsRequestEntite reelsRequestEntite}) async {
    //Calling API
    final response = await ApiMethods()
        .get(url: ApiGetUrl.getReelsUrl, query: reelsRequestEntite.toJson());
    //Check Response
    if (response.statusCode == 200) {
      //Parsing Response Data to Dart Class To Deal With it
      return reelsResponseEntiteFromJson(response.body);
    } else {
      //Handeling Other Exception
      throw ServerException(response: response);
    }
  }

  
}

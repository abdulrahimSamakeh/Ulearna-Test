import '../error/error_entite.dart';
import '../error/error_response_entite.dart';
import '../error/failures.dart';

//Function To Handel Failure Of Api Calls
//By Mapping Abstract Faliure Classes (Server Failure, Empty Cache Failure ,Offline Failure)
Future<ErorrEntite> mapFailure({
  required Failure failure,
}) {
  ErorrEntite erorrEntite = ErorrEntite(errorMessage: '');
  switch (failure.runtimeType) {
    case ServerFailure _:
      {
        failure as ServerFailure;
        if (failure.response != null && failure.response!.body.isNotEmpty) {
          final ErrorResponseEntite errorResponseEntite;
          try {
            errorResponseEntite =
                errorResponseEntiteFromJson(failure.response!.body);
            erorrEntite.errorMessage = errorResponseEntite.message;
            erorrEntite.statusCode = failure.response!.statusCode;
          } catch (e) {
            erorrEntite.errorMessage = 'Server Error';
            return Future.value(erorrEntite);
          }

          //Check If User Token Is Expired
          //Delete Cached User Info Data Like Token etc.
          //And Push Him To Login Page
          // if (erorrEntite.statusCode == 401) {
          //   MyApp.myAppKey.currentState!.pushNamedAndRemoveUntil(
          //       RouteNamedScreens.loginNameRoute, (route) => false);
          //   AppSharedPreferences.deleteCachedAuthUserInfo();
          // }

          return Future.value(erorrEntite);
        } else {
          return Future.value(erorrEntite);
        }
      }
    case EmptyCacheFailure _:
      {
        erorrEntite.errorMessage ='There Is No Cached Data';
        return Future.value(erorrEntite);
      }
    case OfflineFailure _:
      {
        failure as OfflineFailure;
        erorrEntite.errorMessage = failure.message;

        return Future.value(erorrEntite);
      }
    default:
      {
        erorrEntite.errorMessage = 'Some Thing Went Wrong';

        return Future.value(erorrEntite);
      }
  }
}

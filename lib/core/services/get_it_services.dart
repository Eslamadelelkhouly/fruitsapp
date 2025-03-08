import 'package:fruitsapp/core/services/database_services.dart';
import 'package:fruitsapp/core/services/firebase_auth_services.dart';
import 'package:fruitsapp/core/services/firestore_services.dart';
import 'package:fruitsapp/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      databaseServices: getIt<DatabaseServices>(),
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
    ),
  );
}

import 'package:ls_server_app/feature/edit_service/use_case/delete_service_from_favorite_use_case.dart';
import 'package:ls_server_app/feature/edit_service/use_case/get_service_use_case.dart';
import 'package:ls_server_app/feature/edit_service/use_case/upsert_service_to_favorite_use_case.dart';

class EditServiceUseCases {
    final GetServiceUseCase getServiceUseCase;
    final UpsertServiceToFavoriteUseCase upsertServiceToFavoriteUseCase;
    final DeleteServiceFromFavoriteUseCase deleteServiceFromFavoriteUseCase;

    EditServiceUseCases({
        required this.getServiceUseCase,
        required this.upsertServiceToFavoriteUseCase,
        required this.deleteServiceFromFavoriteUseCase
    });
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/features/personalization/presentation/blocs/user_operations_bloc/user_operations_bloc.dart';
import 'package:my_anime/features/personalization/presentation/widgets/user_creation_failed_widget.dart';
import 'package:my_anime/features/personalization/presentation/widgets/user_creation_loading_widget.dart';
import 'package:my_anime/features/personalization/presentation/widgets/user_creation_succeed_widget.dart';

class UserCreationMessageScreen extends StatelessWidget {
  const UserCreationMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserOperationsBloc, UserOperationsState>(
        builder: (context, state) {
          if (state is LoadingUserOperationState) {
            return const UserCreationLoading();
          } else if (state is SuccessfulUserOperationState) {
            return const UserCreationSucceedWidget();
          } else if (state is ErrorUserOperationState) {
            return const UserCreationFailedWidget();
          } else {
            return const UserCreationLoading();
          }
        },
      ),
    );
  }
}

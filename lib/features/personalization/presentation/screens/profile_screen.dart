import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/widgets/error_message_widget.dart';
import 'package:my_anime/core/widgets/loading_indicator.dart';
import 'package:my_anime/features/personalization/presentation/blocs/user_operations_bloc/user_operations_bloc.dart';
import 'package:my_anime/features/personalization/presentation/widgets/profile_screen_widgets/user_details_form.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';
import 'package:my_anime/utils/helpers/scaffold_messenger_helper.dart';
import 'package:my_anime/utils/helpers/users_hepler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<UserOperationsBloc>(context)
        .add(GetUserDetailsEvent(userEmail: UsersHelper.getUserEmail()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: BlocConsumer<UserOperationsBloc, UserOperationsState>(
          listener: (context, state) {
            if (state is ErrorUserOperationState) {
              ScaffoldMessengerHelper.showSnackbar(context, state.errorMessage);
            }
            if (state is SuccessfulUserOperationState) {
              //show update successfull message
              ScaffoldMessengerHelper.showSnackbar(
                  context, 'user info updated successfully');

              //Trigger getUser details event
              BlocProvider.of<UserOperationsBloc>(context).add(
                  GetUserDetailsEvent(userEmail: UsersHelper.getUserEmail()));

              //navigaet back
              NavigationHelper.navigateBack(context);
            }
          },
          builder: (context, state) {
            if (state is ErrorUserOperationState) {
              return ErrorTextWidget(errorMessage: state.errorMessage);
            } else if (state is UserDetailedFetchedState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),

                    //Form
                    UserDetailsForm(size: size, user: state.user)
                  ],
                ),
              );
            } else if (state is LoadingUserOperationState) {
              return const LoadingIndicator();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

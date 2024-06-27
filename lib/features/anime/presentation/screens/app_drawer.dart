import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/widgets/user_image.dart';
import 'package:my_anime/features/anime/presentation/widgets/drawer_widgets/drawer_listview.dart';
import 'package:my_anime/features/anime/presentation/widgets/drawer_widgets/drawer_logout_item.dart';
import 'package:my_anime/features/personalization/presentation/blocs/user_operations_bloc/user_operations_bloc.dart';
import 'package:my_anime/utils/helpers/users_hepler.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    BlocProvider.of<UserOperationsBloc>(context)
        .add(GetUserDetailsEvent(userEmail: UsersHelper.getUserEmail()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<UserOperationsBloc, UserOperationsState>(
              builder: (context, state) {
                if (state is UserDetailedFetchedState) {
                  return Center(
                      child: UserImage(
                    networkImage: state.user.userPhoto,
                    size: AppSizes.drawerUserImageSize,
                  ));
                } else {
                  return const Center(
                      child: UserImage(
                    size: AppSizes.drawerUserImageSize,
                  ));
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Center(child: BlocBuilder<UserOperationsBloc, UserOperationsState>(
              builder: (context, state) {
                if (state is UserDetailedFetchedState) {
                  final user = state.user;
                  return Text('${user.firstName} ${user.lastName}',
                      style: AppTextStyles.userNameTextStyle);
                } else if (state is ErrorUserOperationState) {
                  return const Text("Error...",
                      style: TextStyle(color: Colors.red, fontSize: 23));
                } else if (state is LoadingUserOperationState) {
                  return const CircularProgressIndicator();
                } else {
                  return Container();
                }
              },
            )),
            const SizedBox(
              height: 20,
            ),
            const DrawerListView(),
            const Spacer(),

            //Logout
            const DrawerLogoutItem()
          ],
        ),
      ),
    );
  }
}

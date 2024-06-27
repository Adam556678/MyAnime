import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/anime/presentation/cubit/recommendations_cubit/recommendations_cubit.dart';
import 'package:my_anime/features/anime/presentation/widgets/recommendations/page_indicator_widget.dart';

class AppPagination extends StatefulWidget {
  const AppPagination({
    super.key,
    required this.lastPage,
    required this.selectedIndex,
    required this.onpressed,
  });

  final int lastPage;
  final int selectedIndex;
  final void Function(int index) onpressed;

  @override
  State<AppPagination> createState() => _AppPaginationState();
}

class _AppPaginationState extends State<AppPagination> {
  int startingIndex = 0;

  @override
  void initState() {
    calcStartingIndex();
    super.initState();
  }

  void calcStartingIndex() {
    int div = widget.selectedIndex ~/ 3;
    setState(() {
      startingIndex = div * 3;
    });
  }

  void getNextPages() {
    setState(() {
      startingIndex += 3;
    });
  }

  void getPreviousPages() {
    setState(() {
      startingIndex -= 3;
    });
  }

  bool disablePrevious() {
    return startingIndex == 0;
  }

  bool disableNext() {
    return startingIndex >= widget.lastPage - 3;
  }

  bool disablePage(int index) {
    return index > widget.lastPage - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Previous
        PageIndicator(
          disabled: disablePrevious(),
          icon: Icons.keyboard_double_arrow_left,
          onpressed: getPreviousPages,
        ),
        const SizedBox(width: AppSizes.sm / 2),
        // Pages List
        ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              index += startingIndex;
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: PageIndicator(
                  disabled: disablePage(index),
                  pageNumber: index + 1,
                  selected: index == widget.selectedIndex,
                  // onpressed: () =>
                  //     BlocProvider.of<RecommendationsCubit>(context)
                  //         .getRecommendations(index + 1),
                  onpressed: () => widget.onpressed(index),
                ),
              );
            }),
        const SizedBox(width: AppSizes.sm / 2),
        PageIndicator(
          disabled: disableNext(),
          icon: Icons.keyboard_double_arrow_right,
          onpressed: getNextPages,
        ),
      ],
    );
  }
}

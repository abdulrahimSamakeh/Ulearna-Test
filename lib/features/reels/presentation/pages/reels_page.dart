import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';
import 'package:ulearna_test/features/reels/presentation/bloc/reels_bloc/reels_bloc.dart';

import '../../../../core/function/caching_functions.dart';
import '../../../../core/resource/enum_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/app_bar/main_app_bar.dart';
import '../../../../core/widget/button/refresh_button.dart';
import '../../../../core/widget/list_view/pagination_list_view_separated.dart';
import '../../../../core/widget/loading/opacity_loader_widget.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../widgets/reel_list_item.dart';
import '../widgets/reel_loading_list_item.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  void dispose() {
    // Clear the video cache when the app is closed
    clearVideoCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ReelsRequestEntite reelsRequestEntite = ReelsRequestEntite.initial();
    reelsRequestEntite.page++;
    return Scaffold(
      appBar: const MainAppBar(
        centerTitle: true,
        title: 'Ulearna',
      ),
      body: BlocConsumer<ReelsBloc, ReelsState>(
        listener: (context, state) {
          switch (state.cubitStatus) {
            case CubitStatus.error:
              NoteMessage.showSnackBar(
                  context: context, text: state.error, warning: true);
              break;
            default:
          }
        },
        builder: (context, state) {
          switch (state.cubitStatus) {
            case CubitStatus.succses:
              {
                final reelsList = state.reelsResponseEntite.data;
                return Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        reelsRequestEntite = ReelsRequestEntite.initial();
                        context.read<ReelsBloc>().add(
                              GetReelsEvent(
                                paginationLoading: false,
                                reset: true,
                                reelsRequestEntite: reelsRequestEntite,
                              ),
                            );
                      },
                      //List Of Reels
                      child: PaginationListView(
                        scrollDirection: Axis.vertical,
                        isLoading: state.loadPagination,
                        onReachMaxScroll: () {
                          if (state.haveReachedMax == false &&
                              state.loadPagination == false) {
                            if (state.loadPagination == false) {
                              if (state.haveReachedMax == false &&
                                  state.loadPagination == false) {
                                context.read<ReelsBloc>().add(GetReelsEvent(
                                    reset: false,
                                    paginationLoading: true,
                                    reelsRequestEntite: reelsRequestEntite));
                              }
                            }
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: AppWidthManger.w2,
                            vertical: AppHeightManger.h1),
                        itemBuilder: (context, index) {
                          final reel = reelsList.data[index];
                          return ReelsListItem(
                            reel: reel,
                          );
                        },
                        itemCount: state.reelsResponseEntite.data.data.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: AppHeightManger.h2,
                          );
                        },
                      ),
                    ),
                    Visibility(
                        visible: state.loadPagination,
                        child: const OpacityLoaderWidget()),
                  ],
                );
              }
            case CubitStatus.loading:
              {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManger.w2,
                      vertical: AppHeightManger.h1),
                  itemBuilder: (context, index) {
                    return const ReelLoadingListItem();
                  },
                );
              }
            case CubitStatus.error:
              {
                return RefreshButton(
                  refreshTitle: state.error,
                  haveRefreshButton: true,
                  onTap: () {
                    reelsRequestEntite = ReelsRequestEntite.initial();
                    context.read<ReelsBloc>().add(
                          GetReelsEvent(
                            paginationLoading: false,
                            reset: true,
                            reelsRequestEntite: reelsRequestEntite,
                          ),
                        );
                  },
                );
              }
            default:
              {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManger.w2,
                      vertical: AppHeightManger.h1),
                  itemBuilder: (context, index) {
                    return const ReelLoadingListItem();
                  },
                );
              }
          }
        },
      ),
    );
  }
}

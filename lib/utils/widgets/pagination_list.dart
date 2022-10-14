import 'package:flutter/material.dart';
import 'package:recipes_app/utils/app_colors.dart';


class PaginationList<T> extends StatefulWidget {
  const PaginationList(
      {Key? key, required this.isLoading, required this.list, required this.hasMore, required this.loadMore, this.onRefresh, required this.builder})
      : super(key: key);

  final bool isLoading;
  final List<T> list;
  final bool? hasMore;
  final Function loadMore;
  final Function? onRefresh;
  final Widget Function(T) builder;
  @override
  _PaginationListState<T> createState() => _PaginationListState<T>();
}

class _PaginationListState<T> extends State<PaginationList<T>> {
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      _checkIfLoadMoreNeeded();
    });
  }

  void _checkIfLoadMoreNeeded() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      if (widget.hasMore == true && !isLoadingMore) {
        isLoadingMore = true;
        widget.loadMore();
      }
    }
  }

  @override
  void didUpdateWidget(PaginationList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("inside did update widget");
    if (scrollController.hasClients) {
      if (widget.hasMore! && (widget.list.isEmpty)) {
        _checkIfLoadMoreNeeded();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    isLoadingMore = false;
    Widget listWidget = Container();
    if (!widget.isLoading) {
      listWidget =  ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        itemCount: (widget.list.length) + (widget.hasMore == true ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == widget.list.length) {
            return Center(child: CircularProgressIndicator(color: AppColors.green,));
          } else if (widget.list == null) {
            return Container();
          }
          T item = widget.list[index];
          return widget.builder(item);
        },
        shrinkWrap: false,
      );
    }
    return widget.isLoading
        ? Center(child: CircularProgressIndicator(color: AppColors.green,))
        : widget.onRefresh != null
        ? RefreshIndicator(
        onRefresh: () async {
          widget.onRefresh?.call();
        },
        child: listWidget)
        : listWidget;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

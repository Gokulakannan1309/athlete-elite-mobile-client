import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/custom_dialogbox.dart';
import '../athelete_home_controller.dart';

class AddStoryScreen extends GetWidget<AtheleteHomeController> {
  final bool isAthlete;
  const AddStoryScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/person.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(top: 50.h, left: 20.w, child: CommonBackButton()),
          Positioned(
            bottom: 30.h,
            left: 20.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonButton(
                  text: "20 Views",
                  onPressed: () {
                    _showViewsList(context);
                  },
                  icon: "eye_open",
                  iconColor: AppColors.black,
                  color: AppColors.primaryColor,
                  fontSize: 13.sp,
                  width: 135.w,
                ),
                SizedBox(width: 10.w),
                CommonButton(
                  text: "Delete",
                  onPressed: () {
                    CustomDialogbox.showConfirmation(
                      title: "Are you sure?",
                      cancelText: "Cancel",
                      confirmText: "Delete Story",
                      onConfirm: () {
                        controller.deleteStoryByAthlete("");
                      },
                      onCancel: () {
                        print("Cancelled");
                      },
                    );
                  },
                  icon: "delete",
                  iconColor: AppColors.white,
                  color: AppColors.red,
                  textColor: AppColors.white,
                  fontSize: 13.sp,
                  width: 120.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showViewsList(BuildContext context) {
    final viewers = List.generate(
      8,
      (index) => ViewerModel(name: "Jhon Doe", imageUrl: null),
    );

    ViewsListDialog.show(context: context, title: "View By", viewers: viewers);
  }
}

class ViewsListDialog extends StatelessWidget {
  final String title;
  final List<ViewerModel> viewers;
  final Widget Function(ViewerModel viewer)? itemBuilder;

  const ViewsListDialog({
    super.key,
    this.title = "View By",
    required this.viewers,
    this.itemBuilder,
  });

  static Future<void> show({
    required BuildContext context,
    String title = "View By",
    required List<ViewerModel> viewers,
    Widget Function(ViewerModel viewer)? itemBuilder,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) => ViewsListDialog(
        title: title,
        viewers: viewers,
        itemBuilder: itemBuilder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.screenBackgroundColor,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    title,
                    color: AppColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemCount: viewers.length,
                itemBuilder: (context, index) {
                  final viewer = viewers[index];
                  if (itemBuilder != null) {
                    return itemBuilder!(viewer);
                  }
                  return _DefaultViewerItem(viewer: viewer);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Default Viewer Item Widget
class _DefaultViewerItem extends StatelessWidget {
  final ViewerModel viewer;

  const _DefaultViewerItem({required this.viewer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage:
                viewer.imageUrl != null ? NetworkImage(viewer.imageUrl!) : null,
            backgroundColor: AppColors.white.withOpacity(0.2),
            child: viewer.imageUrl == null
                ? Icon(Icons.person, color: AppColors.white, size: 20.sp)
                : null,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: AppText(
              viewer.name,
              color: AppColors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

/// Viewer Model
class ViewerModel {
  final String name;
  final String? imageUrl;
  final String? userId;

  ViewerModel({required this.name, this.imageUrl, this.userId});
}

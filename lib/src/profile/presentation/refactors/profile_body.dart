// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import 'package:tunceducation/core/common/app/providers/user_provider.dart';
import 'package:tunceducation/core/core.dart';
import 'package:tunceducation/core/extensions/context_extension.dart';
import 'package:tunceducation/core/services/injection_container.dart';
import 'package:tunceducation/src/course/features/exams/presentation/views/add_exam_view.dart';
import 'package:tunceducation/src/course/features/materials/presentation/views/add_materials_view.dart';
import 'package:tunceducation/src/course/features/videos/presentation/view/add_video_view.dart';
import 'package:tunceducation/src/course/presentation/cubit/course_cubit.dart';
import 'package:tunceducation/src/course/presentation/widgets/add_course_sheet.dart';
import 'package:tunceducation/src/profile/presentation/widgets/admin_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        final user = value.user;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colors.white,
                      infoIcon: const Icon(
                        Icons.pages,
                        size: 24,
                        color: Colors.black,
                      ),
                      infoTitle: "Courses",
                      infoValue: user!.enrolledCourseIds.length.toString()),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colors.white,
                      infoIcon: Image.asset(
                        MediaRes.scoreboard,
                        height: 24,
                        width: 24,
                      ),
                      infoTitle: "Score",
                      infoValue: user.points.toString()),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colors.white,
                      infoIcon: const Icon(
                        Icons.person,
                        size: 24,
                      ),
                      infoTitle: "Following",
                      infoValue: user.following.length.toString()),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colors.white,
                      infoIcon: Icon(
                        Icons.person_outline_outlined,
                        color: Colors.red[900]!,
                      ),
                      infoTitle: "Followers",
                      infoValue: user.followers.length.toString()),
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (context.currentUser!.isAdmin) ...[
              AdminButton(
                label: 'Add Course',
                icon: IconlyLight.paper_upload,
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    showDragHandle: true,
                    elevation: 0,
                    useSafeArea: true,
                    builder: (_) => BlocProvider(
                      create: (_) => s1<CourseCubit>(),
                      child: const AddCourseSheet(),
                    ),
                  );
                },
              ),
              AdminButton(
                label: "Add Video",
                icon: IconlyBold.video,
                onPressed: () {
                  Navigator.of(context).pushNamed(AddVideoView.routeName);
                },
              ),
              AdminButton(
                label: "Add Material",
                icon: IconlyBold.document,
                onPressed: () {
                  Navigator.of(context).pushNamed(AddMaterialView.routeName);
                },
              ),
              AdminButton(
                  label: "Add Exams",
                  icon: IconlyLight.document,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddExamView.routeName);
                  })
            ],
          ],
        );
      },
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final Color infoThemeColor;
  final Widget infoIcon;
  final String infoTitle;
  final String infoValue;
  const UserInfoCard({
    Key? key,
    required this.infoThemeColor,
    required this.infoIcon,
    required this.infoTitle,
    required this.infoValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 156,
      decoration: BoxDecoration(
        border: Border.all(
          color: infoThemeColor,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: infoThemeColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: infoIcon,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  infoTitle,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  infoValue,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

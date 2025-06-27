import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:untitled/design-system/app_colors.dart';
import 'package:untitled/features/home/domain/entity/member_entity.dart';
import 'package:untitled/features/home/presentation/add_member/add_member_view.dart';
import 'package:untitled/features/home/presentation/cubit/member_cubit.dart';
import 'package:untitled/shared/toast_alert.dart';
import '../auth/domain/entity/head_auth_model.dart';

class HomeView extends StatefulWidget {
  static const String path = '/home';
  static const String name = 'home';
  final String headId;

  const HomeView({super.key, required this.headId});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late MemberCubit memberCubit;
  HeadAuthModel? headData;
  Stream<List<FamilyMemberModel>>? membersStream;

  @override
  void initState() {
    super.initState();
    memberCubit = context.read<MemberCubit>();
    _loadData();
  }

  List<FamilyMemberModel>? _cachedMembers;

  void _loadData() async {
    final head = await memberCubit.getHead(widget.headId);
    if (mounted) {
      setState(() {
        headData = head;
        membersStream = memberCubit.getMembers(widget.headId);

        membersStream?.first.then((members) {
          _cachedMembers = members;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Family', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
              icon: const Icon(Icons.download, color: Colors.white),
              onPressed: () async {
                final members = _cachedMembers;

                if (members == null || members.isEmpty) {
                  return;
                }

                _downloadFamilyDataAsPdf(members);
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headBadge(),
            SizedBox(height: 8.h),
            _headProfileCard(),
            SizedBox(height: 24.h),
            Text(
              'Family Members',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 12.h),
            _listView()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          context
              .pushNamed(AddFamilyMemberView.name,
                  extra: AddMemberArgs(headId: widget.headId))
              .then((value) {
            _loadData();
          });
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Member"),
      ),
    );
  }

  Widget _headBadge() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: kPrimaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_user, color: kPrimaryColor),
          SizedBox(width: 8.w),
          Text(
            'You are registered as Family Head',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headProfileCard() {
    if (headData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: kPrimaryColor.withValues(alpha: 0.1),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: kPrimaryColor,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headData?.name ?? "",
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text('📞 ${headData?.phone ?? ""}',
                    style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 4.h),
                Text('🏠 ${headData?.city}, ${headData?.state}',
                    style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView() {
    if (membersStream == null) return const SizedBox();

    return Expanded(
      child: StreamBuilder<List<FamilyMemberModel>>(
        stream: membersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final members = snapshot.data ?? [];

          if (members.isEmpty) {
            return const Center(child: Text("No family members added yet."));
          }

          return ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              final member = members[index];
              return _listItem(member);
            },
          );
        },
      ),
    );
  }

  Widget _listItem(FamilyMemberModel member) {
    return InkWell(
      onTap: () {
        context
            .pushNamed(
              AddFamilyMemberView.name,
              extra: AddMemberArgs(headId: widget.headId, member: member),
            )
            .then((value) => _loadData());
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  member.gender.toLowerCase() == 'male'
                      ? Icons.male
                      : Icons.female,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(member.firstName,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    Text(member.relation,
                        style: TextStyle(
                            fontSize: 14.sp, color: Colors.grey[700])),
                    Text('DOB: ${member.dob}',
                        style: TextStyle(fontSize: 13.sp)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 16.sp, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _downloadFamilyDataAsPdf(List<FamilyMemberModel> members) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Text('Family Members Report',
              style:
                  pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 16),
          pw.Table.fromTextArray(
            headers: ['Name', 'Relation', 'Gender', 'DOB'],
            data: members
                .map((m) => [m.firstName, m.relation, m.gender, m.dob])
                .toList(),
          ),
        ],
      ),
    );

    try {
      final output = await getApplicationDocumentsDirectory();
      final file = File("${output.path}/family_data.pdf");
      await file.writeAsBytes(await pdf.save());

      showSnackbar("PDF saved to app storage", Colors.green);

      await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: 'family_data.pdf',
      );
    } catch (e) {
      showSnackbar('Failed to save PDF', Colors.red);
    }
  }
}

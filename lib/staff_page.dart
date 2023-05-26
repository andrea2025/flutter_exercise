import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti_exercise/staff_model.dart';
import 'package:vesti_exercise/staff_provider.dart';
import 'package:vesti_exercise/utils/button_component.dart';
import 'package:vesti_exercise/utils/constants.dart';
import 'package:vesti_exercise/utils/sized_box.dart';
import 'package:vesti_exercise/utils/text_field.dart';

class StaffPage extends ConsumerStatefulWidget {
  const StaffPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends ConsumerState<StaffPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(staffListProvider.notifier).addStaff(StaffModel());
      ref.read(staffListProvider.notifier).addSkill(0, "");
    });
  }

  @override
  Widget build(BuildContext context) {
    List<StaffModel> staffList = ref.watch(staffListProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Staff List"),
                    YBox(10),
                    Expanded(
                      child: Column(
                        children: staffList
                            .mapIndexed((userIndex, staff) => Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      YBox(10),
                                      Text("User ${userIndex + 1}"),
                                      YBox(10),
                                      TextInputNoIcon(
                                        fillColor: kLightGreen,
                                        hintText: "Full Name",
                                        text: "FULL NAME",
                                        outlinedBorder: true,
                                        inputType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter a full name';
                                          }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          ref
                                              .read(staffListProvider.notifier)
                                              .editStaff(userIndex,
                                                  fullName: val);
                                        },
                                      ),
                                      YBox(20),
                                      TextInputNoIcon(
                                        fillColor: kLightGreen,
                                        hintText: "Email Address",
                                        text: "EMAIL ADDRESS",
                                        outlinedBorder: true,
                                        inputType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter an email address';
                                          }
                                          if (!isEmail(value)) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          ref
                                              .read(staffListProvider.notifier)
                                              .editStaff(userIndex, email: val);
                                          if (staffList.any(
                                              (staff) => staff.email == val)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Email address already exists'),
                                              action: SnackBarAction(
                                                onPressed: () {},
                                                label: "DISMISS",
                                              ),
                                            ));
                                          }
                                        },
                                      ),
                                      YBox(20),
                                      TextInputNoIcon(
                                        fillColor: kLightGreen,
                                        hintText: "Address",
                                        text: "ADDRESS",
                                        outlinedBorder: true,
                                        inputType: TextInputType.streetAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your address';
                                          }
                                          return null;
                                        },
                                      ),
                                      YBox(20),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: staff.skills
                                              .mapIndexed(
                                                (skillIndex, element) => Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    YBox(10),
                                                    Expanded(
                                                        child: TextInputNoIcon(
                                                      fillColor: kLightGreen,
                                                      hintText:
                                                          "skill ${skillIndex + 1}",
                                                      text:
                                                          "SKILL ${skillIndex + 1}",
                                                      outlinedBorder: true,
                                                      inputType:
                                                          TextInputType.text,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter a skill';
                                                        }
                                                        return null;
                                                      },
                                                    )),
                                                    XBox(10),
                                                    Expanded(
                                                        child: IconButtons(
                                                      iconColor: kWine,
                                                      text: "Remove skill",
                                                      icon: Icons.remove,
                                                      bgColor: kPink,
                                                      onPressed: () {
                                                        ref
                                                            .read(
                                                                staffListProvider
                                                                    .notifier)
                                                            .removeSkill(
                                                                userIndex,
                                                                skillIndex);
                                                      },
                                                    )),
                                                    YBox(10),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                      IconButtons(
                                        iconColor: darkGreen,
                                        text: "Add skill",
                                        icon: Icons.add,
                                        bgColor: kLightGreen,
                                        onPressed: () {
                                          ref
                                              .read(staffListProvider.notifier)
                                              .addSkill(userIndex, "");
                                        },
                                      ),
                                      YBox(10),
                                      LargeButton(
                                        outlineButton: true,
                                        onPressed: () {
                                          setState(() {
                                            ref
                                                .read(
                                                    staffListProvider.notifier)
                                                .removeStaff(userIndex);
                                          });
                                        },
                                        title: 'Remove user',
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    YBox(20),
                    LargeButton(
                        title: "Add another User",
                        onPressed: () {
                          ref
                              .read(staffListProvider.notifier)
                              .addStaff(StaffModel());
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar/components/custom_scaffold.dart';
import 'package:simple_calendar/models/calendar/calendar_event.dart';
import 'package:simple_calendar/theme/fontsize.dart';
import 'package:simple_calendar/theme/fontweight.dart';
import 'package:uuid/uuid.dart';

import '../db/datebase_provider.dart';
import '../states/global_state.dart';
import '../theme/spacing.dart';
import '../utils/date_utils.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  CreateEventState createState() => CreateEventState();
}

class CreateEventState extends State<CreateEvent> with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _dateController =
      TextEditingController(text: formatDateTime(DateTime.now()));
  bool _isCycle = true;
  bool _cycleBy = true;
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final themeData = Theme.of(context);
    final isDarkMode = globalState.isDarkMode;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: CustomScaffold(
        body: SingleChildScrollView(
          controller: _controller,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  color: themeData.colorScheme.background,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.m,
                          vertical: Spacing.xs,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: themeData.colorScheme.surface,
                                size: 20,
                              ),
                            ),
                            Text(
                              '添加提醒',
                              style: themeData.textTheme.titleLarge,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await addEvent(() {
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                '完成',
                                style:
                                    themeData.textTheme.titleMedium?.copyWith(
                                  color: themeData.primaryColor,
                                  fontWeight: AppFontWeight.regular,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                ),
                Container(
                  color: themeData.colorScheme.background,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Spacing.s,
                      horizontal: Spacing.m,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: Spacing.s),
                            child: TextFormField(
                              autofocus: true,
                              autocorrect: false,
                              controller: _titleController,
                              decoration: InputDecoration(
                                hintText: "提醒标题",
                                hintStyle: TextStyle(
                                  fontSize: AppFontSize.medium,
                                  fontWeight: AppFontWeight.regular,
                                  color: themeData.colorScheme.secondary,
                                ),
                                filled: true,
                                fillColor: themeData.scaffoldBackgroundColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return "标题不能为空";
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Spacing.s),
                            child: TextFormField(
                              autocorrect: false,
                              controller: _contentController,
                              maxLines: 3,
                              maxLength: 100,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "提醒内容",
                                hintStyle: TextStyle(
                                  fontSize: AppFontSize.medium,
                                  fontWeight: AppFontWeight.regular,
                                  color: themeData.colorScheme.secondary,
                                ),
                                filled: true,
                                fillColor: themeData.scaffoldBackgroundColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDateTimePicker(context, isDarkMode, (picked) {
                                _dateController.text = formatDateTime(picked);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: Spacing.s),
                              child: TextFormField(
                                controller: _dateController,
                                decoration: InputDecoration(
                                  enabled: false,
                                  hintText: "选择时间和日期",
                                  hintStyle: TextStyle(
                                    fontSize: AppFontSize.medium,
                                    fontWeight: AppFontWeight.regular,
                                    color: themeData.colorScheme.secondary,
                                  ),
                                  filled: true,
                                  fillColor: themeData.scaffoldBackgroundColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: themeData.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Colors.transparent, width: 1)
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: Spacing.s,
                              vertical: Spacing.xs,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "循环提醒",
                                      style: TextStyle(
                                        fontSize: AppFontSize.medium,
                                        fontWeight: AppFontWeight.regular,
                                      ),
                                    ),
                                    Switch(
                                      value: _isCycle,
                                      onChanged: (value) {
                                        setState(() {
                                          _isCycle = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Opacity(
                                  opacity: _isCycle ? 1 : 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "按${_cycleBy ? '农历' : '公历'}循环",
                                        style: const TextStyle(
                                          fontSize: AppFontSize.medium,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                      ),
                                      Switch(
                                        value: _cycleBy,
                                        onChanged: _isCycle ? (value) {
                                          setState(() {
                                            _cycleBy = value;
                                          });
                                        } : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    _controller.animateTo(
      keyboardHeight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> addEvent(Null Function() onCreated) async {
    String title = _titleController.text;
    String content = _contentController.text;
    String date = _dateController.text;
    int isCycle = _isCycle ? 1 : 0;
    int cycleBy = _cycleBy ? 1 : 0;
    final currentState = _formKey.currentState;

    if (currentState != null) {
      if (currentState.validate()) {
        final dateTime = DateTime.parse(date);
        final lunar = Lunar.fromDate(dateTime);

        final calendarEvent = CalendarEvent(
          id: const Uuid().v4(),
          dateId: formatDate(date),
          title: title,
          content: content,
          date: getTimestamp(dateTime),
          lunarDate: lunar.toString(),
          isCycle: isCycle,
          cycleBy: cycleBy,
        );

        print("$title, $content, $date, $isCycle, $cycleBy");
        final created = await DatabaseProvider().createEvent(calendarEvent);

        if (created) {
          onCreated();
        }
      }
    }
  }
}

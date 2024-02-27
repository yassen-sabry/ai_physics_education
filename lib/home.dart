import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentStep = 0;
  final ScrollController _controller = ScrollController();
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(File("assets/videos/v2.mp4"));
    controller.initialize().then((value) {
      if (controller.value.isInitialized) {
        controller.play();
        setState(() {});
      } else {
        log("video file load failed");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              children: [
                SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stepper(
                        controlsBuilder: (BuildContext context, ControlsDetails details) {
                          // final _isLastStep = _currentStep == _getSteps.length - 1;
                          return Container(
                              margin: const EdgeInsets.only(top: 50),
                              child: Row(children: [
                                Expanded(
                                    child: ElevatedButton(
                                        child: const Text( 'Next'),
                                        onPressed: details.onStepContinue, )),
                                const SizedBox(
                                  width: 12,
                                ),
                                if (_currentStep != 0)
                                  Expanded(
                                      child: ElevatedButton(
                                          child: const Text('Back'),
                                          onPressed: details.onStepCancel))
                              ]));
                        },
                        steps:  [
                        const Step(
                          title: Text('الهدف'),
                          content: Text('تبسيط وتيسير مادة الفيزياء بمساعدة أدوات الذكاء الاصطناعي مما يؤدي إلى تطور النظام التعليمي'),
                        ),
                        const Step(
                          title: Text('الفرضيات'),
                          content: Text('افترضنا في بداية المشروع أننا سنستعمل chatGPT في تجميع البيانات وخلق الحوارات بين الشخصيات توقعنا أيضا أن أننا سنستعمل موقع elevnlabs لتحويل النص إلى صوت عوضا عن تسجيل صوت بطريقة عادية'),
                        ),
                        const Step(
                            title: Text('المصادر'),
                            content: Text('Plotagon\ncapcut\nChatGPT\nLeonardo.ai\nElevenlabs\nAdobe illustrator'),

                          ),
                        const Step(
                            title: Text('الأجهزة المستخدمة'),
                            content: Text('الهاتف - الجهاز اللوحي - الحاسوب المحمول'),
                        ),
                        const Step(
                              title: Text('الإجرائات'),
                              content: Text('البحث والسؤال عن طريق ChatGPT - التعلم والمطالعة من خلال YouTube ثم التنفيذ والتطبيق عن طريق المواقع والتطبيقات المتنوعة وتكرار المحاولة'),
                            ),
                        const Step(
                            title: Text('المتغيرات'),
                            content: Text('اتبعنا أسلوبين مختلفين في عملنا الأول كان عن طريق انتقاء الصور وتحريكها حتى وصلنا لطريقة تمكننا من عمل فيلم كرتوني بشخصيات مصممة بطريقة تفاعلية'),
                          ),
                        const Step(
                            title: Text('الملاحظات و النتائج'),
                            content: Text('واجهنا العديد من العقبات التي تمكنا من تخطيها مثال تشكيل الكلمات لاحظنا أنه يضر بجودة الصوت والحل كان الاستغناء عن التشكيل كذلك معضلة تأخر الصوت عن الصورة فقمنا بتعديل شريط الصوت حتى يتناسب مع حركة الصورة'),
                          ),
                        const Step(
                            title: Text('الاستنتاجات والتطبيقات'),
                            content: Text('استطعنا تحقيق توقعاتنا والتفوق عليها في الاعتماد على ChatGPT  في خلق النصوص والحوار بين الشخصيات كذلك تمكنا من الاستفادة من موقعelevenlabs.io في تحويل النصوص المكتوبة إلى صوت مسموع'),
                          ),
                          // Step(
                          //   title: const Text('العمل'),
                          //   content: Stack(children: [
                          //     VideoPlayer(controller),
                          //     Positioned(
                          //         bottom: 0,
                          //         child: Column(children: [
                          //           ValueListenableBuilder(
                          //             valueListenable: controller,
                          //             builder: ((context, value, child) {
                          //               int minute = controller.value.position.inMinutes;
                          //               int second = controller.value.position.inSeconds % 60;
                          //               return Text("$minute:$second", style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, backgroundColor: Colors.black54));
                          //             }),
                          //           ),
                          //           ElevatedButton(onPressed: () => controller.play(), child: const Text("Play")),
                          //           ElevatedButton(onPressed: () => controller.pause(), child: const Text("Pause")),
                          //           ElevatedButton(onPressed: () => controller.seekTo(Duration(milliseconds: controller.value.position.inMilliseconds+ 10*1000)), child: const Text("Forward")),
                          //         ])),
                          //   ]),
                          // ),

                      ],
                        onStepTapped: (int newIndex) {
                        setState(() {
                          _currentStep = newIndex;
                        });
                      },
                      currentStep: _currentStep,
                      onStepContinue: () {
                        if (_currentStep != 10) {
                          setState(() {
                            _currentStep += 1;
                          });
                        }
                      },
                      onStepCancel: () {
                        if (_currentStep != 0) {
                          setState(() {
                            _currentStep -= 1;
                          });
                        }
                      },
                      ),
                    ],
                  ),
                ),
              ],
            ),

        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

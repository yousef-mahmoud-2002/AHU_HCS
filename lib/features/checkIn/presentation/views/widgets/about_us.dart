import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AHU - HCS   مرحبًا بكم في'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- نحن فريق مكون من ستة طلاب من جامعة الحسين بن طلال ، من قسمي علم الحاسوب و هندسة البرمجيات في كلية تكنولوجيا المعلومات . يمثل هذا المشروع تتويجًا لجهودنا الأكاديمية ورغبتنا في تقديم حلول مبتكرة لتحديات حقيقية .',
                textDirection: arabic,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              Text(
                '- هدفنا هو تحويل جميع المعاملات الورقية في مركز صحي الجامعة إلى معاملات إلكترونية ، و توفير تجربة مستخدم غنية تتسم بالسهولة و السرعة .',
                textDirection: arabic,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              Text(
                '- يقف خلف هذا المشروع نخبة من الطلاب المبدعين . قمنا بتوحيد مهاراتنا التقنية و إبداعنا و إصرارنا لتحويل هذه الفكرة إلى واقع .',
                textDirection: arabic,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              Text(
                '- المبدعين  :',
                textDirection: arabic,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Text(
                '¬  عبدالله بلاسمه  :  Team Leader and Full-Stack Developer',
                textDirection: arabic,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                '¬  يوسف صويص   :  Mobile App Developer',
                textDirection: arabic,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                '¬  يزيد سمرين  :  Front-End Developer',
                textDirection: arabic,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                '¬  خالد الصمادي : UI/UX and QA',
                textDirection: arabic,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                '¬  اعتماد الجازي  :  Software Engineer',
                textDirection: arabic,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),
              Text(
                '¬  حنين الزكارنه  :  Software Engineer',
                textDirection: arabic,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 24),
              Text(
                '- نحن ممتنون لهذه الفرصة لعرض مشروعنا ومشاركة رؤيتنا معكم. شكرًا لكم على وقتكم واهتمامكم بمشروعنا. نأمل أن تجدوا فيه ما يلبي تطلعاتكم !',
                textDirection: arabic,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

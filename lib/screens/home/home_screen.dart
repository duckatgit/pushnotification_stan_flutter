import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graph_app/api/send_token.dart';
import 'package:graph_app/components/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isProgress = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Token',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: size.height * 0.06,
          child: CustomButton(
            onTap: () async {
              if (!isProgress) {
                setState(() {
                  isProgress = true;
                });
                await sendToken().whenComplete(() {
                  setState(() {
                    isProgress = false;
                  });
                });
              }
            },
            widget: isProgress
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Send Token',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:defi/src/presentation/shared/utils/color.dart';
import 'package:defi/src/services/auth/repo/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Satyam',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Spacer(),
                  const Text(
                    '10000',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SizedBox(
                        height: 22,
                        width: 22,
                        child: Image.asset('assets/coin.png')),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 32),
                height: 420,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.maxFinite,
                height: 54,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorUtils.primary),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Pay',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.maxFinite,
                height: 54,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorUtils.primary),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Recieve',
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

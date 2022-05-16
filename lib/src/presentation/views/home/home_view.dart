import 'package:defi/src/presentation/shared/utils/color.dart';
import 'package:defi/src/services/auth/repo/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/wallet/firestore.dart';
import '../../../services/wallet/wallet_creation.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? selected;
  String? pubAddress;
  String? privAddress;
  String? username;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    details();
  }

  details() async {
    dynamic data = await getUserDetails();
    data != null
        ? setState(() {
            privAddress = data['privateKey'];
            pubAddress = data['publicKey'];
            username = data['user_name'];
            bool created = data['wallet_created'];
            created == true ? selected = 1 : selected = 0;
          })
        : setState(() {
            selected = 0;
          });
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
                  Text(
                    authRepository.user!.email,
                    style: const TextStyle(
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
                child: const Center(
                  child: Text('Previous Transactions'),
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
                  onPressed: () async {
                    setState(() {
                      selected = 1;
                    });
                    WalletAddress service = WalletAddress();
                    final mnemonic = service.generateMnemonic();
                    final privateKey = await service.getPrivateKey(mnemonic);
                    final publicKey = await service.getPublicKey(privateKey);
                    privAddress = privateKey;
                    pubAddress = publicKey.toString();
                    addUserDetails(privateKey, publicKey);
                  },
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

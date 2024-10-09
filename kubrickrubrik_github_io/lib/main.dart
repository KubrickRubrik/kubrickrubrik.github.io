import 'package:flutter/material.dart';
import 'package:kubrickrubrik_github_io/gen/assets.gen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4A5E69),
            Color.fromARGB(255, 40, 52, 58),
          ],
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                const Spacer(),
                Container(
                  height: 300,
                  width: 800,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Assets.images.banner.image(
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: Flex(
              direction: Axis.horizontal,
              children: [
                const Spacer(),
                SizedBox(
                    width: 800,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.hardEdge,
                            child: Assets.images.banner1.image(
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.hardEdge,
                            child: Assets.images.banner2.image(
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.hardEdge,
                            child: Assets.images.banner3.image(
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

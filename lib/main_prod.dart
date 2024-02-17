import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  flavor = Flavor.prod;
  await runner.main();
}

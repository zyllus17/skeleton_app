import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  flavor = Flavor.stg;
  await runner.main();
}

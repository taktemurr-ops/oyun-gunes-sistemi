import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_gunes_sistemi/oyun_gunes_sistemi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(gunesSistemiConfig.title.length, 33);
    expect(gunesSistemiConfig.tagline.length, 33);
    for (final s in gunesSistemiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(gunesSistemiConfig.gameId, gunesSistemiId);
    expect(gunesSistemiRules.gameId, gunesSistemiId);
    expect(gunesSistemiConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(gunesSistemiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: gunesSistemiId, optionalMechanics: gunesSistemiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(gunesSistemiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

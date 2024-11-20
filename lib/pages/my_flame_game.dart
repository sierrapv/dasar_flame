import 'dart:async';
import 'dart:ui';

import 'package:dasar_flame/components/asteroid.dart';
import 'package:dasar_flame/components/asteroid_spawner.dart';
import 'package:dasar_flame/components/bgParallaxComponent.dart';
import 'package:dasar_flame/components/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class MyFlameGame extends FlameGame with PanDetector{
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;
  
  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  FutureOr onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    // Asteroid a = Asteroid();
    // add(a);

    asp = AsteroidSpawner();
    add(asp);

    s = Ship();
    add(s); 
    // add(SpriteComponent(sprite: await loadSprite("ships/spaceShips_001.png")));
  }

  @override
  void onPanUpdate(DragUpdateInfo info){
    s.setTujuan(info);
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }
  
  // @override
  // void onPanUpdate(DragUpdateInfo info) {
  // //   s.position = info.eventPosition.global;
  // }
  } 
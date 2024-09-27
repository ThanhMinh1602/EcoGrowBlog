import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mind_map/mind_map.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColor.lightBackgroundColor,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topMindMap(),
            SizedBox(height: 5.0.h),
            _centerMindMap(),
            SizedBox(height: 5.0.h),
            _bottomMindMap(),
          ],
        ),
      ],
    );
  }

  RotatedBox _bottomMindMap() {
    return RotatedBox(
      quarterTurns: 1,
      child: MindMap(
        dotPath: Path(),
        dotRadius: 0,
        componentWith: 20.0,
        padding: const EdgeInsets.all(0),
        children: [
          MindMap(
            dotPath: Path(),
            padding: const EdgeInsets.all(0),
            children: [
              // bottom left
              MindMap(
                dotPath: Path(),
                padding: const EdgeInsets.all(0),
                children: [
                  MindMap(
                    dotPath: Path(),
                    componentWith: 10,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child:
                            Image.asset(Assets.icons.earth.path, width: 50.0),
                      ),
                    ],
                  ),
                  MindMap(
                    dotPath: Path(),
                    componentWith: 50,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Image.asset(
                          Assets.icons.animalProtection.path,
                          width: 50.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Lottie.asset(
                  width: 180,
                  height: 180,
                  Assets.json.handHeart,
                  frameRate: const FrameRate(100),
                ),
              ),
              // bottom right
              MindMap(
                dotPath: Path(),
                padding: const EdgeInsets.all(0),
                children: [
                  MindMap(
                    dotPath: Path(),
                    componentWith: 50,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Image.asset(
                          Assets.icons.bush1.path,
                          width: 50.0,
                        ),
                      ),
                    ],
                  ),
                  MindMap(
                    dotPath: Path(),
                    componentWith: 10,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Image.asset(
                          Assets.icons.heart.path,
                          width: 50.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topMindMap() {
    return RotatedBox(
      quarterTurns: 3,
      child: MindMap(
        dotPath: Path(),
        dotRadius: 0,
        componentWith: 20.0,
        padding: const EdgeInsets.all(0),
        children: [
          //top left
          MindMap(
            dotPath: Path(),
            padding: const EdgeInsets.all(0),
            children: [
              MindMap(
                dotPath: Path(),
                padding: const EdgeInsets.all(0),
                children: [
                  MindMap(
                    dotPath: Path(),
                    componentWith: 50,
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child:
                            Image.asset(Assets.icons.earth.path, width: 50.0),
                      )
                    ],
                  ),
                  MindMap(
                    dotPath: Path(),
                    componentWith: 150,
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Image.asset(
                          Assets.icons.animalProtection.path,
                          width: 50.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Lottie.asset(
                  width: 180,
                  height: 180,
                  Assets.json.earth,
                  frameRate: const FrameRate(100),
                ),
              ),
              //top right
              MindMap(
                dotPath: Path(),
                padding: const EdgeInsets.all(0),
                children: [
                  MindMap(
                    dotPath: Path(),
                    componentWith: 150,
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Image.asset(
                          Assets.icons.bush1.path,
                          width: 50.0,
                        ),
                      )
                    ],
                  ),
                  MindMap(
                    dotPath: Path(),
                    componentWith: 50,
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Image.asset(
                          Assets.icons.heart.path,
                          width: 50.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _centerMindMap() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.flip(
            flipX: true,
            child: MindMap(
                dotPath: Path(),
                children: const [Icon(Icons.ac_unit_sharp, size: 50.0)])),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 3.0.h),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(50.0.r),
          ),
          child: Text(
            'Donations',
            style: TextStyle(fontSize: 30.0.sp, color: AppColor.whiteColor),
          ),
        ),
        MindMap(
            dotPath: Path(),
            children: const [Icon(Icons.ac_unit_sharp, size: 50.0)]),
      ],
    );
  }
}

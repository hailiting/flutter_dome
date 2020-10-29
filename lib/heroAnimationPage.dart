import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import "dart:math" as math;

class HeroAnimationPage extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Basic Hero Animation",
          ),
        ),
        body: Column(
          children: [
            Text(
              "Radial hero 动画",
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            RadialExpansionDemo(),
            Text(
              "标准Hero",
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            BaseHero(),
          ],
        ));
  }
}

class Photo extends StatelessWidget {
  Photo({Key key, this.photo, this.color, this.onTap});
  final Color color;
  final String photo;
  final VoidCallback onTap;
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Image.network(
              photo,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}

// 外壳
class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);
  final double maxRadius;
  final clipRectSize;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);  // 方行到圆形变化的一个辅助类
  }
  // 目标视图
  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Scaffold(
      appBar: AppBar(
        title: Text(description),
        leading: BackButton(),
      ),
      body: Container(
        color: Theme.of(context).canvasColor,
        child: Center(
          child: Card(
            elevation: 8.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: kMaxRadius * 2.0,
                  height: kMaxRadius * 2.0,
                  child: Hero(
                    createRectTween: _createRectTween,
                    tag: imageName,
                    child: Photo(
                        photo: imageName,
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 2.0,
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // 小视图
  static Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              // PageRouteBuilder 创造一个路由
              Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                // 中转动画
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: opacityCurve.transform(animation.value), // 动画的值转为透明度
                      // 目标页面的视图
                      child: _buildPage(context, imageName, description),
                    );
                  },
                );
              }));
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Container(
      padding: EdgeInsets.all(32.0),
      alignment: FractionalOffset.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 排列方式
        children: [
          _buildHero(
              context,
              "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2258934932,522325728&fm=26&gp=0.jpg",
              "NO1"),
          _buildHero(
              context,
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603964581813&di=5a336a0f95295b50fc4e2db48c636a15&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201502%2F22%2F20150222192306_zJkve.png",
              "NO2"),
          _buildHero(
              context,
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603964616256&di=9240247fc356be6a1e743b0bf9571101&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170315%2F2444169109c94cfdb4cf0bd91617a84d_th.jpg",
              "NO3"),
        ],
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo, // hero动画联系的id
        child: Material(
          color: Colors.transparent,
          child: new InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              )),
        ),
      ),
    );
  }
}

class BaseHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhotoHero(
        photo:
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3515088285,869864046&fm=26&gp=0.jpg",
        width: 100.0,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Flippers Page"),
                  leading: BackButton(),
                ),
                body: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo:
                        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3515088285,869864046&fm=26&gp=0.jpg",
                    width: 100.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ));
          }));
        },
      ),
    );
  }
}

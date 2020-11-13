import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1853432048,1894028532&fm=26&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3930239391,4204479504&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2637385224,354057412&fm=26&gp=0.jpg"
  ];
  double appBarAlpha = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 可以上下滑动的列表  ListView
        // MediaQuery.removeRadding  一个类
        // 用Stack自定义一个appBar  后面的参数在上面
        body: Stack(
      children: [
        MediaQuery.removePadding(
            removeTop: true, // 移除 ListView组件默认设置
            context: context,
            // NotificationListener 监听列表的滚动
            child: NotificationListener(
              onNotification: (scrollNotification) {
                // 滚动且是列表滚动的时候
                // scrollNotification.depth 深度  当 =0 时，定位到ListView，即只监控ListView的滚动
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                // switch (scrollNotification.runtimeType) {
                //   case ScrollStartNotification:
                //     print("开始滚动");
                //     break;
                //   case ScrollUpdateNotification:
                //     print("正在滚动");
                //     break;
                //   case ScrollEndNotification:
                //     print("滚动结束");
                //     break;
                //   case OverscrollNotification:
                //     print("滚动到边界");
                //     break;
                // }
                return false;
              },
              child: ListView(
                children: [
                  Container(
                      color: Theme.of(context).primaryColorLight,
                      height: 100,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        pagination: SwiperPagination(),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.cover,
                          );
                        },
                      )),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text("aaa"),
                    ),
                  )
                ],
              ),
            )),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("首页"),
            )),
          ),
        )
      ],
    ));
  }

  void _onScroll(double pixels) {
    double alpha = pixels/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    } else if(alpha>1){
     alpha=1;
    }
    setState(() {
      appBarAlpha =alpha;
    });
  }
}

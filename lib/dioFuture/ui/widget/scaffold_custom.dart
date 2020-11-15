import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:routerApp/dioFuture/config/index.dart';
import 'package:routerApp/dioFuture/config/net/api.dart';
import 'package:routerApp/dioFuture/config/resource_mananger.dart';

class ScaffoldCustom extends StatefulWidget {
  final String title;
  final Widget titleWidget;
  final double elevation;
  final Widget bottom;
  final Widget body;
  final List<Widget> actions;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final List<Widget> persistentFooterButtons;
  final Widget drawer;
  final Widget endDrawer;
  final Widget bottomSheet;
  final Widget bottomNavigationBar;
  final bool resizeToAvoidBottomPadding;
  final bool resizeToAvoidBottomInset;
  final bool primary;
  final bool extendBody;
  final Color drawerScrimColor;
  final Color backgroundColor;
  final VoidCallback onTapBack;
  final DragStartBehavior drawerDragStartBehavior;
  ScaffoldCustom({
    this.title,
    this.titleWidget,
    this.elevation,
    this.actions,
    this.bottom,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.drawerScrimColor,
    this.backgroundColor,
    this.onTapBack,
  });
  @override
  ScaffoldCustomState createState()=> new ScaffoldCustomState();
}
class ScaffoldCustomState extends State<ScaffoldCustom>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: widget.titleWidget == null? 
        new Text(widget.title??"",
          style: TextStyle(color: Colours.color_333, fontSize: ScreenWH.rsSp(32)),
        ):widget.titleWidget,
        actions: widget.actions,
        bottom: widget.bottom,
        centerTitle: true,
        elevation: 0.0,
        leading: InkWell(
          onTap: widget.onTapBack == null?()=>NavigatorUtils.goBack(context):widget.onTapBack,
          child: Container(
            alignment: AlignmentDirectional.center,
            width: 30,
            height: double.infinity,
            child: Image.asset(ImageHelper.wrapAssets("common/common_arrow_back"),
              width: ScreenWH.rsw(44),height: ScreenWH.rsw(44),
            ),
          ),
        ),
      ),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      extendBody: widget.extendBody,
      drawerScrimColor:widget.drawerScrimColor,
    );
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  void didUpdateWidget(ScaffoldCustom oldWidget){
    super.didUpdateWidget(oldWidget);
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }
}
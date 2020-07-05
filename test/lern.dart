/*
 // 基础样式--谷歌推出的--样式扁平化-大气美观--ios
  StatefullWidget: 动态组件—不断改变
  StatelessWidget: 静态组件-文本框
  它们继承于widget

  VScode-常用快捷键和热键。   flutter upgrade
  R键：点击后热加载
  P键：在虚拟机中显示网格
  O键：切换Anddroid和IOS的预览模式
  Q键：退出调试模式

  基础的widgets:
    容器组件-Container(div)
      new Container({
        Key key,
        this.alignment,
        this.padding, // EdgeInsets.all(): 统一设置；EdgeInsets.fromLTRB(value1,value2,value3,value4)
        Color color, // new Color（0xFFA12626）或者Colors.red--背景色
        Decoration decoration, // 装饰，在这里就是指背景图案
        this.foregroundDecoration,
        double width,
        double height,
        BoxConstraints constraints, // 约束，意思是给child加上额外的约束条件 
        this.margin,  // EdgeInsets.all(): 统一设置；EdgeInsets.fromLTRB(value1,value2,value3,value4)
        this.transform,
        this.child, // 是最重要的元素，即内部布局视图，其定义是一个widget：final Widget child;
      })
      alignment：对齐方式，是相对于父容器位置（含义同Android的align一样，参数值不一样）
          构造函数：
            const Alignment(this.x, this.y)
            : assert(x != null),
            assert(y != null);
            参数范围为：[-1.0，1.0] 表示从顶部到底部或者从左到右。
            居中：Alignment(0.0, 0.0)
            右下角： Alignment(1.0,1.0),
            Alignment.topCenter
      decoration: 装饰，在这里就是指背景图案，可以自定义很多背景样式，边框、圆角、阴影、形状、渐变、背景图像等，
            container背景色（color）和decoration不能同时设置。
            new 

    Row-水平排列
    Column--垂直排列
    Image---图片
      本地和网络
    Text
    Icon
    RaisedButton
    Scaffold
      Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。
      scaffold:带有顶部导航栏,侧边栏,底部导航栏的封装组件
    Appbar
      顶部导航栏,
    FlutterLogo
    Placeholder
      占位控件

  decoration 修饰器


  常用属性：
    textAlign：文本对齐方式: TextAlign.left、TextAlign.right、TextAlign.center、TextAlign.start(从开始的地方对齐)、TextAlign.end（从结束的地方对齐）
    maxLines: 文本显示的最大行数
    overflow：控制文本的溢出效果: TextOverflow.clip(文本截断)、TextOverflow.ellipsis（文本省略）、TextOverflow.fade（渐变、从有到无）
    style:TextStyle(
      fontSize: 25.0,
      color: Color.fromARGB(255, 255, 150, 150),
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dotted
    ),

  MaterialApp({
    Key key,
    this.title = '', // 设备用于为用户识别应用程序的单行描述
    this.home, // 应用程序默认路由的小部件,用来定义当前应用打开的时候，所显示的界面
    this.color, // 在操作系统界面中应用程序使用的主色。
    this.theme, // 应用程序小部件使用的颜色。
    this.routes = const <String, WidgetBuilder>{}, // 应用程序的顶级路由表
    this.navigatorKey, // 在构建导航器时使用的键。
    this.initialRoute, // 如果构建了导航器，则显示的第一个路由的名称
    this.onGenerateRoute, // 应用程序导航到指定路由时使用的路由生成器回调
    this.onUnknownRoute, // 当 onGenerateRoute 无法生成路由(initialRoute除外)时调用
    this.navigatorObservers = const <NavigatorObserver>[], // 为该应用程序创建的导航器的观察者列表
    this.builder, // 用于在导航器上面插入小部件，但在由WidgetsApp小部件创建的其他小部件下面插入小部件，或用于完全替换导航器
    this.onGenerateTitle, // 如果非空，则调用此回调函数来生成应用程序的标题字符串，否则使用标题。
    this.locale, // 此应用程序本地化小部件的初始区域设置基于此值。
    this.localizationsDelegates, // 这个应用程序本地化小部件的委托。
    this.localeListResolutionCallback, // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置。
    this.localeResolutionCallback, // 
    this.supportedLocales = const <Locale>[Locale('en', 'US')], // 此应用程序已本地化的地区列表 
    this.debugShowMaterialGrid = false, // 打开绘制基线网格材质应用程序的网格纸覆盖
    this.showPerformanceOverlay = false, // 打开性能叠加
    this.checkerboardRasterCacheImages = false, // 打开栅格缓存图像的棋盘格
    this.checkerboardOffscreenLayers = false, // 打开渲染到屏幕外位图的图层的棋盘格
    this.showSemanticsDebugger = false, // 打开显示框架报告的可访问性信息的覆盖
    this.debugShowCheckedModeBanner = true, // 在选中模式下打开一个小的“DEBUG”横幅，表示应用程序处于选中模式
  }) 
  有Dart基础知识可以很清楚看出，MaterialApp的构造方法中的每一个参数都是可以省略的，但是官方还是要求[home] ,[routes][onGenerateRoute]这三个参数至少要填写一个。如果只给出路由，则必须包含Navigator.defaultRouteName(/)条目，因为当应用程序以指定不受支持的路由的意图启动时，将使用该条目。


  @immutable--不会改变的类，其实就是类的状态，也就是不变类的实例一旦被创建，其状态就不会发生变化
  abstract class Widget extends DiagnosticableTree {
    const Widget({ this.key });
    final Key key;

    @protected---@protected 作用范围在自身类和子类，如果什么都不加修饰，默认是@protected（外界不可访问，但是可以继承）
    Element createElement();

    @override
    String toStringShort() {
      return key == null ? '$runtimeType' : '$runtimeType-$key';
    }

    @override
    void debugFillProperties(DiagnosticPropertiesBuilder properties) {
      super.debugFillProperties(properties);
      properties.defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.dense;
    }

    static bool canUpdate(Widget oldWidget, Widget newWidget) {
      return oldWidget.runtimeType == newWidget.runtimeType
          && oldWidget.key == newWidget.key;
    }
  }

  abstract class StatefulWidget extends Widget {
    const StatefulWidget({ Key key }) : super(key: key);

    @override
    StatefulElement createElement() => new StatefulElement(this);

    @protected
    State createState();
  }
*/
# LSAnimation
## 包含了常用的核心动画
* 基本动画
* 关键帧动画
* 组动画
* 转场动画

> 调用方式

`AppDelegate`中设置主控制器

```
_window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
/* 将需要设置的控制器类名进行替换即可调用不同的动画 */
Class cls = NSClassFromString(@"KuaiviewController");
UIViewController *vc = [[cls alloc] init];
_window.rootViewController = vc;
[_window makeKeyAndVisible];
```

![show.gif](http://upload-images.jianshu.io/upload_images/2329629-cde8538c96950f97.gif?imageMogr2/auto-orient/strip)

## 旋转动画效果
与调用核心动画的方式一致，只需要在代理方法中指定控制器`LSRotationViewController`

![rotation](http://upload-images.jianshu.io/upload_images/2329629-81b7511b1cb5f510.gif?imageMogr2/auto-orient/strip)



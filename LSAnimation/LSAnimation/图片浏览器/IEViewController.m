//
//  IEViewController.m
//  LSAnimation
//
//  Created by WangBiao on 2016/11/1.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "IEViewController.h"

@interface IEViewController ()

/**
 上一张按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
/**
 索引标签
 */
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
/**
 下一张按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
/**
 序列帧动画imageView
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/**
 图片简介
 */
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

/**
 当展示有顺序有规率的数据时定义一个索引来记录当前是第几张
 */
@implementation IEViewController {
    // 定义成员变量来保存数据
    NSArray *_imageDatas;
    // 记录第几张的索引
    NSInteger _index;
}

#pragma mark - 上一张按钮
- (IBAction)previousBtnClick {
    _index--;
    [self setupUI];
}

#pragma mark - 下一张按钮
- (IBAction)nextBtnClick {
    _index++;
    [self setupUI];
}


#pragma mark - 程序一启动控制器管理的view创建完成后就会调用此方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 给索引初始化
    _index = 0;
    // 加载数据
    _imageDatas = [self loadImagesData];
    
    //这里不再是 self = [super init]...
    self.view = [[[NSBundle mainBundle]loadNibNamed:@"jk_ie" owner:self options:nil]objectAtIndex:0];
    
    // 默认显示第一张
    [self setupUI];
    
}


/**
 1. 通过图片名称去加载图片
 imageNamed:通过此方法加载的图片会被缓存,程序员也无法手动释放,只有收到内存警告时可以释放部分图片内存
 
 2.路径方式去加载图片有注意点:
 2.1.图片不能放在Assets.xcassets这个文件夹中"因为放在此文件中的图片编译后会被打包成.car文件"
 2.2.图片名称一定要加上后缀"png"
 
 
 两种加载图片方式的区别:
 1.通过名称去加载的图片会被缓存,而且一直无法释放
 1.1如果有缓存,下一张再去加载已经加载过的图片,去先去缓存中找,而不是去硬盘"读取速度快"
 1.2如果图片很小/图片使用频率比较高
 
 
 2.通过路径方式去加载的图片不会被缓存,只要没有人用这个图片这个图片就会立即释放"读取速度慢"
 2.2如果图片比较大而且数量也比较多,而且可能就有这么一次就用路径方式去加载
 */

// 设置界面控件数据
- (void)setupUI {
    // 获取数组中的数据
    NSDictionary *dict = _imageDatas[_index];
    // 1.设置索引标签
    self.indexLabel.text = [NSString stringWithFormat:@"%zd / %zd", _index + 1, _imageDatas.count];
    
    // 2.序列帧动画
    NSMutableArray *arrM = [NSMutableArray array];
    // 获取图片张数
    NSInteger imageCount = [dict[@"count"] integerValue];
    
    for (NSInteger i = 0; i < imageCount; i++) {
        // 拼接图片名称
        NSString *imageName = [NSString stringWithFormat:@"ie_img.bundle/%@%03zd", dict[@"icon"], i + 1];
        // 一` 加载图片
        //        UIImage *image = [UIImage imageNamed:imageName];
        
        
        // 二` 通过路径的方式去加载图片
        // 获取图片文件的路径
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        // 通过指定路径去加载图片
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        
        // 添加到数组中
        [arrM addObject:image];
    }
    // 把一组图片转换成动态图片
    UIImage *animationImage = [UIImage animatedImageWithImages:arrM duration:arrM.count * 0.1];
    // 把动态图片设置到imageView控件上
    self.imageView.image = animationImage;
    
    // 3.图片简介
    self.descLabel.text = dict[@"desc"];
    
    
    
    // 判断按钮是否能点击 如果是最后一张让下一张按钮不能点击反之可以点击
    if (_index == _imageDatas.count - 1) {
        self.nextBtn.enabled = NO;
    } else {
        self.nextBtn.enabled = YES;
    }
    
    //    self.nextBtn.enabled = (_index == _imageDatas.count - 1) ? NO : YES;
    //    self.nextBtn.enabled = _index != (_imageDatas.count - 1);
    //    self.nextBtn.enabled = _imageDatas.count - 1 - _index;
    
    
    // 如果是第一张让上一张按钮不能点击反之可以点击
    if (_index == 0) {
        self.previousBtn.enabled = NO;
    } else {
        self.previousBtn.enabled = YES;
    }
    
    //    self.previousBtn.enabled = _index;
}

#pragma mark - 加载plist文件
- (NSArray *)loadImagesData {
    
    /*************** 第一种用本地路径去加载plist ***************/
    // 1.先获取plist文件的全路径"只能获取本地文件路径"
    //    [[NSBundle mainBundle] pathForResource:@"images" ofType:@"plist"];
    //   NSString *path = [[NSBundle mainBundle] pathForResource:@"images.plist" ofType:nil];
    //    // 2.根据指定路径去加载plist文件
    //   NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    
    /*************** 第二种用URL去加载plist ***************/
    //    [[NSBundle mainBundle] URLForResource:@"images" withExtension:@"plist"];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"images.plist" withExtension:nil];
    
    // URL 统一资源定位符"URL它可以获取网络路径/获取本地文件路径"
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    
    
    
    return array;
}

@end

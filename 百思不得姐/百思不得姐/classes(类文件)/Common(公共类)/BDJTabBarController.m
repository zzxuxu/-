//
//  BDJTabBarController.m
//  百思不得姐
//
//  Created by 王健旭 on 2016/11/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

#import "BDJTabBarController.h"
#import "BDJTabBar.h"
#import "BDJMenu.h"
#import "EssenceViewController.h"
#import "NewsViewController.h"

@interface BDJTabBarController ()

@end

@implementation BDJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.tabBar.tintColor = [UIColor colorWithWhite:64.0f/255 alpha:1.0];
    [UITabBar appearance].tintColor = [UIColor colorWithWhite:64.0f/255 alpha:1.0];

    //使用自定制的TabBar
    [self setValue:[[BDJTabBar alloc] init] forKey:@"tabBar"];

    //创建视图控制器
    [self createViewCOntrollers];

    //获取菜单数据
    [self loadMenuData];


}

//获取菜单数据
- (void)loadMenuData {

    NSString *filePath = [self menuFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        //读文件
        NSData *data = [NSData dataWithContentsOfFile:filePath];

        BDJMenu *menu = [[BDJMenu alloc] initWithData:data error:nil];

        //显示
        [self showAllMenuData:menu];
    }

    //更新菜单数据
    [self downloadMenuData];

}

//下载菜单数据
- (void)downloadMenuData {

    //http://s.budejie.com/public/list-appbar/bs0315-iphone-4.3/

    [BDJDownloader downloadWithURLString:@"http://s.budejie.com/public/list-appbar/bs0315-iphone-4.3/" success:^(NSData *data) {

        //解析
        BDJMenu *menu = [[BDJMenu alloc] initWithData:data error:nil];

        NSString *path = [self menuFilePath];

        //如果plist文件不存在，显示菜单数据
        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [self showAllMenuData:menu];
        }

        //存到本地
        [data writeToFile:path atomically:YES];

    } fail:^(NSError *error) {
        NSLog(@"%@", error);
    }];

}

//显示菜单数据
- (void)showAllMenuData:(BDJMenu *)menu {

    //设置精华的菜单数据
    UINavigationController *essenceNavCtrl = [self.viewControllers firstObject];
    EssenceViewController *essenceCtrl = [essenceNavCtrl.viewControllers firstObject];
    essenceCtrl.subMenus = [[menu.menus firstObject] submenus];

    //设置最新的界面的菜单数据
    if (self.viewControllers.count >= 2) {
        UINavigationController *newsNavCtrl = self.viewControllers[1];
        NewsViewController *newsCtrl = [newsNavCtrl.viewControllers firstObject];
        if (menu.menus.count >= 2) {
            newsCtrl.subMenus = [menu.menus[1] submenus];
        }
    }


}

//本地存储菜单数据的文件名
- (NSString *)menuFilePath {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];

    return [docPath stringByAppendingPathComponent:@"menu.plist"];
}


//创建视图控制器
- (void)createViewCOntrollers {

    //1.精华
    [self addSubController:@"EssenceViewController" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon" title:@"精华"];

    //2.最新
    [self addSubController:@"NewsViewController" imageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon" title:@"最新"];

    //3.添加

    //4.关注
    [self addSubController:@"AttentionViewController" imageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon" title:@"关注"];

    //5.我的
    [self addSubController:@"ProfileViewController" imageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon" title:@"我的"];

}

//添加单个视图控制器
- (void)addSubController:(NSString *)ctrlName imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title {

    //1.创建视图控制器对象
    Class cls = NSClassFromString(ctrlName);
    UIViewController *tmpCtrl = [[cls alloc] init];

    //2.设置文字
    tmpCtrl.tabBarItem.title = title;

    //3.图片
    tmpCtrl.tabBarItem.image = [UIImage imageNamed:imageName];
    tmpCtrl.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];

    //4.导航
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:tmpCtrl];

    //5.让tabbar管理这个视图控制器
    [self addChildViewController:navCtrl];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

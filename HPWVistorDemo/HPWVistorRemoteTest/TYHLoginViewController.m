//
//  TYHLoginViewController.m
//  TaiYangHua
//
//  Created by Vieene on 15/12/17.
//  Copyright © 2015年 hhly. All rights reserved.
//

#import "TYHLoginViewController.h"
#import "HPWVistor.h"
#import "HPWVistorSDKConfig.h"

@interface TYHLoginViewController ()<HPWVistorDelegate>


@property (weak, nonatomic) IBOutlet UIButton *userID;
@property (weak, nonatomic) IBOutlet UIButton *something1;
@property (weak, nonatomic) IBOutlet UIButton *something2;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (nonatomic,strong) UIButton *unReadNum;
@property (nonatomic,assign) BOOL isEdit;

@end
@implementation TYHLoginViewController

- (instancetype)init {
    self = [super init];
    if (self) {
       
    }
    return self;
}
- (IBAction)setUserID:(id)sender {
    [[HPWVistor sharedVistor] setPartnerUid:@"abcdefghijk"];
//    WKDAlertMessage(@"本地存储用户id", @"");

}
- (IBAction)something1:(id)sender {
    [[HPWVistor sharedVistor] addTrajectoryInfo:@"1111111" pageTitle:@"访客发送的轨迹事件1" resolution:@"333333" sourceUrl:@"44444" result:^{
//        WKDAlertMessage(@"设置事件1", @"成功");
    } fail:^{
//        WKDAlertMessage(@"设置事件1", @"失败");

    }];
}
- (IBAction)something2:(id)sender {
    [[HPWVistor sharedVistor] addTrajectoryInfo:@"aaaaaa" pageTitle:@"访客发送的轨迹事件2" resolution:@"cccccc" sourceUrl:@"dddddde" result:^{
            NSLog(@"设置事件2");
    } fail:^{
            NSLog(@"设置事件2");
    }];
}
- (IBAction)clearGuiji:(UIButton *)sender{
    [[HPWVistor sharedVistor] clearTrajectoryInfo];
    NSLog(@"清除轨迹");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubView];
    [HPWVistor sharedVistor].delegate = self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[HPWVistor sharedVistor] queryUnreadNumMessageSucceed:^(NSInteger num) {
            NSLog(@"主动获取的未读数=%zd",num);
            [self vistorUnReadMessageNum:num];
        }];
    });
}

- (void)setSubView {
    
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.title = @"访客端演示demo";
    _unReadNum = [UIButton buttonWithType:UIButtonTypeCustom];
    _unReadNum.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [_unReadNum setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_unReadNum sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_unReadNum];
}
#pragma mark -- 联系客服
- (IBAction)login:(UIButton *)sender {
    //3、弹出访客端界面
    [[HPWVistor sharedVistor] showView:self dismissCompletion:^{
        NSLog(@"关闭了SDK");
    } errorFail:^{
        NSLog(@"出现网络错误");
    }];
}


#pragma mark - HPWVistorDelegate

/**
 SDK收到了新消息
 */
- (void)vistorDidReceiveMessage:(NSString *)content{
    NSLog(@"收到了消息------------%@--",content);
}

/**
 访客端的消息的未读数
 */
- (void)vistorUnReadMessageNum:(NSInteger)num
{
    [_unReadNum setTitle:[NSString stringWithFormat:@"未读数=%zd",num] forState:UIControlStateNormal];
    [_unReadNum sizeToFit];
    
}

@end

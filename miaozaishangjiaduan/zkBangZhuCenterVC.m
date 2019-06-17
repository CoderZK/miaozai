//
//  zkBangZhuCenterVC.m
//  miaozaishangjiaduan
//
//  Created by kunzhang on 2017/5/25.
//  Copyright © 2017年 kunzhang. All rights reserved.
//

#import "zkBangZhuCenterVC.h"
#import "NSString+Size.h"
#import <MJRefresh.h>
//屏幕的长宽
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
//白底黑字
#define CharacterBlackColor [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1]

#define lineBackColor [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]

@interface zkBangZhuCenterVC ()

@end

@implementation zkBangZhuCenterVC


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIButton * leftBt =[UIButton buttonWithType:UIButtonTypeCustom];
    leftBt.frame = CGRectMake(0, 0, 24, 24);
    [leftBt setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBt addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    leftBt.tag = 255;
    UIBarButtonItem * leftItme =[[UIBarButtonItem alloc] initWithCustomView:leftBt];
    self.navigationItem.leftBarButtonItem = leftItme;
    
    
    
    self.view.backgroundColor =[UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    
    self.navigationItem.title = @"帮助";
    
    UIView * headV =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 20)];
    headV.backgroundColor =[UIColor whiteColor];
    
    
    UIImageView * imgV =[[UIImageView alloc] initWithFrame:CGRectMake(ScreenW /2.0 - 40 , 30, 80, 80)];
    imgV.layer.cornerRadius = 0;
    imgV.clipsToBounds = YES;
    imgV.image = [UIImage imageNamed:@"369369369"];
    [headV addSubview:imgV];
    
    UILabel * titleLB =[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imgV.frame) + 15 , ScreenW - 20, 20)];
    titleLB.numberOfLines = 0;
    titleLB.font =[UIFont boldSystemFontOfSize:18];
    titleLB.text = @"遇到问题的小伙伴可以通过以下方式联系我们";
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.textColor = CharacterBlackColor;
    
    titleLB.attributedText = [titleLB.text getMutableAttributeStringWithFont:18 lineSpace:3 textColor:CharacterBlackColor];
    titleLB.mj_h = [titleLB.text getHeigtWithFontSize:18 lineSpace:3 width:ScreenW - 20];
    
    [headV addSubview:titleLB];
    UILabel * dainHuaLB =[[UILabel alloc] init];
    dainHuaLB.mj_y =CGRectGetMaxY(titleLB.frame) + 15;
    dainHuaLB.mj_h = 20;
    dainHuaLB.font =[UIFont systemFontOfSize:16];
    dainHuaLB.textAlignment = NSTextAlignmentCenter;
    dainHuaLB.text = @"联系电话:400-420-4480";
    
    CGFloat ww = [dainHuaLB.text getSizeWithMaxSize:CGSizeMake(ScreenW -20, 20) withFontSize:16].width;
    dainHuaLB.mj_x = (ScreenW - ww) / 2;
    dainHuaLB.mj_w = ww;
    
    
    dainHuaLB.textColor = CharacterBlackColor;
    [headV addSubview:dainHuaLB];
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(CGRectGetMaxX(dainHuaLB.frame) + 15 , CGRectGetMinY(dainHuaLB.frame) - 5 , 40, 30);
    button.tag = 99;
    [button setImage:[UIImage imageNamed:@"zk_call"] forState:UIControlStateNormal];
    button.layer.cornerRadius = 0;
    button.clipsToBounds = YES;
    [headV addSubview:button];
    
    UILabel * QQLB =[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(dainHuaLB.frame) + 10 , ScreenW - 20, 20)];
    QQLB.numberOfLines = 0;
    QQLB.font =[UIFont systemFontOfSize:18];
    QQLB.text = @"QQ: 457896451";
    QQLB.textAlignment = NSTextAlignmentCenter;
    QQLB.textColor = CharacterBlackColor;
    [headV addSubview:QQLB];
    
    
    UILabel * emailLB =[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(QQLB.frame) + 10 , ScreenW - 20, 20)];
    emailLB.numberOfLines = 0;
    emailLB.font =[UIFont boldSystemFontOfSize:18];
    emailLB.text = @"Email:miaozai@gmail.com";
    emailLB.textAlignment = NSTextAlignmentCenter;
    emailLB.textColor = CharacterBlackColor;
    [headV addSubview:emailLB];
    
    
    
    UIView * backV =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(emailLB.frame) + 40, ScreenW, 0.4)];
    backV.backgroundColor = lineBackColor;
    [headV addSubview:backV];
    
    headV.mj_h = CGRectGetMaxY(backV.frame) ;
    
    [button addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: headV];
    
    
}

- (void)actionClick:(UIButton *)button {
    
        //打电话
        UIAlertController * alertVC =[UIAlertController alertControllerWithTitle:@"提示" message:@"是否呼叫:4006-898-767" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *num = @"tel://4006-898-767";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
            
        }];
        
        [alertVC addAction:action1];
        [alertVC addAction:action2];
        
        [self presentViewController:alertVC animated:YES completion:nil];
        
        
  
    
    
    
}

- (void)itemAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
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

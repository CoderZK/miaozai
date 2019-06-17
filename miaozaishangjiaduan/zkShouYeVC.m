//
//  zkShouYeVC.m
//  miaozaishangjiaduan
//
//  Created by kunzhang on 2017/5/25.
//  Copyright © 2017年 kunzhang. All rights reserved.
//

#import "zkShouYeVC.h"
#import "zkSettingVC.h"
#import "zkYanPiaoVC.h"

@interface zkShouYeVC ()

@end

@implementation zkShouYeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)yanpianAction:(id)sender {
    zkYanPiaoVC * vc =[[zkYanPiaoVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//设置
- (IBAction)SettingAction:(id)sender {
    zkSettingVC * vc =[[zkSettingVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
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

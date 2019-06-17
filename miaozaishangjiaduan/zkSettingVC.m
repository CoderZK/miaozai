//
//  zkSettingVC.m
//  miaozaishangjiaduan
//
//  Created by kunzhang on 2017/5/25.
//  Copyright © 2017年 kunzhang. All rights reserved.
//

#import "zkSettingVC.h"
#import "zkOtherPeopleCell.h"
#import <MJRefresh.h>
#import "Clear.h"
#import "zkBangZhuCenterVC.h"
//屏幕的长宽
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface zkSettingVC ()<UITableViewDelegate,UITableViewDataSource>
/*可以看到的注释*/
@property (nonatomic , strong)UITableView * tableView;


@end

@implementation zkSettingVC

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,ScreenW, ScreenH) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle =UITableViewCellSelectionStyleNone;
    }
    
    return _tableView;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * leftBt =[UIButton buttonWithType:UIButtonTypeCustom];
    leftBt.frame = CGRectMake(0, 0, 24, 24);
    [leftBt setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBt addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    leftBt.tag = 255;
    UIBarButtonItem * leftItme =[[UIBarButtonItem alloc] initWithCustomView:leftBt];
    self.navigationItem.leftBarButtonItem = leftItme;
    
    
    [self.view addSubview:self.tableView];
    
    self.tableView.backgroundColor =[UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    
    UIButton * outLoginBt =[UIButton buttonWithType:UIButtonTypeCustom];
    outLoginBt.frame = CGRectMake(20, 180, ScreenW - 40, 50);
    outLoginBt.titleLabel.font = [UIFont systemFontOfSize:18];
    [outLoginBt setTitle:@"退出账号" forState:UIControlStateNormal];
    outLoginBt.layer.cornerRadius = 5;
    outLoginBt.clipsToBounds = YES;
    [outLoginBt setBackgroundImage:[UIImage imageNamed:@"zk_redback"] forState:UIControlStateNormal];
    [outLoginBt addTarget:self action:@selector(outLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:outLoginBt];
    
    
    
}

//退出登录
- (void)outLoginAction:(UIButton *)button {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *vc = [story instantiateViewControllerWithIdentifier:@"BBB"];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = vc ;
    
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 15;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else {
        return 2;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    zkOtherPeopleCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell== nil) {
        cell = [[zkOtherPeopleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.blackVOne.hidden = NO;
    cell.imgV.hidden = NO;
    cell.rightLB.hidden = NO;
    cell.rightLB.hidden = NO;
    if (indexPath.section == 0) {
        cell.imgV.hidden = YES;
        cell.blackVTwo.mj_x = 0;
        cell.blackVTwo.mj_w = ScreenW;
        cell.leftLB.text = @"账号";
        cell.rightLB.text = @"4582689585585";
    } else {
        if (indexPath.row == 0) {
            cell.rightLB.hidden = YES;
            cell.blackVTwo.mj_x = 15;
            cell.blackVTwo.mj_w = ScreenW -30;
            cell.leftLB.text = @"帮助";

        }else {
            cell.blackVOne.hidden = YES;
            cell.blackVTwo.hidden = NO;
            cell.imgV.hidden = YES;
            cell.rightLB.hidden = NO;
            cell.blackVTwo.mj_x = 0;
            cell.blackVTwo.mj_w = ScreenW;
            CGFloat MM = [Clear folderSizeAtPath];
            cell.rightLB.text =  [NSString stringWithFormat:@"%0.2fM",MM];
            cell.leftLB.text = @"清楚缓存";
        
        }
        
        
        
    }
    
    
    
    return cell;
    
}

- (void)itemAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1 && indexPath.row == 0) {
       
        zkBangZhuCenterVC * vc =[[zkBangZhuCenterVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2) {
        [Clear cleanCache:^{
            
            [self.tableView reloadData];
            
        } ];
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

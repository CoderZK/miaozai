//
//  ViewController.m
//  miaozaishangjiaduan
//
//  Created by kunzhang on 2017/5/25.
//  Copyright © 2017年 kunzhang. All rights reserved.
//

#import "ViewController.h"
#import "zkShouYeVC.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passWordTf;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    
    // Do any additional setup after loading the view, typically from a nib.
}

//点击登录
- (IBAction)loginAction:(id)sender {
    
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    UINavigationController *vc = [story instantiateViewControllerWithIdentifier:@"AAA"];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = vc ;
    
    
}
- (IBAction)yanjingAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    self.passWordTf.secureTextEntry = sender.selected;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

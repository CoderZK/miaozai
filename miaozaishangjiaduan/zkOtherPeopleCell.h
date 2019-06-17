//
//  zkOtherPeopleCell.h
//  miaozaishangjiaduan
//
//  Created by kunzhang on 2017/5/25.
//  Copyright © 2017年 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zkOtherPeopleCell : UITableViewCell
/*名字label*/
@property (nonatomic , strong)UILabel * leftLB;
/*右边的lB*/
@property (nonatomic , strong)UILabel * rightLB;
/*图片*/
@property (nonatomic , strong)UIImageView * imgV;

/*上面的黑线*/
@property (nonatomic , strong)UIView * blackVOne;
/*下面的黑线*/
@property (nonatomic , strong)UIView * blackVTwo;
@end

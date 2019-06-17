//
//  zkOtherPeopleCell.m
//  miaozaishangjiaduan
//
//  Created by kunzhang on 2017/5/25.
//  Copyright © 2017年 kunzhang. All rights reserved.
//

#import "zkOtherPeopleCell.h"
//屏幕的长宽
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
//白底黑字
#define CharacterBlackColor [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1]

#define lineBackColor [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]


@implementation zkOtherPeopleCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //左侧
        self.leftLB =[[UILabel alloc] initWithFrame:CGRectMake(15, 12.5, 200, 20)];
        self.leftLB.font =[UIFont systemFontOfSize:14];
        self.leftLB.textColor =CharacterBlackColor;
        [self addSubview:self.leftLB];
        
        //图片
        self.imgV =[[UIImageView alloc] initWithFrame:CGRectMake(ScreenW - 12-15, 16.5, 12, 12)];
        self.imgV.image = [UIImage imageNamed:@"LYYou"];
        [self addSubview:self.imgV];
        
        //右侧Lb
        self.rightLB =[[UILabel alloc] initWithFrame:CGRectMake(ScreenW- 150-15, 12.5, 150, 20)];
        self.rightLB.font =[UIFont systemFontOfSize:14];
        self.rightLB.textAlignment = NSTextAlignmentRight;
        self.rightLB.textColor =CharacterBlackColor;
        [self addSubview:self.rightLB];
        
        
        self.blackVOne =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 0.4)];
        self.blackVOne.backgroundColor =lineBackColor;
        [self addSubview:self.blackVOne];
        
        self.blackVTwo =[[UIView alloc] initWithFrame:CGRectMake(0, 44.6, ScreenW, 0.4)];
        self.blackVTwo.backgroundColor =lineBackColor;
        [self addSubview:self.blackVTwo];
        
        
    }
    
    
    
    
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  NSString+Size.h
//  buqiuren
//
//  Created by 李晓满 on 16/9/13.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

// 字典转json字符串方法

+(NSString *)convertToJsonData:(NSDictionary *)dict;
// 电话号码验证
-(BOOL) verifyPhone;

/**
 获得字符串的大小
 */

-(CGSize)getSizeWithMaxSize:(CGSize)maxSize withFontSize:(int)fontSize;

//根据行间距 和 行的宽 字的大小计算行的高度

- (CGFloat)getHeigtWithFontSize:(int)fontSize lineSpace:(int )lineSpace width:(NSInteger )widht;
- (NSMutableAttributedString *)getMutableAttributeStringWithFont:(int)fontSize lineSpace:(int)lineSpace textColor:(UIColor *)color;


/**
把字符串装换成日期型的格式化字符串
 */
+(NSString *)stringWithDateStrwithyymmddHHmm:(NSNumber *)str;

/**
 把字符串装换成日期型的格式化字符串
 */
+(NSString *)stringWithDateStrwithyymmdd:(NSNumber *)str;


/** 根据时间进行判断返回时间*/
+(NSString *)stringWithDateStr:(NSNumber *)str;

/** 根据时间进行判断返回时间*/
+(NSString *)ImgstringWithStr:(NSString *)str;

/* MD5字符串 */
+ (NSString *)stringToMD5:(NSString *)str;


/**
 *  汉字的拼音
 *
 *  @return 拼音
 */
- (NSString *)pinyin;


+ (NSString *)getImgNameWithScore:(CGFloat )score;

+ (NSString *)getStataStrWithStr1:(NSString *)joinObject andStr2:(NSString *)joinPeropleNum addStr3:(NSString *)isSameSchool;
+ (NSString *)getDomainImgWith:(NSString *)domain;

+ (NSString *)getXingzuo:(NSDate *)in_date;
+ (NSString *)dateToOld:(NSDate *)bornDate;
@end

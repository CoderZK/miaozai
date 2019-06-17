//
//  NSString+Size.m
//  buqiuren
//
//  Created by 李晓满 on 16/9/13.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "NSString+Size.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Size)

// 字典转json字符串方法

+(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}


// 电话号码验证

-(BOOL) verifyPhone
{
    
    NSString * phoneString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9]|7[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phoneString] == YES)
        || ([regextestcm evaluateWithObject:phoneString] == YES)
        || ([regextestct evaluateWithObject:phoneString] == YES)
        || ([regextestcu evaluateWithObject:phoneString] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}


/**
 获得字符串的大小
 */

-(CGSize)getSizeWithMaxSize:(CGSize)maxSize withFontSize:(int)fontSize
{
    CGSize size=[self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size;
    return size;
}


- (CGFloat)getHeigtWithFontSize:(int)fontSize lineSpace:(int )lineSpace width:(NSInteger )widht {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, self.length)];
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];

    CGFloat height = [attributedString boundingRectWithSize:CGSizeMake(widht, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  context:nil].size.height;

    return height;
}

- (NSMutableAttributedString *)getMutableAttributeStringWithFont:(int)fontSize lineSpace:(int)lineSpace textColor:(UIColor *)color{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, self.length)];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.length)];
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    return attributedString;
    
}


+(NSString *)stringWithDateStrwithyymmddHHmm:(NSNumber *)str
{
    //以毫秒为单位 就除以1000 默认以秒为单位
    long long beTime = [str longLongValue];//1000.0;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy/MM/dd HH:mm"];
    distanceStr = [df stringFromDate:beDate];
    return distanceStr;
}

+(NSString *)stringWithDateStrwithyymmdd:(NSNumber *)str {
    //以毫秒为单位 就除以1000 默认以秒为单位
    long long beTime = [str longLongValue];//1000.0;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm"];
    distanceStr = [df stringFromDate:beDate];
    return distanceStr;
}


//根据时间判断
+(NSString *)stringWithDateStr:(NSNumber *)str
{
    //以毫秒为单位 就除以1000 默认以秒为单位
    long long beTime = [str longLongValue];//1000.0;
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    double distanceTime = now - beTime;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"yyyy"];
    NSString * nowYear = [df stringFromDate:[NSDate date]];
    NSString * lastYear = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if (distanceTime < 60)
    {   //小于一分钟
        distanceStr = @"刚刚";
    }
    else if (distanceTime < 60*60)
    {   //时间小于一个小时
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    }
    else if(distanceTime < 24*60*60 && [nowDay integerValue] == [lastDay integerValue])
    {  //时间小于一天
        distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
    }
    else if(distanceTime< 24*60*60*2 && [nowDay integerValue] != [lastDay integerValue])
    {
        if ([nowDay integerValue] - [lastDay integerValue] == 1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1))
        {
            distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
        }
        else
        {
            [df setDateFormat:@"HH:mm"];
            distanceStr = [NSString stringWithFormat:@"前天 %@",[df stringFromDate:beDate]];
        }
    
    }
    else if(distanceTime < 24*60*60*365)
    {
        if ([nowDay integerValue] - [lastDay integerValue] == 2 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1))
        {//包含前天的部分
            [df setDateFormat:@"HH:mm"];
            distanceStr = [NSString stringWithFormat:@"前天 %@",[df stringFromDate:beDate]];
        }
        else
        {
            if ([nowYear integerValue] == [lastYear integerValue])
            {//包含今年的部分
                [df setDateFormat:@"MM-dd HH:mm"];
                distanceStr = [df stringFromDate:beDate];
            }
            else
            {
                [df setDateFormat:@"yyyy-MM-dd HH:mm"];
                distanceStr = [df stringFromDate:beDate];
            }
        }
    }
    else
    {
        [df setDateFormat:@"yyyy-MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    return distanceStr;
    
}

/* MD5字符串 */
+ (NSString *)stringToMD5:(NSString *)str{
    const char *fooData = [str UTF8String];//UTF-8编码字符串
    unsigned char result[CC_MD5_DIGEST_LENGTH];//字符串数组，接收MD5
    CC_MD5(fooData, (CC_LONG)strlen(fooData), result);//计算并存入数组
    NSMutableString *saveResult = [NSMutableString string];//字符串保存加密结果
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [saveResult appendFormat:@"%02x", result[i]];
    }
    return saveResult;
}


//汉字的拼音
- (NSString *)pinyin{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform(( CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (NSString *)getImgNameWithScore:(CGFloat)score {
    CGFloat aa =  score;
    NSString * xingStr = @"0";
    if (aa < 0.1) {
        xingStr = @"10";
    }else if (aa <= 0.9) {
        xingStr = @"11";
    }else if (aa <= 1.4) {
        xingStr = @"12";
    }else if (aa <= 1.9) {
        xingStr = @"13";
    }else if (aa <= 2.4) {
        xingStr = @"14";
    }else if (aa <= 2.9) {
        xingStr = @"15";
    }else if (aa <= 3.4) {
        xingStr = @"16";
    }else if (aa <= 3.9) {
        xingStr = @"17";
    }else if (aa <= 4.4) {
        xingStr = @"18";
    }else if (aa <= 4.9) {
        xingStr = @"19";
    }else  {
        xingStr = @"20";
    }

    return  [NSString stringWithFormat:@"zk_xing%@",xingStr];
}

+ (NSString *)getStataStrWithStr1:(NSString *)joinObject andStr2:(NSString *)joinPeropleNum addStr3:(NSString *)isSameSchool{
    if (([joinObject isEqualToString:@"0"] || [joinObject isEqualToString:@"1"]) && ([joinPeropleNum isEqualToString:@"0"] || [joinPeropleNum isEqualToString:@"1"]) && [isSameSchool isEqualToString:@"0"]) {
        return @"1";
    }else if (![joinObject isEqualToString:@"0"] && ![joinObject isEqualToString:@"1"] && ([joinPeropleNum isEqualToString:@"0"] || [joinPeropleNum isEqualToString:@"1"]) && [isSameSchool isEqualToString:@"0"]){
        return @"2";
    }else if (([joinObject isEqualToString:@"0"] || [joinObject isEqualToString:@"1"]) && ![joinPeropleNum isEqualToString:@"0"] && ![joinPeropleNum isEqualToString:@"1"] && [isSameSchool isEqualToString:@"0"]){
        return @"3";
    }else if (![joinObject isEqualToString:@"0"] && ![joinObject isEqualToString:@"1"] && ![joinPeropleNum isEqualToString:@"0"] && ![joinPeropleNum isEqualToString:@"1"] && [isSameSchool isEqualToString:@"0"]){
        return @"4";
    }else if (([joinObject isEqualToString:@"0"] || [joinObject isEqualToString:@"1"]) && ([joinPeropleNum isEqualToString:@"0"] || [joinPeropleNum isEqualToString:@"1"]) && ![isSameSchool isEqualToString:@"0"]){
        return @"5";
    }else if (![joinObject isEqualToString:@"0"] && ![joinObject isEqualToString:@"1"] && ([joinPeropleNum isEqualToString:@"0"] || [joinPeropleNum isEqualToString:@"1"]) && ![isSameSchool isEqualToString:@"0"]){
        return @"6";
    }else if (([joinObject isEqualToString:@"0"] || [joinObject isEqualToString:@"1"]) && ![joinPeropleNum isEqualToString:@"0"] && ![joinPeropleNum isEqualToString:@"1"] && ![isSameSchool isEqualToString:@"0"]){
        return @"7";
    }else{
        return @"8";
    }
}

+ (NSString *)getDomainImgWith:(NSString *)domain{
    if ([domain isEqualToString:@"学习"]) {
        return @"find_xuexi_1";
    }else if ([domain isEqualToString:@"拼车"]){
        return @"find_pinche_1";
    }else if ([domain isEqualToString:@"吃饭"] || [domain isEqualToString:@"约饭"]){
        return @"find_yuefan";
    }else if ([domain isEqualToString:@"运动"]){
        return @"find_yundong_1";
    }else if ([domain isEqualToString:@"游戏"]){
        return @"find_youxi_1";
    }else if ([domain isEqualToString:@"其他"]){
        return @"find_qita";
    }else if ([domain isEqualToString:@"电影"]){
        return @"find_dianying_1";
    }else{
        return @"find_kge";
    }
}

+ (NSString *)getXingzuo:(NSDate *)in_date
{
    //计算星座
    NSString *retStr=@"";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM"];
    int i_month=0;
    NSString *theMonth = [dateFormat stringFromDate:in_date];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        i_month = [[theMonth substringFromIndex:1] intValue];
    }else{
        i_month = [theMonth intValue];
    }
    
    [dateFormat setDateFormat:@"dd"];
    int i_day=0;
    NSString *theDay = [dateFormat stringFromDate:in_date];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        i_day = [[theDay substringFromIndex:1] intValue];
    }else{
        i_day = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    switch (i_month) {
        case 1:
            if(i_day>=20 && i_day<=31){
                retStr=@"水瓶座";
            }
            if(i_day>=1 && i_day<=19){
                retStr=@"摩羯座";
            }
            break;
        case 2:
            if(i_day>=1 && i_day<=18){
                retStr=@"水瓶座";
            }
            if(i_day>=19 && i_day<=31){
                retStr=@"双鱼座";
            }
            break;
        case 3:
            if(i_day>=1 && i_day<=20){
                retStr=@"双鱼座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"白羊座";
            }
            break;
        case 4:
            if(i_day>=1 && i_day<=19){
                retStr=@"白羊座";
            }
            if(i_day>=20 && i_day<=31){
                retStr=@"金牛座";
            }
            break;
        case 5:
            if(i_day>=1 && i_day<=20){
                retStr=@"金牛座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"双子座";
            }
            break;
        case 6:
            if(i_day>=1 && i_day<=21){
                retStr=@"双子座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"巨蟹座";
            }
            break;
        case 7:
            if(i_day>=1 && i_day<=22){
                retStr=@"巨蟹座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"狮子座";
            }
            break;
        case 8:
            if(i_day>=1 && i_day<=22){
                retStr=@"狮子座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"处女座";
            }
            break;
        case 9:
            if(i_day>=1 && i_day<=22){
                retStr=@"处女座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"天秤座";
            }
            break;
        case 10:
            if(i_day>=1 && i_day<=23){
                retStr=@"天秤座";
            }
            if(i_day>=24 && i_day<=31){
                retStr=@"天蝎座";
            }
            break;
        case 11:
            if(i_day>=1 && i_day<=21){
                retStr=@"天蝎座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"射手座";
            }
            break;
        case 12:
            if(i_day>=1 && i_day<=21){
                retStr=@"射手座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"摩羯座";
            }
            break;
    }
    return retStr;
}

+ (NSString *)dateToOld:(NSDate *)bornDate{
    //获得当前系统时间
    NSDate *currentDate = [NSDate date];
    //获得当前系统时间与出生日期之间的时间间隔
    NSTimeInterval time = [currentDate timeIntervalSinceDate:bornDate];
    //时间间隔以秒作为单位,求年的话除以60*60*24*356
    int age = ((int)time)/(3600*24*365);
    return [NSString stringWithFormat:@"%d",age];
}

@end

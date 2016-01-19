//
//  NSDate+RandomDate.m
//  Lesson 35 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "NSDate+RandomDate.h"

@implementation NSDate (RandomDate)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* components = [[NSDateComponents alloc] init];
    
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    return [calendar dateFromComponents:components];
}


+ (NSDate *)randomDateFromYear:(NSInteger)fromYear toYear:(NSInteger)toYear {
    
    NSCalendar* currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents* comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    
    [comps setYear:arc4random() % (toYear - fromYear) + fromYear];
    
    //[comps setYear:arc4random_uniform(toYear - fromYear) + fromYear];
    
    [comps setMonth:arc4random_uniform(12)];
    
    NSRange range = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[currentCalendar dateFromComponents:comps]];
    
    [comps setDay:arc4random() % (range.length)];
    
    //[comps setDay:arc4random_uniform(range.length)];
    
    // Normalise the time portion
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    [comps setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    return [currentCalendar dateFromComponents:comps];
}

@end

//
//  NSDate+RandomDate.h
//  Lesson 35 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RandomDate)

+ (NSDate*) dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

+ (NSDate*) randomDateFromYear:(NSInteger)fromYear toYear:(NSInteger)toYear;

@end

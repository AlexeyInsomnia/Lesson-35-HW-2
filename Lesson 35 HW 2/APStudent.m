//
//  APStudent.m
//  Lesson 35 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APStudent.h"
#import <UIKit/UIKit.h>
#import "NSDate+RandomDate.h"

@implementation APStudent

static NSString* firstNames[] = {@"John", @"Tom", @"Alex", @"Bob", @"Peter", @"Homer", @"Eric", @"Thomasine",
    @"Shakia", @"Pearlene", @"Kelli", @"Amelia", @"Barney", @"Penney", @"Loren", @"Joann",
    @"Doreatha", @"Stefanie",@"Elliot", @"Shawana", @"Corliss", @"Lynsey", @"Carlita",@"Phylicia",
    @"Ava", @"Harrison", @"Magaly", @"Despina", @"Alisha", @"Loraine", @"Jewell", @"Micheline",
    @"Nydia", @"Woodrow", @"Kazuko", @"Lajuana", @"Melonie",};


static NSString* lastNames[] = {@"Golt", @"Brown", @"Green", @"Smith", @"Griffin", @"Simpson", @"Cartman", @"Maldonado",
    @"Ward", @"Joseph", @"Richards", @"Juarez", @"Carney", @"Hawkins",  @"Lester", @"Underwood",
    @"Strickland", @"Burns", @"Thompson", @"Tran", @"Kane", @"Vincent", @"Peck", @"Lambert", @"Roy",
    @"Deleon", @"Colon", @"Richmond", @"Landry", @"Baxter", @"Flowers", @"Herrera", @"Guzman", @"Wyatt",
    @"Holloway", @"Swanson", @"Mcneil"};
static int namesCount = 37;



+(APStudent*)randomStudent {
    
    static const NSInteger fromYear = 1978;
    static const NSInteger toYear = 2000;
    
    APStudent* student = [[APStudent alloc] init];
    
    student.firstName = firstNames[arc4random_uniform(namesCount)];
    student.lastName = lastNames[arc4random_uniform(namesCount)];
    student.dateOfBirth = [NSDate randomDateFromYear:fromYear toYear:toYear];
    
    
    return student;
}




-(NSString*)stringOfDateBirth {
    return [self dateOfBirthWithFormatStyle:@"dd.MM.yyyy"];
}

-(NSString*)monthOfBirth {
    return [self dateOfBirthWithFormatStyle:@"MMM"];
}

-(NSString*)monthOfBirthNumericValue {
    return [self dateOfBirthWithFormatStyle:@"MM"];
}

-(NSString*)lastNameAndFirstNameString {
    return [NSString stringWithFormat:@"%@ %@", self.lastName, self.firstName];
}



-(NSString*)dateOfBirthWithFormatStyle:(NSString*)formatStyle {
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:formatStyle];
    
    return [dateFormat stringFromDate:self.dateOfBirth];
}

@end

//
//  APStudent.h
//  Lesson 35 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSDate* dateOfBirth;

+(APStudent*)randomStudent;

-(NSString*)stringOfDateBirth;
-(NSString*)lastNameAndFirstNameString;
-(NSString*)monthOfBirth;
-(NSString*)monthOfBirthNumericValue;

@end

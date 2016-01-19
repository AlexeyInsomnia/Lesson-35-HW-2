//
//  APSection.h
//  Lesson 35 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APSection : UITableViewCell // this is class is for collectng students in sections by defferent parametres

@property (strong, nonatomic) NSString* sectionName;

@property (strong, nonatomic) NSMutableArray* itemsArray;

@end

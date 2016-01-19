//
//  APTableViewController.m
//  Lesson 35 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APTableViewController.h"


typedef enum : NSUInteger {
    APSectionSortByMonth        = 0,
    APSectionSortByFirstName    = 1,
    APSectionSortBySecondName   = 2,
} APSectionSort;


@interface APTableViewController ()

@property (strong, nonatomic) NSArray* students;
@property (strong, nonatomic) NSArray* sections;

@end



@implementation APTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.students = [self createStudents];
    
    self.sections = [self generateSectionsFromArray:self.students withFilter:self.searchBar.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

- (IBAction)actionSortingTypeChanged:(UISegmentedControl *)sender {
    
    
    self.students = [self sortArray:(NSMutableArray*)self.students withSortType:self.sortingSegmentedControl.selectedSegmentIndex];
    
    self.sections = [self generateSectionsFromArray:self.students withFilter:self.searchBar.text];
    
    [self.tableView reloadData];
    
}

#pragma mark - Methods

-(NSArray*)generateSectionsFromArray:(NSArray*)array withFilter:(NSString*)filterString {
    
    NSMutableArray* sectionsArray = [[NSMutableArray alloc] init];
    
    NSString* currentLetter = nil;
    
    for (APStudent* student in array) {
        if ([filterString length] > 0 &&
            ([student.firstName rangeOfString:filterString].location  == NSNotFound
            && [student.lastName rangeOfString:filterString].location == NSNotFound)) {
            continue;
        }
        
         
         NSString* firstLetter = [NSString string];
         
         switch (self.sortingSegmentedControl.selectedSegmentIndex) {
         case APSectionSortByMonth:
         firstLetter = [student monthOfBirth];
         break;
         
         case APSectionSortByFirstName:
         firstLetter = [student.firstName substringToIndex:1];
         break;
         
         case APSectionSortBySecondName:
         firstLetter = [student.lastName substringToIndex:1];
         break;
         
         default:
         break;
         }
        
            APSection* section = nil;
         
            if (![currentLetter isEqualToString:firstLetter]) {
                section = [[APSection alloc] init];
                section.sectionName = firstLetter;
                section.itemsArray = [[NSMutableArray alloc] init];
                currentLetter = firstLetter;
                [sectionsArray addObject:section];
            }
         else {
             section = [sectionsArray lastObject];
            
        }
            [section.itemsArray addObject:student];
            
        }
        
        return sectionsArray;
}




-(NSArray*)createStudents {
    
    NSMutableArray* students = [NSMutableArray array];
    
    for (int i = 0; i < 100; i++) {
        [students addObject:[APStudent randomStudent]];
    }
    
    return [self sortArray:students withSortType:self.sortingSegmentedControl.selectedSegmentIndex];
}


-(NSArray*)sortArray:(NSMutableArray*)array withSortType:(APSectionSort)sectionSortType {
    
    NSSortDescriptor* firstNameSort = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSSortDescriptor* lastNameSort = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSSortDescriptor* monthOfBirthSort = [[NSSortDescriptor alloc] initWithKey:@"monthOfBirthNumericValue" ascending:YES];
    
    switch (sectionSortType) {
        case APSectionSortByMonth:
            [array sortUsingDescriptors:@[monthOfBirthSort, firstNameSort, lastNameSort]];
            break;
            
        case APSectionSortByFirstName:
            [array sortUsingDescriptors:@[firstNameSort, lastNameSort, monthOfBirthSort]];
            break;
            
        case APSectionSortBySecondName:
            [array sortUsingDescriptors:@[lastNameSort, firstNameSort, monthOfBirthSort]];
            break;
            
        default:
            break;
    }
    
    return array;
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.sections count];
    
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.sections objectAtIndex:section] sectionName];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    APSection* sectionInRow = [self.sections objectAtIndex:section];
    
    return  [sectionInRow.itemsArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"studentCell";
    
    APStudentCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[APStudentCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    APSection* studentSection = [self.sections objectAtIndex:indexPath.section];
    
    APStudent* student = [studentSection.itemsArray objectAtIndex:indexPath.row];
    
    cell.nameStudentCell.text = [student lastNameAndFirstNameString];;
    cell.dateStudentCell.text = [student stringOfDateBirth];
    
    return cell;
    
}

// this is IndexBar in a right part of a table

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for (APSection* section in self.sections) {
        [array addObject:section.sectionName];
    }
  
    return array;
 
}


#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    self.sections = [self generateSectionsFromArray:self.students withFilter:searchBar.text];
    
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
    
    searchBar.text = @"";
    
    self.sections = [self generateSectionsFromArray:self.students withFilter:searchBar.text];
}

@end

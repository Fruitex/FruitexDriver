//
//  FDLoginViewController.m
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDLoginViewController.h"
#import "FDTextFieldCell.h"

typedef enum {
    LoginViewUserInputSection = 0,
    LoginViewUserActionSection,
    LoginViewNumOfSections
} LoginViewSections;

@interface FDLoginViewController ()

@end

@implementation FDLoginViewController

+ (FDLoginViewController *)loginViewController
{
    static FDLoginViewController *vc = nil;
    @synchronized(self) {
        if (vc == nil) {
            vc = [[FDLoginViewController alloc] initWithStyle:UITableViewStyleGrouped];
        }
    }
    return vc;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Login to Fruitex";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return LoginViewNumOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == LoginViewUserInputSection) {
        return 2;
    } else if (section == LoginViewUserActionSection) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == LoginViewUserInputSection) {
        FDTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:TextFieldCellIdentifier];
        if (cell == nil) {
            cell = [[FDTextFieldCell alloc] init];
        }
        cell.textField.placeholder = indexPath.row == 0 ? @"Username" : @"Password";
        return cell;
    } else if (indexPath.section == LoginViewUserActionSection) {
        static NSString *cellIdentifier = @"loginCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:cellIdentifier];
            cell.textLabel.text = @"Login";
        }
        return cell;
    }
    
    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == LoginViewUserActionSection) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end

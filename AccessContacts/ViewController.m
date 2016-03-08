//
//  ViewController.m
//  AccessContacts
//
//  Created by vinayganesh on 3/7/16.
//  Copyright © 2016 vinayganesh. All rights reserved.
//

#import "ViewController.h"
#import "ContactsManager.h"
#import <Contacts/Contacts.h>

@interface ViewController ()

@end

@implementation ViewController

NSArray *groupOfContacts;
NSArray *nameArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContactsManager *cManager = [[ContactsManager alloc]init];
    nameArray = [cManager getAllContacts];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getContactsAction:(id)sender {
    
    ContactsManager *cManager = [[ContactsManager alloc]init];
    groupOfContacts = [cManager getAllContacts];
    NSLog(@"%lu",groupOfContacts.count);
  
}

- (IBAction)createContactAction:(id)sender {
    
    ContactsManager *cManager = [[ContactsManager alloc]init];
    [cManager createContacts];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        static NSString *simpleTableIdentifier = @"SimpleTableCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [nameArray objectAtIndex:indexPath.row]];
        //[groupOfContacts objectAtIndex:indexPath.row];
        
        return cell;

    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
        
    }
    
    return nil;
}

@end

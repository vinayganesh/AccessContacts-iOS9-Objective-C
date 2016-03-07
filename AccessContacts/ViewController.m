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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getContactsAction:(id)sender {
    
    ContactsManager *cManager = [[ContactsManager alloc]init];
    [cManager getAllContacts];
  
}

- (IBAction)createContactAction:(id)sender {
    
    ContactsManager *cManager = [[ContactsManager alloc]init];
    [cManager createContacts];
}
@end

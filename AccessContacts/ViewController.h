//
//  ViewController.h
//  AccessContacts
//
//  Created by vinayganesh on 3/7/16.
//  Copyright © 2016 vinayganesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
- (IBAction)getContactsAction:(id)sender;

- (IBAction)createContactAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;

@end


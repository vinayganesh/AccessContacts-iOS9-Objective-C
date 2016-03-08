#import <Foundation/Foundation.h>
#import "ContactsManager.h"
#import <Contacts/Contacts.h>

@implementation ContactsManager

-(NSMutableArray *)getAllContacts {
    
    NSMutableArray *groupOfContacts;
    NSMutableArray *phoneNumberArray;
    NSMutableArray *nameArray = [[NSMutableArray alloc]init];
   
    groupOfContacts = [@[]mutableCopy];
    phoneNumberArray = [@[]mutableCopy];
    
    if([CNContactStore class]) {
        
        CNContactStore *addressBook = [[CNContactStore alloc]init];
        
        NSArray *keysToFetch = @[CNContactEmailAddressesKey,
                                 CNContactFamilyNameKey,
                                 CNContactGivenNameKey,
                                 CNContactPhoneNumbersKey,
                                 CNContactPostalAddressesKey];
        
        CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc]initWithKeysToFetch:keysToFetch];
        
        [addressBook enumerateContactsWithFetchRequest:fetchRequest error:nil
                                                       usingBlock:
                                                       ^(CNContact * __nonnull contact, BOOL * __nonnull stop)
                                                       {
                                                           [groupOfContacts addObject:contact];}];
        
                                                       }
    
    NSLog(@"Number of contacts are: %lu",groupOfContacts.count);
    
    for(CNContact *contact in groupOfContacts) {
        
        //retrieve the name and all the phone numbers
        NSString *name = contact.givenName;
        NSArray *phoneNumber = [[contact.phoneNumbers valueForKey:@"value"]valueForKey:@"digits"];
        
        //print all name of the contact and phone numbers
        NSLog(@"%@:%@",name,phoneNumber);
        
        [nameArray addObject:name];
        
    }
    
    return nameArray;
}

-(void)createContacts {
    
    NSString *contactIdentifier;
    
    //create an address book
    CNContactStore *addressBook = [[CNContactStore alloc]init];
    
    //create a phone number object
    CNLabeledValue<CNPhoneNumber *> *phone = [CNLabeledValue<CNPhoneNumber *> labeledValueWithLabel:CNLabelHome value:[CNPhoneNumber phoneNumberWithStringValue:@"12345"]];
    
    //create a new contact with all the information
    CNMutableContact *newContact =  [[CNMutableContact alloc]init];
    newContact.givenName = @"Maria";
    newContact.familyName = @"Sharapova";
    
    //create the array of phone numbers
    NSArray *phoneNumber = [newContact.phoneNumbers arrayByAddingObject:phone];
    
    //assign the array to the phone numbers array
    newContact.phoneNumbers = phoneNumber;
    
    //create a save request for the contact created
    CNSaveRequest *contactSaveRequest = [[CNSaveRequest alloc]init];
    
    [contactSaveRequest addContact:newContact toContainerWithIdentifier:[addressBook defaultContainerIdentifier]];
    [addressBook executeSaveRequest:contactSaveRequest error:nil];
    contactIdentifier = [newContact identifier];
    
}


@end
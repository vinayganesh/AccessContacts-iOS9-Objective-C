#import <Foundation/Foundation.h>
#import "ContactsManager.h"
#import <Contacts/Contacts.h>

@implementation ContactsManager

-(void)getAllContacts {
    
    NSMutableArray *groupOfContacts;
    NSMutableArray *phoneNumberArray;
    
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
        NSArray *phoneNumber = [[contact.phoneNumbers valueForKey:@"value"]valueForKey:@"digits"] ;
        
        //retrieve the contacts phone numbers with first number from the list of phone numbers
        /*NSArray <CNLabeledValue<CNPhoneNumber *> *> *phoneNumbers = contact.phoneNumbers;
        CNLabeledValue<CNPhoneNumber *> *firstPhone = [phoneNumbers firstObject];
        CNPhoneNumber *number = firstPhone.value;
        NSString *digits = number.stringValue;
        NSString *label = firstPhone.label;*/
        
        
        //print all name of the contact and phone numbers
        NSLog(@"%@ %@", name,phoneNumber);
    }
}

-(void)createContacts {
    
    NSString *contactIdentifier;
    
    CNLabeledValue<CNPhoneNumber *> *phone = [CNLabeledValue<CNPhoneNumber *> labeledValueWithLabel:CNLabelHome value:[CNPhoneNumber phoneNumberWithStringValue:@"12345"]];
    
    CNContactStore *addressBook = [[CNContactStore alloc]init];
    
    CNMutableContact *newContact =  [[CNMutableContact alloc]init];
    newContact.givenName = @"Maria";
    newContact.familyName = @"Sharapova";
    NSArray *phoneNumber = [newContact.phoneNumbers arrayByAddingObject:phone];
    
    newContact.phoneNumbers = phoneNumber;
    
    CNSaveRequest *contactSaveRequest = [[CNSaveRequest alloc]init];
    
    [contactSaveRequest addContact:newContact toContainerWithIdentifier:[addressBook defaultContainerIdentifier]];
    [addressBook executeSaveRequest:contactSaveRequest error:nil];
    contactIdentifier = [newContact identifier];
    
}


@end
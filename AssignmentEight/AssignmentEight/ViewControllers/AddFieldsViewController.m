

#import "AddFieldsViewController.h"

@interface AddFieldsViewController ()

@end

@implementation AddFieldsViewController
@synthesize contactsIsSelected;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(contactsIsSelected){
        //make labels as name and contact number
        labelFirstNameOrOrgname.text=@"First Name";
        labelContactOrLocation.text=@"Contact Number";
    }
    
    else{
        labelFirstNameOrOrgname.text=@"Organisation Name";
        labelContactOrLocation.text=@"Location";
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)buttonSaveActionHandler:(UIButton *)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    if(contactsIsSelected){
        Person *personObjectForInsert = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
        personObjectForInsert.firstName=textFieldNameOrOrgname.text;
        personObjectForInsert.contactNumber=textFieldContactOrLocation.text;
        
    }
    
    else{
        
        Organisation *organisationObject=[NSEntityDescription insertNewObjectForEntityForName:@"Organisation" inManagedObjectContext:context];
        organisationObject.companyName=textFieldNameOrOrgname.text;
        organisationObject.companyLocation=textFieldContactOrLocation.text;
        
    }
    
    
    NSError *error = nil;
    
    if ([context save:&error]) {
        
        NSLog(@"New person information was saved!");
        
    } else {
        
        NSLog(@"The person information was not saved: %@", [error userInfo]);
        
    }
    
    
    
    //pop into initial view controller
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end

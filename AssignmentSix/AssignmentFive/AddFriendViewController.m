

#import "AddFriendViewController.h"
#import "InitialViewController.h"
#import "Person.h"

@interface AddFriendViewController (){
    
}

@end



@implementation AddFriendViewController
@synthesize textFieldFirstName;
@synthesize textFieldLastName;
@synthesize textFiledCity;
@synthesize textFiledState;
@synthesize buttonSaveOrEdit;
@synthesize isEditSelected;
@synthesize firstName;
@synthesize lastName;
@synthesize city;
@synthesize state;

- (void)viewDidLoad {
    NSLog(@"in view did load of addfrnd");
    [super viewDidLoad];
    //setting button label
    if(isEditSelected){
        
        [buttonSaveOrEdit setTitle:@"Edit" forState:UIControlStateNormal];
        textFieldFirstName.text=firstName;
        textFiledCity.text=city;
    }
    else{
        [buttonSaveOrEdit setTitle:@"Save" forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//get the context from appdelegate
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark:-button action

- (IBAction)actionSaveHandler:(UIButton *)sender {
    
    if(!isEditSelected){
        //insert into values into db
        NSManagedObjectContext *context = [self managedObjectContext];
        //select the entity
        Person *personObject = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
        //setting the attributes
        personObject.firstName=textFieldFirstName.text;
        personObject.lastName=textFieldLastName.text;
        personObject.city=textFiledCity.text;
        personObject.state=textFiledState.text;
        
        //save the data
        NSError *error = nil;
        
        if ([context save:&error]) {
            
            NSLog(@"New person information was saved!");
            
        } else {
            
            NSLog(@"The person information was not saved: %@", [error userInfo]);
            
        }
        
        //    //fetch the data
        //    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        //    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
        //
        //
        //    [fetchRequest setEntity:entity];
        //
        //    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
        //
        //    for(Person *person in fetchedObjects){
        //        NSLog(@" %@  %@  %@  %@",person.firstName,person.lastName,person.city,person.state);
        //    }
        
        
        //pop into initial view controller
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    else{
        //if edit selected
        
        NSManagedObjectContext *context = [self managedObjectContext];
        NSManagedObject *personManagedObject;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstName==%@",firstName];
        [fetchRequest setPredicate:predicate];
        personManagedObject=[[context executeFetchRequest:fetchRequest error:nil]firstObject];
        [personManagedObject setValue:textFieldFirstName.text forKey:@"firstName"];
        [personManagedObject setValue:textFieldLastName.text forKey:@"lastName"];
        [personManagedObject setValue:textFiledCity.text forKey:@"city"];
        [personManagedObject setValue:textFiledState.text forKey:@"state"];
        
        [self.managedObjectContext save:nil];
        
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}



@end

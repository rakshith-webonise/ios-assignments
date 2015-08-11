

#import "AddFriendViewController.h"
#import "Person.h"
#import "AppDelegate.h"
#import "InitialViewController.h"

@interface AddFriendViewController ()

@end



@implementation AddFriendViewController
@synthesize textFieldFirstName;
@synthesize textFieldLastName;
@synthesize textFiledCity;
@synthesize textFiledState;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)actionSaveHandler:(UIButton *)sender {
    Person *personObject=[[Person alloc]init];
    
    //initializing values in person object
    personObject.firstName=textFieldFirstName.text;
    personObject.lastName=textFieldLastName.text;
    personObject.city=textFiledCity.text;
    personObject.state=textFiledState.text;
    
    //add person objects into array
    [((AppDelegate *)[UIApplication sharedApplication].delegate).arrayOfFriends addObject:personObject];
    
    
    //pop into initial view controller
    [self.navigationController popViewControllerAnimated:YES];
    
    
}



@end

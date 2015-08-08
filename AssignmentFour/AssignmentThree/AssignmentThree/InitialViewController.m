

#import "InitialViewController.h"
#import "DisplayViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController
@synthesize textFieldFirstName;
@synthesize textFieldPhoneNumber;
@synthesize textFieldState;
@synthesize textfieldCountry;


- (void)viewDidLoad {
    // setting the title
    [super viewDidLoad];
    self.title=@"Enter Details";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (IBAction)buttonActionHandler:(UIButton *)sender {
    UIStoryboard *storyBoardObject= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DisplayViewController *displayViewControllerObject=[storyBoardObject instantiateViewControllerWithIdentifier:@"DisplayViewController"];
    // setting the values of properties
    
    displayViewControllerObject.firstName=textFieldFirstName.text;
    displayViewControllerObject.phoneNumber=textFieldPhoneNumber.text;
    displayViewControllerObject.state=textFieldState.text;
    displayViewControllerObject.country=textfieldCountry.text;
    
    [self.navigationController pushViewController:displayViewControllerObject animated:true];
    
    
}


@end

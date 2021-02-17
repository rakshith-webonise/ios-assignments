

#import "DisplayViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController
@synthesize labelFirstName;
@synthesize labelPhoneNumber;
@synthesize labelState;
@synthesize labelCountry;
@synthesize firstName;
@synthesize phoneNumber;
@synthesize state;
@synthesize country;

- (void)viewDidLoad {
    [super viewDidLoad];
    //setting  the title
    self.title=@"Your Details";
    
    // setting values for labels
    labelFirstName.text=self.firstName;
    self.labelPhoneNumber.text=phoneNumber;
    self.labelState.text=state;
    self.labelCountry.text=country;
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}


@end

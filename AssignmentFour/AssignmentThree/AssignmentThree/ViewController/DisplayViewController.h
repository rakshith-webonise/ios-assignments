
#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelFirstName;
@property (weak, nonatomic) IBOutlet UILabel *labelPhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelState;
@property (weak, nonatomic) IBOutlet UILabel *labelCountry;
@property (strong) NSString *firstName;
@property (strong) NSString *phoneNumber;
@property (strong) NSString *state;
@property (strong) NSString *country;

@end

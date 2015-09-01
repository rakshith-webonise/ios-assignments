
#import <UIKit/UIKit.h>
#import "Person.h"
#import "Organisation.h"

@interface AddFieldsViewController : UIViewController{
    
   
    __weak IBOutlet UITextField *textFieldContactOrLocation;
    __weak IBOutlet UITextField *textFieldNameOrOrgname;
    __weak IBOutlet UILabel *labelFirstNameOrOrgname;
    __weak IBOutlet UILabel *labelContactOrLocation;
}
@property  BOOL contactsIsSelected;
@end

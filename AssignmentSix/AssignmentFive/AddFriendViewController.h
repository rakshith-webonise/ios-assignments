

#import <UIKit/UIKit.h>

@interface AddFriendViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFiledCity;
@property (weak, nonatomic) IBOutlet UITextField *textFiledState;
@property (weak, nonatomic) IBOutlet UIButton *buttonSaveOrEdit;
@property (nonatomic)  BOOL isEditSelected;
@property (nonatomic,weak) NSString *firstName;
@property (nonatomic,weak) NSString *lastName;
@property (nonatomic,weak) NSString *city;
@property (nonatomic,weak) NSString *state;

@end

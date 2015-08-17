

#import <UIKit/UIKit.h>

@interface ContactsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    __weak IBOutlet UITableView *contactsTableView;
   
}


@end

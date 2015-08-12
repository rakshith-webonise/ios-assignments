

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewListOfFriends;

@end

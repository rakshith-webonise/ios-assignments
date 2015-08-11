

#import "InitialViewController.h"
#import "AddFriendViewController.h"
#import "CustomCellTableViewCell.h"
#import "AppDelegate.h"
#import "Person.h"

@interface InitialViewController (){
    NSMutableArray *tempArray;
}

@end

@implementation InitialViewController
@synthesize tableViewListOfFriends;
- (void)viewDidLoad {
    [super viewDidLoad];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    tempArray=[((AppDelegate *)[UIApplication sharedApplication].delegate).arrayOfFriends mutableCopy ];
    [tableViewListOfFriends reloadData];
    NSLog(@"in view will appear");
}

#pragma mark :- button action
- (IBAction)actionButtonHandler:(UIButton *)sender {
    UIStoryboard *storyBoardObject=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFriendViewController *addFriendObject=[storyBoardObject instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
    [self.navigationController pushViewController:addFriendObject animated:true];
}

#pragma mark :-tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tempArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"cell";
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Person *personObject = [tempArray objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        
        [tableView registerNib:[UINib nibWithNibName:@"CustomCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    
    cell.labelFirstName.text =personObject.firstName;
    cell.labelCityState.text=personObject.city;
    cell.imageProfile.image = [UIImage imageNamed:@"Image"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}





@end



#import "InitialViewController.h"
#import "AddFriendViewController.h"
#import "CustomCellTableViewCell.h"
#import "SearchViewController.h"
#import "Person.h"



@interface InitialViewController (){
    NSArray *arrayOfPersonsObject;
    
}

@end

@implementation InitialViewController
@synthesize tableViewListOfFriends;


-(InitialViewController *)init{
    self=[super init];
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//make the context
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    arrayOfPersonsObject=[[NSArray alloc]init];
    //fetch the values
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    
    arrayOfPersonsObject = [context executeFetchRequest:fetchRequest error:&error];
    
    
    
    [tableViewListOfFriends reloadData];
    NSLog(@"in view will appear");
}

#pragma mark :- button action
- (IBAction)actionButtonHandler:(UIButton *)sender {
  
    UIStoryboard *storyBoardObject=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFriendViewController *addFriendObject=[storyBoardObject instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
    addFriendObject.isEditSelected=NO;
    [self.navigationController pushViewController:addFriendObject animated:true];
}

#pragma mark :-tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return count as number of cells to be created
    return arrayOfPersonsObject.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //create object of person;
    Person *personObject=[arrayOfPersonsObject objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"cell";
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    if (cell == nil) {
        
        [tableView registerNib:[UINib nibWithNibName:@"CustomCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    
      cell.labelFirstName.text=personObject.firstName ;
      cell.labelCityState.text=personObject.city;
      cell.imageProfile.image = [UIImage imageNamed:@"Image"];
//    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

#pragma mark:-table edit actions

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  //create instance of second view
    
     UIStoryboard *storyBoardObject=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    AddFriendViewController *addFriendObject=[storyBoardObject instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
    
    
    CustomCellTableViewCell *cellObject= (CustomCellTableViewCell*)[tableViewListOfFriends cellForRowAtIndexPath:indexPath];
    
    addFriendObject.firstName=cellObject.labelFirstName.text;
    addFriendObject.city=cellObject.labelCityState.text;
    
    //push to addfriendvew
    
    addFriendObject.isEditSelected=YES;
    
    [self.navigationController pushViewController:addFriendObject animated:true];
    
    NSLog(@"%@",[tableView indexPathForSelectedRow]);
}

#pragma mark: search button action
- (IBAction)buttonSearchHandler:(id)sender {
    
    UIStoryboard *storyBoardObject=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchViewController *searchFriendObject=[storyBoardObject instantiateViewControllerWithIdentifier:@"SearchViewController"];
    
    [self.navigationController pushViewController:searchFriendObject animated:true];

}



@end

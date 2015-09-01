

#import "ContactsViewController.h"
#import "CustomCellTableViewCell.h"
#import "AddFieldsViewController.h"
#define TABLE_CELL @"cell"

@interface ContactsViewController (){
    NSArray *arrayOfPersons;
}

@end

@implementation ContactsViewController


- (void)viewDidLoad {
    NSLog(@"in did load");
    [super viewDidLoad];
    [contactsTableView registerNib:[UINib nibWithNibName:@"CustomCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

-(void)viewWillAppear:(BOOL)animated{
    arrayOfPersons=[[NSArray alloc]init];
    //fetch the values
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    
    arrayOfPersons = [context executeFetchRequest:fetchRequest error:&error];
    
    
    
    [contactsTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark :-tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"in row");
    return arrayOfPersons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"making each table cell");
    
    Person *personObject=[arrayOfPersons objectAtIndex:indexPath.row];
    CustomCellTableViewCell *cell = [contactsTableView dequeueReusableCellWithIdentifier: TABLE_CELL];
    
    
    if (cell == nil) {
        cell = [[CustomCellTableViewCell  alloc]initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:TABLE_CELL];
    }
    
    cell.labelNameOrOrgName.text=personObject.firstName;
    cell.labelLocationOrContact.text=personObject.contactNumber;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}

#pragma mark:- add button action
- (IBAction)addNewContactActionHandler:(id)sender {
    NSLog(@"in add button action");
    
    UIStoryboard *storyBoardObject=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFieldsViewController *addNewContactObject=[storyBoardObject instantiateViewControllerWithIdentifier:@"AddFieldsViewController"];
    addNewContactObject.contactsIsSelected=YES;
    [self.navigationController pushViewController:addNewContactObject animated:true];
    
    
}


@end

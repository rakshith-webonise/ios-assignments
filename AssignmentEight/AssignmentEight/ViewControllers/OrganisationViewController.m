

#import "OrganisationViewController.h"
#import "CustomCellTableViewCell.h"
#import "AddFieldsViewController.h"
#define TABLE_CELL @"cell"

@interface OrganisationViewController (){
    NSArray *arrayOfOrganisation;
}

@end

@implementation OrganisationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [organisationTableView  registerNib:[UINib nibWithNibName:@"CustomCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

-(void)viewWillAppear:(BOOL)animated{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Organisation" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    
    arrayOfOrganisation = [context executeFetchRequest:fetchRequest error:&error];
    
    
    
    [organisationTableView reloadData];
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


#pragma mark:-uitable methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"in row");
    return arrayOfOrganisation.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"making each table cell in organisation");
    
    Organisation *organisationObject=[arrayOfOrganisation objectAtIndex:indexPath.row];
    
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TABLE_CELL];
    
    
    if (cell == nil) {
        cell = [[CustomCellTableViewCell  alloc]initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:TABLE_CELL];
    }
    cell.labelNameOrOrgName.text=organisationObject.companyName;
    cell.labelLocationOrContact.text=organisationObject.companyLocation;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}
- (IBAction)buttonAddActionHandler:(UIBarButtonItem *)sender {
    UIStoryboard *storyBoardObject=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFieldsViewController *addNewContactObject=[storyBoardObject instantiateViewControllerWithIdentifier:@"AddFieldsViewController"];
    addNewContactObject.contactsIsSelected=NO;
    
    [self.navigationController pushViewController:addNewContactObject animated:true];
    
}


@end

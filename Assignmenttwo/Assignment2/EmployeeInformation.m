

#import "EmployeeInformation.h"

NSInteger length,indexAt=0;
NSDictionary * localDicitonary;

@implementation EmployeeInformation


-(void)informationIntialization{
    
    
    _arrayOfPersonInformation =[[NSMutableArray alloc]init];
    
    
    _arrayOfPersonInformation= [NSMutableArray arrayWithObjects:
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"rakshith",@"firstname",
                                 @"nandish",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"pune",@"city",
                                  @"maharashtra",@"state"
                                  ,nil],@"address",
                                 @"1",@"employeeId",
                                 @"1",@"experience",
                                 [NSArray arrayWithObjects:@"php",@"java", nil ] ,@"technolgies",
                                 nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"pallavi",@"firstname",
                                 @"shrikollu",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"pune",@"city",
                                  @"maharashtra",@"state"
                                  ,nil],@"address",
                                 @"2",@"employeeId",
                                 @"3",@"experience",
                                 [NSArray arrayWithObjects:@"c++",@"java", nil ] ,@"technolgies",
                                 nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"akhil",@"firstname",
                                 @"bhat",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"bangalore",@"city",
                                  @"karnataka",@"state"
                                  ,nil],@"address",
                                 @"3",@"employeeId",
                                 @"5",@"experience",
                                 [NSArray arrayWithObjects:@"c++",@"java",@"html", nil ] ,@"technolgies",
                                 nil]
                                
                                
                                ,nil];
    
    //    firstname=[[NSMutableArray alloc]init];
    //    lastname=[[NSMutableArray alloc]init];
    //
    //    length= _arrayOfPersonInformation.count;
    //    for (int i=0; i<length; i++) {
    //        localDicitonary=[_arrayOfPersonInformation objectAtIndex:i];
    //        firstname[indexAt]=[ localDicitonary objectForKey:@"firstname"];
    //
    //        lastname[indexAt]=[localDicitonary objectForKey:@"lastname"];
    //        indexAt++;
    
}













}
@end

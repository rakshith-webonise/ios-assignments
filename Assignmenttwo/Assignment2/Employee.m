

#import "Employee.h"

@implementation Employee


@synthesize myArray;


-(void) employeeInformation{
    
    
    
    EmployeeInformation *info =[[EmployeeInformation alloc]init];
    
    
    Employee * employee;
    
    Address * address;
    
    NSInteger length;
    // initializing the array of dictionaries
    [info informationIntialization];
    
    myArray= [[NSMutableArray alloc]init];
    
    
    NSDictionary *localDicitonary=[[NSDictionary alloc]init];
    
    
    length= info.arrayOfPersonInformation.count;
    
    NSLog(@"at for");
    
    for (int i=0; i<length; i++) {
        employee =[[Employee alloc]init];
        localDicitonary=[info.arrayOfPersonInformation objectAtIndex:i];
        
        employee.firstName=[ localDicitonary objectForKey:@"firstname"];
        employee.lastName=[localDicitonary objectForKey:@"lastname"];
        
        employee.employeeId =[localDicitonary objectForKey:@"employeeId"];
        employee.experience =[localDicitonary objectForKey:@"experience"];
        
        [employee initWithValuesOfCity:@"bangalore" withState:@"karnataka"];
        
        [myArray addObject:employee];
        
        
    }
    
}


-(void)employeeWithHigherExperience :(int)givenExperience {
    NSLog(@"inside function");
    for (int i=0; i<myArray.count; i++) {
        
        Employee *tempEmployeeObject=[myArray objectAtIndex:i];
        
        if([tempEmployeeObject.experience integerValue]> givenExperience ){
            NSLog(@"%@",tempEmployeeObject.firstName);
            NSLog(@"%@",tempEmployeeObject.lastName);
        }
        
        
    }
    
    
}


-(void) employeeWithLesserExperience: (int) givenExperience{
    NSLog(@"inside lesser function");
    Employee *tempEmployeeObject;
    for (int i=0; i<myArray.count; i++){
        tempEmployeeObject=[myArray objectAtIndex:i];
        if (givenExperience < [tempEmployeeObject.experience integerValue]) {
            NSLog(@"%@",tempEmployeeObject.firstName);
            NSLog(@"%@",tempEmployeeObject.lastName);
            NSLog(@"%@",tempEmployeeObject.employeeId);
        }
    }
}


-(void)print {
    
    [super print];
    
    NSLog(@"%@",self.employeeId);
    NSLog(@"%@",self.experience);
    
    
}
@end

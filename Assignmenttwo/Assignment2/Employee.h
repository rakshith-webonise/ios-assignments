
#import <Foundation/Foundation.h>
#import "EmployeeInformation.h"
#import "Person.h"
#import "Address.h"

@interface Employee : Person

@property id employeeId;
@property id experience;

@property NSMutableArray *myArray;

-(void) employeeInformation;
-(void) employeeWithHigherExperience:(int)givenExperience;
-(void) employeeWithLesserExperience:(int)givenExperience;


@end

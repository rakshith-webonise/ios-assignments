//
//  ViewController.m
//  Assignment2


#import "ViewController.h"
#import "EmployeeInformation.h"
#import "Employee.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //EmployeeInformation *employeeInformationObject=[[EmployeeInformation alloc]init];
    
    Employee *employeeObject=[[Employee alloc]init];
    
    employeeObject.employeeInformation;
    
    
    //calling methods for employee with higher experience
    [employeeObject employeeWithHigherExperience:2];
    
    //calling method for employee with lesser experience
    [employeeObject employeeWithLesserExperience:2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

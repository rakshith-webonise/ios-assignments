//
//  ViewController.m
//  Assignment1
//
//  Created by weboniselab1 on 03/08/2015.
//  Copyright (c) 2015 weboniselab1. All rights reserved.
//

#import "ViewController.h"
#import "CalculateSimpleInterest.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //initializing calculatesimpleinterest object
    CalculateSimpleInterest *calculateSimpleInterestInstance=[[CalculateSimpleInterest alloc]init];
    
    //calling method to calculate simple interest
    float simpleInterestAmountToBePaid=[calculateSimpleInterestInstance simpleInterestCalculatorWithAmount:10000 withinterest:10 withtime:10];
    
    NSLog(@"the amount is %f",simpleInterestAmountToBePaid);
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

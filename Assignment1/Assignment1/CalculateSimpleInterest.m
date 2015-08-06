//
//  CalculateSimpleInterest.m
//  Assignment1
//
//  Created by weboniselab1 on 03/08/2015.
//  Copyright (c) 2015 weboniselab1. All rights reserved.
//

#import "CalculateSimpleInterest.h"

@implementation CalculateSimpleInterest



@synthesize rate;
@synthesize timePeriod;

float const simpleInterestDivisor=100;

+(float)simpleInterestCalculatorWithAmount:(float)principalAmount withinterest:(float)rate withtime:(float)timePeriod  {
    
    
    
    float amount=(principalAmount*rate*timePeriod)/(simpleInterestDivisor);
    return amount;
    
    
}



@end

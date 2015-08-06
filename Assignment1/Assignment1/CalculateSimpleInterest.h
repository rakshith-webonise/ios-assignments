//
//  CalculateSimpleInterest.h
//  Assignment1
//
//  Created by weboniselab1 on 03/08/2015.
//  Copyright (c) 2015 weboniselab1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateSimpleInterest : NSObject{
    float const simpleInterestDivisor;
}
    

@property float principalAmount;
@property float rate,timePeriod;




-(float)simpleInterestCalculatorWithAmount :(float)principalAmount withinterest:(float) rate withtime : (float)timePeriod;




@end

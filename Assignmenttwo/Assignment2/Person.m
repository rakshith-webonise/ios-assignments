
#import "Person.h"

@implementation Person
@synthesize address;
-(id)initWithValuesOfCity:(NSString *) city withState :(NSString *) state{
    
    
    [address initWithValues:city withState:state];
    return 0;
    
    
}

-(void) print{
    NSLog(@"%@",_firstName);
    NSLog(@"%@",self.lastName);
    
    
}
@end

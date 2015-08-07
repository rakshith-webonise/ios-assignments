
#import "Address.h"

@implementation Address
-(id)initWithValues:(NSString *) city withState :(NSString *) state{
    
    self.city= city;
    self.state= state;
    
    return 0;
    
    
}

-(void) display{
    NSLog(@"%@",self.city);
    NSLog(@"%@",self.state);
    
    
    
}
@end

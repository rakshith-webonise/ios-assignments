
#import <Foundation/Foundation.h>
#import "Address.h"

@interface Person : NSObject

@property NSString * firstName;
@property NSString * lastName;
@property Address *address;
-(void) print;
-(id)initWithValuesOfCity:(NSString *) city withState :(NSString *) state;
@end

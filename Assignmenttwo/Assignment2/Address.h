

#import <Foundation/Foundation.h>


@interface Address : NSObject
@property NSString *state;
@property NSString *city;

-(id)initWithValues:(NSString *) city withState :(NSString *) state;
-(void) display;
@end

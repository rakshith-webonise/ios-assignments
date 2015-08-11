

#import "Person.h"

@implementation Person
@synthesize firstName;
@synthesize lastName;
@synthesize city;
@synthesize state;

-(Person *)init{
    // initializing values
    firstName=@"";
    lastName=@"";
    city=@"";
    state=@"";
    
    
    return self;
}

@end

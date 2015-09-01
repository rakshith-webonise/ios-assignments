

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * contactNumber;

@end

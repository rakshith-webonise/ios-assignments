

#import "ViewController.h"

@interface ViewController (){
    NSString *lon,*lat,*speed,*deg,*name;
}

@end

@implementation ViewController
@synthesize responseData,responseInDictionary;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create request with url
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Pune"]];
    
    //connection object with request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark:- nsurl delegate methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    NSLog(@"in did receive data");
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    
    
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    responseInDictionary=[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    [self displayDataFromApi:responseInDictionary];
    
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    
}


#pragma mark:-display data
-(void)displayDataFromApi :(NSDictionary *)dictionary{
    //parsing data to display lon,lan speed,deg,name
    NSLog(@"%@",dictionary);
    
    lon=[dictionary valueForKeyPath:@"coord.lon"];
    NSLog(@" value of log %@",lon);
    
    lat=[[dictionary objectForKey:@"coord"] valueForKey:@"lat"];
    NSLog(@" value of lat %@",lat);
    
    speed=[dictionary valueForKeyPath:@"wind.speed"];
    NSLog(@"value of speed %@",speed);
    
    deg=[dictionary valueForKeyPath:@"wind.deg"];
    NSLog(@"value of deg %@",deg);
    
    name=[dictionary valueForKey:@"name"];
    NSLog(@"value of name %@",name);
    
}
@end

//
//  CountryController.m
//  
//
//  Created by Sergio Perez on 10/7/14.
//
//

#import "CountryController.h"
#import "NetworkController.h"

@implementation CountryController

+ (CountryController *)sharedInstance {
    static CountryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CountryController new];
    });
    return sharedInstance;
}

- (void)getCountriesWithName:(NSString *)name completion:(void (^)(NSArray *countries))completion {
    
    NSString *path = [NSString stringWithFormat:@"name/%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *responseContries = responseObject;
        
        NSMutableArray *countries = [NSMutableArray new];
        for (NSDictionary *dictionary in responseContries) {
     //       [countries addObject:[[Country alloc] initWithDictionary:dictionary]];
        }
        
        completion(countries);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil);
    }];
    
}

@end

//
//  NetworkController.h
//  
//
//  Created by Sergio Perez on 10/7/14.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@interface NetworkController : NSObject

+ (AFHTTPSessionManager *)api;

@end

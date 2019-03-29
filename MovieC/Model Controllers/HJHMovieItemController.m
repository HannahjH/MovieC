//
//  HJHMovieItemController.m
//  MovieC
//
//  Created by Hannah Hoff on 3/29/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHMovieItemController.h"

@implementation HJHMovieItemController

//https://api.themoviedb.org/3/search.movie

+(NSURL *)baseUrl {
    return [[NSURL alloc] initWithString:@"https://api.themoviedb.org/3/"];
}

+ (instancetype)shared
{
    static HJHMovieItemController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HJHMovieItemController alloc] init];
    });
    return sharedInstance;
}

- (void)fetchMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<HJHMovieItem *> * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *url = [[HJHMovieItemController baseUrl] URLByAppendingPathComponent:@"search/movie"];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:true];
    NSURLQueryItem *searchQueryItem = [[NSURLQueryItem alloc] initWithName:@"query" value:searchTerm];
    NSURLQueryItem *apiQueryItem = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"7cf147196c1f64c26bccfdbb3d8580d2"];
    components.queryItems = @[apiQueryItem, searchQueryItem];

    NSURL *finishedUrl = components.URL;
    NSLog(@"%@", finishedUrl);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error %@", error);
            completion(nil, error);
            return;
        }
        if(!data){
            NSLog(@"NO DATA AVAILABLE");
            completion(nil, error);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = jsonDictionary[@"results"];
        NSMutableArray *movieArray = [[NSMutableArray alloc] init];
        
        for(NSDictionary *movieDict in resultsArray)
        {
            HJHMovieItem *movie = [[HJHMovieItem alloc] initWithDict:movieDict];
            [movieArray addObject:movie];
        }
        completion(movieArray, nil);
        
        //check if we have a jsonDictionary
        if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSONDictionary is not dictionary class");
            completion(nil, error);
            return;
        }
    }]resume];
    
}


@end

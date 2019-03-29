//
//  HJHMovieItem.m
//  MovieC
//
//  Created by Hannah Hoff on 3/29/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHMovieItem.h"

@implementation HJHMovieItem

-(instancetype)initWithTitle:(NSString *)title vote_average:(NSNumber *)vote_average overview:(NSString *)overview
{
    self = [super init];
    if (self) {
        _title = title;
        _vote_average = vote_average;
        _overview = overview;
        
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dictionary
{
    NSString *title = dictionary[[HJHMovieItem titleKey]];
    NSNumber *vote_average = dictionary[[HJHMovieItem vote_averageKey]];
    NSString *overview = dictionary[[HJHMovieItem overviewKey]];
    
    return [self initWithTitle:title vote_average:vote_average overview:overview];
}

+(NSString *)titleKey
{
    return @"title";
}
//because the KEY is a string
+(NSString *)vote_averageKey
{
    return @"vote_average";
}

+(NSString *)overviewKey
{
    return @"overview";
}


@end

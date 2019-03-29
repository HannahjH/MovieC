//
//  HJHMovieItem.h
//  MovieC
//
//  Created by Hannah Hoff on 3/29/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJHMovieItem : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *vote_average;
@property (nonatomic, copy, readonly) NSString *overview;

-(instancetype)initWithTitle:(NSString *)title vote_average:(NSNumber *)vote_average overview:(NSString *)overview;
-(instancetype)initWithDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

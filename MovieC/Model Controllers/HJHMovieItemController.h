//
//  HJHMovieItemController.h
//  MovieC
//
//  Created by Hannah Hoff on 3/29/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJHMovieItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface HJHMovieItemController : NSObject

+(instancetype)shared;

-(void)fetchMovieWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray<HJHMovieItem *> *movies, NSError *error))completion;


@end

NS_ASSUME_NONNULL_END

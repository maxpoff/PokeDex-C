//
//  MOPPokemonController.h
//  PokeDexC
//
//  Created by Maxwell Poffenbarger on 1/28/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MOPPokemon;

@interface MOPPokemonController : NSObject

+ (MOPPokemonController *)sharedInstance;

- (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void(^)(MOPPokemon *))completion;

@end

NS_ASSUME_NONNULL_END

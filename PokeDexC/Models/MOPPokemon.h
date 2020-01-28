//
//  MOPPokemon.h
//  PokeDexC
//
//  Created by Maxwell Poffenbarger on 1/28/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;

//integer is a primitive so we don't need a pointer (all numbers are primitives)
@property (nonatomic, readonly) NSInteger identifier;

@property (nonatomic, copy, readonly) NSArray<NSString * > * abilities;

- (instancetype) initWithName: (NSString *)name
                    identifer: (NSInteger)identifier
                    abilities: (NSArray<NSString * > *)abilites
NS_DESIGNATED_INITIALIZER;

@end

@interface MOPPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END

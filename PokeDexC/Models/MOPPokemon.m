//
//  MOPPokemon.m
//  PokeDexC
//
//  Created by Maxwell Poffenbarger on 1/28/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPPokemon.h"

@implementation MOPPokemon

- (instancetype)initWithName:(NSString *)name identifer:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilites
{
    self = [super init];
    if (self)
    {
        //copy matches the type to the underlying value's type
        _name = [name copy];
        _identifier = identifier;
        _abilities = [abilites copy];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"" identifer:0 abilities:@[]];
}
@end

@implementation MOPPokemon (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDictionaryArray = dictionary[@"abilities"];
    
    NSMutableArray<NSString *> *abilites = [[NSMutableArray alloc] init];
    for (NSDictionary *abilityDictionary in abilitiesDictionaryArray)
    {
        NSDictionary *nestedDictionary = abilityDictionary[@"ability"];
        NSString *abilityName = nestedDictionary[@"name"];
        [abilites addObject:abilityName];
    }
    
    return [self initWithName:name identifer:identifier abilities:abilites];
}

@end

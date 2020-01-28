//
//  MOPPokemonController.m
//  PokeDexC
//
//  Created by Maxwell Poffenbarger on 1/28/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPPokemonController.h"
#import "MOPPokemon.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon";

@implementation MOPPokemonController

+ (MOPPokemonController *)sharedInstance
{
    static MOPPokemonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MOPPokemonController alloc] init];
    });
    return sharedInstance;
}

- (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (^)(MOPPokemon * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchTerm];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error)
    {
        if (error)
        {
            NSLog(@"Error fetching Pokemon from search term: %@", error);
            completion(nil); return;
        }
        
        if (!data)
        {
            NSLog(@"Error fetching Pokemon data from search term: %@", error);
            completion(nil); return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error fetching JSON dictionary");
            completion(nil); return;
        }
        
        MOPPokemon *pokemon = [[MOPPokemon alloc] initWithDictionary:jsonDictionary];
        
        completion(pokemon);
    }] resume];
}
@end


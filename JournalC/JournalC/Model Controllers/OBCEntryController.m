//
//  OBCEntryController.m
//  JournalC
//
//  Created by winston salcedo on 5/20/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import "OBCEntryController.h"
#import "OBCEntry.h"

@interface OBCEntryController();

#pragma - Properties
@property (nonatomic, strong, readonly) NSMutableArray* internalEntry;

@end

@implementation OBCEntryController

//singleton
+ (OBCEntryController *) shared
{
    static OBCEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[OBCEntryController alloc] init ];
        shared = [OBCEntryController new];
        [shared loadFromPersistentStorage];
    });
    
    return shared;
}

- (instancetype)init;
{
    self = [super init];
    if (self) {
        _internalEntry = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)saveToPresistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (OBCEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
    
}

-(void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        OBCEntry *entry = [[OBCEntry new] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}
-(void)addEntry:(OBCEntry *)entry;
{
    [self.entries addObject:entry];
    [self saveToPresistentStorage];
}
-(void) removeEntry:(OBCEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPresistentStorage];
}
-(void)updateEntry:(OBCEntry *)entry withTitle:(NSString *)title text:(NSString *)text;
{
    entry.title = title;
    entry.text = text;
    [self saveToPresistentStorage];
}
@end


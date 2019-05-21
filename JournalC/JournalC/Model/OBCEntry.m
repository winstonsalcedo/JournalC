//
//  OBCEntry.m
//  JournalC
//
//  Created by winston salcedo on 5/20/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import "OBCEntry.h"

@interface OBCEntry()

@property (nonatomic, strong, readwrite) NSMutableArray* internalEntries;

@end

@implementation OBCEntry

- (instancetype) initWithTitle:(NSString *)title body:(NSString *)text date:(NSDateFormatter *)timestamp;
{
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
        [timestamp setDateFormat:@"EEE, d MMM yyyy HH:mm:ss Z"];
        
    }
    return self;
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *text = dictionary[@"text"];
    NSDate *timestamp = dictionary[@"timestamp"];
    
    return [self initWithTitle:title body:text date:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @ {
        @"title": self.title,
        @"text" : self.text,
        @"timestamp": self.timestamp
    };
}

#pragma Methods

- (void) addObject:(NSString *)object;
{
    [self.internalEntries addObject:object];
}
-(void) removeObject:(NSString *)object;
{
    [self.internalEntries removeObject:object];
}
-(void) updateObject:(NSArray *)object;
{
    [self.internalEntries addObject:object];
}
- (NSArray *)entries;
{
   return self.internalEntries;
}

@end

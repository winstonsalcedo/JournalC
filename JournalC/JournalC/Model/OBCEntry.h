//
//  OBCEntry.h
//  JournalC
//
//  Created by winston salcedo on 5/20/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBCEntry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong, readonly, nonnull) NSDate *timestamp;

- (instancetype) initWithTitle:(NSString *)title body:(NSString *)text date:(NSDateFormatter *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

- (void) addObject:(NSString *)object;
- (void) removeObject:(NSString *)object;
- (void) updateObject:(NSArray *)object;



@end

NS_ASSUME_NONNULL_END

//
//  OBCEntryController.h
//  JournalC
//
//  Created by winston salcedo on 5/20/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBCEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface OBCEntryController : NSObject

//MARK: - Properties
@property (nonatomic, strong) NSArray *entries;

#pragma - Shared instance
+ (OBCEntryController *) shared;

#pragma - Methods
- (void) updateEntry:(OBCEntry *)entry withTitle:(NSString *)title text:(NSString *)text;
- (void) removeEntry:(OBCEntry*)entry;
- (void) addEntry:(OBCEntry *)entry;
- (void) saveToPresistentStorage;
- (void)loadFromPersistentStorage;


@end

NS_ASSUME_NONNULL_END

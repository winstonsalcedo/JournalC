//
//  OBCEntryListTableViewController.h
//  JournalC
//
//  Created by winston salcedo on 5/20/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@ class OBCEntry;

NS_ASSUME_NONNULL_BEGIN

@interface OBCEntryListTableViewController : UITableViewController

@property (nonatomic, strong) OBCEntry *entry;

@end

NS_ASSUME_NONNULL_END

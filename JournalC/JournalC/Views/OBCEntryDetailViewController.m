//
//  OBCEntryDetailViewController.m
//  JournalC
//
//  Created by winston salcedo on 5/20/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import "OBCEntryDetailViewController.h"
#import "OBCEntryController.h"

@interface OBCEntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTexView;

@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;


@end

@implementation OBCEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)tagButtonTapped:(UIButton *)sender {
  
}

- (IBAction)saveButtonTapped:(UIButton *)sender {
    if (self.entry) {
        [[OBCEntryDetailViewController shared] updateObject:self.entry withTitle:self.entryTextField.text text:self.bodyTexView.text];
        
    }else {
        OBCEntry *entry = [[[OBCEntry alloc] initWithTitle:self.entryTextField.text body:self.bodyTexView.text  date:_timestampLabel.text = timestamp: NSDate] ];
    }
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)clearButtonTapped:(UIButton *)sender {
    self.entryTextField.text = @"";
    self.bodyTexView.text = @"";
    
}


@end

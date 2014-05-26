//
//  QuizView.h
//  Quiz
//
//  Created by Josh Tobin on 5/25/14.
//  Copyright (c) 2014 Josh Tobin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizView : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>


@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *label2;




- (IBAction)submit:(id)sender;


@end

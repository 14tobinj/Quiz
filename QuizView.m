//
//  QuizView.m
//  Quiz
//
//  Created by Josh Tobin on 5/25/14.
//  Copyright (c) 2014 Josh Tobin. All rights reserved.
//

#import "QuizView.h"

@interface QuizView ()
@property(strong, nonatomic) NSMutableArray *pickerViewData;
@property(strong, nonatomic) NSArray *answer1;
@property(strong, nonatomic) NSArray *answer2;
@property(strong, nonatomic) NSArray *answer3;
@property(strong, nonatomic) NSArray *answer4;
@property(strong, nonatomic) NSArray *answer5;

@property(strong, nonatomic) NSString *currentQ;
@property(strong, nonatomic) NSString *q1;
@property(strong, nonatomic) NSString *q2;
@property(strong, nonatomic) NSString *q3;
@property(strong, nonatomic) NSString *q4;
@property(strong, nonatomic) NSString *q5;




@end

@implementation QuizView
@synthesize label, label2, submitButton, picker;
int q1A;
int q2A;
int q3A;
int q4A;
int q5A;
int currentQuestion = 0;
int correctAnswers = 0;
int correctIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    label2.hidden = YES;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    label2.numberOfLines = 0;
    [picker sizeToFit];
    _q1 = [[NSString alloc]initWithFormat:@"What is an Electrophile?"];
    _answer1 = [[NSArray alloc] initWithObjects: @"A Lewis Base", @"A Lewis Acid", @"C8H25",  nil];
    q1A = 1;
    
    _q2 = [[NSString alloc]initWithFormat:@"Which Molecule has the Molecular Formula C2H2?"];
    _answer2 = [[NSArray alloc] initWithObjects: @"Ethane", @"Ethene", @"Ethyne", nil];
    q2A = 2;
    
    _q3 = [[NSString alloc]initWithFormat:@"Which atom is the most electronegative?"];
    _answer3 = [[NSArray alloc] initWithObjects: @"Fluorine", @"Hydrogen", @"Oxygen", nil];
    q3A = 0;
    
    _q4 = [[NSString alloc]initWithFormat:@"What does a sharp peak at 1750 cm-1 \non the IR spectra mean?"];
    _answer4 = [[NSArray alloc] initWithObjects: @"C=C stretch", @"C-H in-plane bending", @"C=O stretch", nil];
    q4A = 2;
    
    
    _q5 = [[NSString alloc]initWithFormat:@"Which of the following acids is the strongest?"];
    _answer5 = [[NSArray alloc] initWithObjects: @"Hydrofluoric Acid", @"Fluoroantimonic Acid", @"Sulfuric Acid", nil];
    q5A = 1;
    
    self.currentQ = _q1;
    _pickerViewData = [[ NSMutableArray alloc] init ];
    [_pickerViewData addObjectsFromArray:_answer1];
    NSLog(@"%@", _pickerViewData);
    correctIndex = q1A;
    label.text = _currentQ;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)submit:(id)sender{
    NSInteger s = [picker selectedRowInComponent:0];
    int select = s;
    currentQuestion++;
    if(correctIndex == select)
        correctAnswers++;
    switch(currentQuestion)
    {
        case 1:
            _currentQ = _q2;
            correctIndex = q2A;
            for(int x = 0; x<3; x++)
                [_pickerViewData replaceObjectAtIndex:x withObject:[_answer2 objectAtIndex:x]];
            break;
        case 2:
            _currentQ = _q3;
            correctIndex = q3A;
            for(int x = 0; x<3; x++)
                [_pickerViewData replaceObjectAtIndex:x withObject:[_answer3 objectAtIndex:x]];
            break;
        case 3:
            _currentQ = _q4;
            correctIndex = q4A;
            for(int x = 0; x<3; x++)
                [_pickerViewData replaceObjectAtIndex:x withObject:[_answer4 objectAtIndex:x]];
            break;
        case 4:
            _currentQ = _q5;
            correctIndex = q5A;
            for(int x = 0; x<3; x++)
                [_pickerViewData replaceObjectAtIndex:x withObject:[_answer5 objectAtIndex:x]];
            break;
        case 5:
            picker.hidden = YES;
            submitButton.hidden = YES;
            _currentQ = @"Congratulations, You Finished";
            label2.hidden = NO;
            label2.text = [NSString stringWithFormat: @"You got %i out of 5 answers correct", correctAnswers];
            break;
    }
    NSLog(@"%@", _pickerViewData);
    label.text = _currentQ;
    [picker reloadAllComponents];
    

    
}



#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//Number of Columns
{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_pickerViewData count];
}

#pragma mark picker delegate methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_pickerViewData objectAtIndex:row];
}


@end

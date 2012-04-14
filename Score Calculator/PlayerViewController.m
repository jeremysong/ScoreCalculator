//
//  PlayerViewController.m
//  Score Calculator
//
//  Created by Song Jeremy on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerViewController.h"
#import <QuartzCore/CALayer.h>
#import "AppDelegate.h"
#import "CoreDataCommunicator.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

@synthesize selectedPlayer;
@synthesize equation;
@synthesize result;
@synthesize managedObjectContext;
@synthesize playerArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#define plusOne 11
#define plusTwo 12
#define plusFive 15
#define plusTen 110
#define minusOne 21
#define minusTwo 22
#define minusFive 25
#define minusTen 210
#define multiTwo 32
#define multiThree 33
#define multiFive 35
#define multiTen 310
#define divideTwo 42
#define divideThree 43
#define divideFive 45
#define divideTen 410

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    managedObjectContext = [appdelegate managedObjectContext];
    
    [self setTitle:[selectedPlayer name]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
    UIBarButtonItem *winButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"I Win", nil) style:UIBarButtonItemStylePlain target:self action:@selector(winAlert)];
    self.navigationItem.rightBarButtonItem = winButton;
    
    UILabel *screenLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 80)];
    [screenLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"showresult.png"]]];
    
    equation = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 140, 40)];
    result = [[UILabel alloc] initWithFrame:CGRectMake(180, 30, 110, 60)];
    
    [equation setBackgroundColor:[UIColor clearColor]];
    [result setBackgroundColor:[UIColor clearColor]];
    
    [equation setFont:[UIFont systemFontOfSize:20]];
    [result setFont:[UIFont systemFontOfSize:35]];
    
    [result setTextAlignment:UITextAlignmentRight];
    [result setText:[[selectedPlayer score] stringValue]];
    
    [self.view addSubview:screenLabel];
    [self.view addSubview:equation];
    [self.view addSubview:result];
    
    UIButton *plusOneButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 120, 57, 57)];
    UIButton *plusTwoButton = [[UIButton alloc] initWithFrame:CGRectMake(94, 120, 57, 57)];
    UIButton *plusFiveButton = [[UIButton alloc] initWithFrame:CGRectMake(168, 120, 57, 57)];
    UIButton *plusTenButton = [[UIButton alloc] initWithFrame:CGRectMake(242, 120, 57, 57)];
    
    UIButton *minusOneButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 194, 57, 57)];
    UIButton *minusTwoButton = [[UIButton alloc] initWithFrame:CGRectMake(94, 194, 57, 57)];
    UIButton *minusFiveButton = [[UIButton alloc] initWithFrame:CGRectMake(168, 194, 57, 57)];
    UIButton *minusTenButton = [[UIButton alloc] initWithFrame:CGRectMake(242, 194, 57, 57)];    
    
    UIButton *multiTwoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 268, 57, 57)];
    UIButton *multiThreeButton = [[UIButton alloc] initWithFrame:CGRectMake(94, 268, 57, 57)];
    UIButton *multiFiveButton = [[UIButton alloc] initWithFrame:CGRectMake(168, 268, 57, 57)];
    UIButton *multiTenButton = [[UIButton alloc] initWithFrame:CGRectMake(242, 268, 57, 57)];
    
    UIButton *divideTwoButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 342, 57, 57)];
    UIButton *divideThreeButton = [[UIButton alloc] initWithFrame:CGRectMake(94, 342, 57, 57)];
    UIButton *divideFiveButton = [[UIButton alloc] initWithFrame:CGRectMake(168, 342, 57, 57)];
    UIButton *divideTenButton = [[UIButton alloc] initWithFrame:CGRectMake(242, 342, 57, 57)];
    
    [plusOneButton setBackgroundImage:[UIImage imageNamed:@"orangeButton.png"] forState:UIControlStateNormal];
    [plusTwoButton setBackgroundImage:[UIImage imageNamed:@"orangeButton.png"] forState:UIControlStateNormal];
    [plusFiveButton setBackgroundImage:[UIImage imageNamed:@"orangeButton.png"] forState:UIControlStateNormal];
    [plusTenButton setBackgroundImage:[UIImage imageNamed:@"orangeButton.png"] forState:UIControlStateNormal];
    
    [minusOneButton setBackgroundImage:[UIImage imageNamed:@"blueButton.png"] forState:UIControlStateNormal];
    [minusTwoButton setBackgroundImage:[UIImage imageNamed:@"blueButton.png"] forState:UIControlStateNormal];
    [minusFiveButton setBackgroundImage:[UIImage imageNamed:@"blueButton.png"] forState:UIControlStateNormal];
    [minusTenButton setBackgroundImage:[UIImage imageNamed:@"blueButton.png"] forState:UIControlStateNormal];

    [multiTwoButton setBackgroundImage:[UIImage imageNamed:@"redButton.png"] forState:UIControlStateNormal];
    [multiThreeButton setBackgroundImage:[UIImage imageNamed:@"redButton.png"] forState:UIControlStateNormal];
    [multiFiveButton setBackgroundImage:[UIImage imageNamed:@"redButton.png"] forState:UIControlStateNormal];
    [multiTenButton setBackgroundImage:[UIImage imageNamed:@"redButton.png"] forState:UIControlStateNormal];
    
    [divideTwoButton setBackgroundImage:[UIImage imageNamed:@"greenButton.png"] forState:UIControlStateNormal];
    [divideThreeButton setBackgroundImage:[UIImage imageNamed:@"greenButton.png"] forState:UIControlStateNormal];
    [divideFiveButton setBackgroundImage:[UIImage imageNamed:@"greenButton.png"] forState:UIControlStateNormal];
    [divideTenButton setBackgroundImage:[UIImage imageNamed:@"greenButton.png"] forState:UIControlStateNormal];
    
    [plusOneButton setTitle:@"+1" forState:UIControlStateNormal];
    [plusTwoButton setTitle:@"+2" forState:UIControlStateNormal];
    [plusFiveButton setTitle:@"+5" forState:UIControlStateNormal];
    [plusTenButton setTitle:@"+10" forState:UIControlStateNormal];
    [minusOneButton setTitle:@"-1" forState:UIControlStateNormal];
    [minusTwoButton setTitle:@"-2" forState:UIControlStateNormal];
    [minusFiveButton setTitle:@"-5" forState:UIControlStateNormal];
    [minusTenButton setTitle:@"-10" forState:UIControlStateNormal];
    [multiTwoButton setTitle:@"x2" forState:UIControlStateNormal];
    [multiThreeButton setTitle:@"x3" forState:UIControlStateNormal];
    [multiFiveButton setTitle:@"x5" forState:UIControlStateNormal];
    [multiTenButton setTitle:@"x10" forState:UIControlStateNormal];
    [divideTwoButton setTitle:@"÷2" forState:UIControlStateNormal];
    [divideThreeButton setTitle:@"÷3" forState:UIControlStateNormal];
    [divideFiveButton setTitle:@"÷5" forState:UIControlStateNormal];
    [divideTenButton setTitle:@"÷10" forState:UIControlStateNormal];
    
    [plusOneButton setTag:plusOne];
    [plusTwoButton setTag:plusTwo];
    [plusFiveButton setTag:plusFive];
    [plusTenButton setTag:plusTen];
    [minusOneButton setTag:minusOne];
    [minusTwoButton setTag:minusTwo];
    [minusFiveButton setTag:minusFive];
    [minusTenButton setTag:minusTen];
    [multiTwoButton setTag:multiTwo];
    [multiThreeButton setTag:multiThree];
    [multiFiveButton setTag:multiFive];
    [multiTenButton setTag:multiTen];
    [divideTwoButton setTag:divideTwo];
    [divideThreeButton setTag:divideThree];
    [divideFiveButton setTag:divideFive];
    [divideTenButton setTag:divideTen];
    
    [plusOneButton setTitleShadowColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [plusTwoButton setTitleShadowColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [plusFiveButton setTitleShadowColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [plusTenButton setTitleShadowColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [minusOneButton setTitleShadowColor:[UIColor blueColor] forState:UIControlStateNormal];
    [minusTwoButton setTitleShadowColor:[UIColor blueColor] forState:UIControlStateNormal];
    [minusFiveButton setTitleShadowColor:[UIColor blueColor] forState:UIControlStateNormal];
    [minusTenButton setTitleShadowColor:[UIColor blueColor] forState:UIControlStateNormal];
    [multiTwoButton setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    [multiThreeButton setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    [multiFiveButton setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    [multiTenButton setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    [divideTwoButton setTitleShadowColor:[UIColor greenColor] forState:UIControlStateNormal];
    [divideThreeButton setTitleShadowColor:[UIColor greenColor] forState:UIControlStateNormal];
    [divideFiveButton setTitleShadowColor:[UIColor greenColor] forState:UIControlStateNormal];
    [divideTenButton setTitleShadowColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    NSMutableArray *buttonArray = [[NSMutableArray alloc] initWithCapacity:16];
    [buttonArray addObject:plusOneButton];
    [buttonArray addObject:plusTwoButton];
    [buttonArray addObject:plusFiveButton];
    [buttonArray addObject:plusTenButton];
    [buttonArray addObject:minusOneButton];
    [buttonArray addObject:minusTwoButton];
    [buttonArray addObject:minusFiveButton];
    [buttonArray addObject:minusTenButton];
    [buttonArray addObject:multiTwoButton];
    [buttonArray addObject:multiThreeButton];
    [buttonArray addObject:multiFiveButton];
    [buttonArray addObject:multiTenButton];
    [buttonArray addObject:divideTwoButton];
    [buttonArray addObject:divideThreeButton];
    [buttonArray addObject:divideFiveButton];
    [buttonArray addObject:divideTenButton];
    
    for (UIButton *button in buttonArray) {
        [button.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [button.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
        [button.layer setShadowRadius:3.0f];
        [button.layer setShadowOpacity:1.0];
        [button.titleLabel setFont:[UIFont systemFontOfSize:25]];
        [button.titleLabel setShadowOffset:CGSizeMake(1, 1)];
        [button addTarget:self action:@selector(arithmetic:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSError *saveError;
    [self.managedObjectContext save:&saveError];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)arithmetic:(id)sender
{
    int tagNumber = [sender tag];
    NSString *equationString;
    int resultNumber;
    int initNumber = [[selectedPlayer score] intValue];
    
    switch (tagNumber) {
        case 11: //+1
        {
            resultNumber = initNumber + 1;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" + 1 ="];
        }
            break;
        case 12: //+2
        {
            resultNumber = initNumber + 2;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" + 2 ="];
        }
            break;
        case 15: //+5
        {
            resultNumber = initNumber + 5;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" + 5 ="];
        }
            break;
        case 110: //+10
        {
            resultNumber = initNumber + 10;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" + 10 ="];
        }
            break;
        case 21: //-1
        {
            resultNumber = initNumber - 1;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" - 1 ="];
        }
            break;
        case 22: //-2
        {
            resultNumber = initNumber - 2;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" - 2 ="];
        }
            break;
        case 25: //-5
        {
            resultNumber = initNumber - 5;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" - 5 ="];
        }
            break;
        case 210: //-10
        {
            resultNumber = initNumber - 10;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" - 10 ="];
        }
            break;
        case 32: //x2
        {
            resultNumber = initNumber * 2;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" x 2 ="];
        }
            break;
        case 33: //x3
        {
            resultNumber = initNumber * 3;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" x 3 ="];
        }
            break;
        case 35: //x5
        {
            resultNumber = initNumber * 5;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" x 5 ="];
        }
            break;
        case 310: //x10
        {
            resultNumber = initNumber * 10;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" x 10 ="];
        }
            break;
        case 42: //÷2
        {
            resultNumber = initNumber / 2;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" ÷ 2 ="];
        }
            break;
        case 43: //÷3
        {
            resultNumber = initNumber / 3;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" ÷ 3 ="];
        }
            break;
        case 45: //÷5
        {
            resultNumber = initNumber / 5;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" ÷ 5 ="];
        }
        case 410: //÷10
        {
            resultNumber = initNumber / 10;
            equationString = [[NSString alloc] initWithFormat:@"%d%@", initNumber, @" ÷ 10 ="];
        }
        default:
            break;
    }
    
    [result setText:[NSString stringWithFormat:@"%d",resultNumber]];
    [equation setText:equationString];
    [selectedPlayer setScore:[NSNumber numberWithInt:resultNumber]];
    initNumber = resultNumber;
    
}

-(void)winAlert
{
    [playerArray removeAllObjects];
    playerArray = [CoreDataCommunicator searchObjectsForEntity:@"Player" withPredicate:nil andSortKey:@"seq" andSortAscending:NO andContext:managedObjectContext];    
    
    //if only one player, you cannot claim other player's score.
    if ([playerArray count] == 1) {
        UIAlertView *singleAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"You're Winner!", nil) message:NSLocalizedString(@"What do you want to do?", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Nothing To Do", nil) otherButtonTitles:NSLocalizedString(@"Clear Score", nil), nil];
        [singleAlert show];
    } else {
        UIAlertView *winAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"You're Winner!", nil) message:NSLocalizedString(@"What do you want to do?", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Nothing To Do", nil) otherButtonTitles:NSLocalizedString(@"Just Clear All Scores", nil),NSLocalizedString(@"Claim Other Player's Scores", nil), nil];
        [winAlert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        for (Player *player in playerArray) {
            [player setScore:[NSNumber numberWithInt:0]];
        }
    } else if (buttonIndex == 2) {
        int addition = 0;
        for (Player *player in playerArray) {
            addition += [[player score] intValue];
            [player setScore:[NSNumber numberWithInt:0]];
        }
        [selectedPlayer setScore:[NSNumber numberWithInt:addition]];
    }
    [result setText:[[selectedPlayer score] stringValue]];
    [equation setText:@""];
//    NSError *saveError;
//    [self.managedObjectContext save:&saveError];
}

@end

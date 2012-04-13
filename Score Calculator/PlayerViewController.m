//
//  PlayerViewController.m
//  Score Calculator
//
//  Created by Song Jeremy on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

@synthesize selectedPlayer;
@synthesize equation;
@synthesize result;

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
    
    [self setTitle:[selectedPlayer name]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
    UILabel *screenLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 80)];
    [screenLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"showresult.png"]]];
    
    equation = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 180, 40)];
    result = [[UILabel alloc] initWithFrame:CGRectMake(230, 30, 60, 60)];
    
    [equation setBackgroundColor:[UIColor clearColor]];
    [result setBackgroundColor:[UIColor clearColor]];
    
    [equation setFont:[UIFont systemFontOfSize:20]];
    [result setFont:[UIFont systemFontOfSize:35]];
    
    //test value
    [equation setText:@"12 + 24 ="];
    [result setText:@"36"];
    
    
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
    
    [plusOneButton setBackgroundColor:[UIColor whiteColor]];
    [plusTwoButton setBackgroundColor:[UIColor whiteColor]];
    [plusFiveButton setBackgroundColor:[UIColor whiteColor]];
    [plusTenButton setBackgroundColor:[UIColor whiteColor]];
    
    [minusOneButton setBackgroundColor:[UIColor whiteColor]];
    
    [multiTwoButton setBackgroundColor:[UIColor whiteColor]];
    
    [divideTwoButton setBackgroundColor:[UIColor whiteColor]];
    
    
    [self.view addSubview:plusOneButton];
    [self.view addSubview:plusTwoButton];
    [self.view addSubview:plusFiveButton];
    [self.view addSubview:plusTenButton];
    
    [self.view addSubview:minusOneButton];
    [self.view addSubview:minusTwoButton];
    [self.view addSubview:minusFiveButton];
    [self.view addSubview:minusTenButton];
    
    [self.view addSubview:multiTwoButton];
    [self.view addSubview:multiThreeButton];
    [self.view addSubview:multiFiveButton];
    [self.view addSubview:multiTenButton];
    
    [self.view addSubview:divideTwoButton];
    [self.view addSubview:divideThreeButton];
    [self.view addSubview:divideFiveButton];
    [self.view addSubview:divideTenButton];
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
    
}

@end

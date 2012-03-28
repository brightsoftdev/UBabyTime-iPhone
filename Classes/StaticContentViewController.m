//
//  StaticContentViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StaticContentViewController.h"

@interface StaticContentViewController() 
-(id)findContentViewByLabelIndentifier:(NSString*)labelIdentifier;
@end

@implementation StaticContentViewController
@synthesize delegate=_delegate;
@synthesize labelIdentifier = _labelIdentifier;
@synthesize currentController = _currentController;


-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier withAnimationOptions:(UIViewAnimationOptions)options{
    UIViewController *vc = [self findContentViewByLabelIndentifier:labelIdentifier];
    [UIView transitionWithView:self.view duration:0.5 options:options animations:^{
        [self.currentController.view removeFromSuperview];
        [self.view addSubview:vc.view];
    } completion:NULL];
    
    self.currentController = vc;
}

-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier{
    [self loadContentByLabelIdentifier:labelIdentifier withAnimationOptions:UIViewAnimationOptionTransitionFlipFromLeft];
}

-(id)findContentViewByLabelIndentifier:(NSString*)labelIdentifier{
    if([labelIdentifier isEqualToString:kTodayTips]){
        CoverViewController *cvc = [[CoverViewController alloc] initWithCoverViewDelegate:self];
        return [cvc autorelease];
    }if ([labelIdentifier isEqualToString:kCheckList]) {
        CMTableViewController *tvc = [[CMTableViewController alloc] init];
        return [tvc autorelease];
    }else{
        ArticleViewController *avc = [[ArticleViewController alloc] initWithNibName:@"ArticleViewController" bundle:nil];
        avc.controllerDelegate = self;
        return [avc autorelease];
    }
    
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
}

#pragma mark - CoverViewDelegate

-(void)proposalDetailButtonClick:(id)sender;{
    [self loadContentByLabelIdentifier:@"article"];
}

#pragma mark - ArticleViewControllerDelegate

-(void)backButtonClick:(id)sender{
    [self loadContentByLabelIdentifier:@"test"];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

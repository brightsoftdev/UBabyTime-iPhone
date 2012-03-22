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

-(id)initWithLabelIdentifier:(NSString *)labelIdentifier{
    self = [self init];
    if(self){
        _labelIdentifier = labelIdentifier;
    }
    return self;
}

-(void)addContentByLabelIdentifier:(NSString*)labelIdentifier{
    UIViewController *vc = [self findContentViewByLabelIndentifier:labelIdentifier];
    [self.view addSubview:vc.view];
    self.currentController = vc;
    [vc release];
}

-(id)findContentViewByLabelIndentifier:(NSString*)labelIdentifier{
    if([labelIdentifier isEqualToString:@"test"]){
        CoverViewController *cvc = [[CoverViewController alloc] initWithCoverViewDelegate:self];
        return cvc;
    }else{
        ArticleViewController *avc = [[ArticleViewController alloc] initWithNibName:@"ArticleViewController" bundle:nil];
        avc.controllerDelegate = self;
        return avc;
    }
    
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
}

#pragma mark - CoverViewDelegate

-(void)proposalDetailButtonClick:(id)sender;{
    NSLog(@"test");
    [UIView transitionWithView:self.view 
                    duration:0.5 
                    options:UIViewAnimationOptionTransitionFlipFromLeft //any animation
                    animations:^ {
                        [_currentController.view removeFromSuperview];
                        [self addContentByLabelIdentifier:@"article"]; 
                        
                    }
                    completion:NULL];
}

#pragma mark - ArticleViewControllerDelegate

-(void)backButtonClick:(id)sender{
    [UIView transitionWithView:self.view 
                      duration:0.5 
                       options:UIViewAnimationOptionTransitionFlipFromLeft //any animation
                    animations:^ {
                        [_currentController.view removeFromSuperview];
                        [self addContentByLabelIdentifier:@"test"]; 
                        
                    }
                    completion:NULL];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addContentByLabelIdentifier:_labelIdentifier];
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

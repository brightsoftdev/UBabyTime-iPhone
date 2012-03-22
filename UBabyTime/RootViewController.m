//
//  RootViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "UIApplication+Addition.h"

#define CONTENT_VIEW_ORIGIN_X   7.0f
#define CONTENT_VIEW_ORIGIN_Y   7.0f

#define LABEL_BAR_VIEW_HEIGHT   64.0f
#define LABEL_BAR_VIEW_DROP_Y 396.0f

#define USER_NOT_OPEN   0

@interface RootViewController()
@property (nonatomic, retain) LoginViewController *loginViewController;
- (void)loadLabelBarView;
- (void)loadLoginView;

- (void)raiseLoginViewAnimated:(BOOL)animated;
- (void)dropLoginViewAnimated:(BOOL)animated;
@end

@implementation RootViewController
@synthesize loginViewController = _loginViewController;
@synthesize contentViewController = _contentViewController;
@synthesize labelBarViewController = _labelBarViewController;

- (void)dealloc {
    [_labelBarViewController release];
    [_contentViewController release];
    [_openedUserHeap release];
    [_loginViewController release];
    [super dealloc];
}

#pragma mark -
#pragma mark UI methods

// make sure label bar view is load before all the other views.
- (void)loadLabelBarView {
    NSArray *labelInfo = [LabelConverter getSystemDefaultLabelsInfo];
    self.labelBarViewController = [[[LabelBarViewController alloc] initWithLabelInfoArray:labelInfo] autorelease];
    _labelBarViewController.delegate = self;
    CGRect frame = _labelBarViewController.view.frame;
    frame.origin.y = LABEL_BAR_VIEW_DROP_Y;
    _labelBarViewController.view.frame = frame;
    [self.view addSubview:self.labelBarViewController.view];
    self.labelBarViewController.view.userInteractionEnabled = YES;
}

- (void)loadLoginView{
    self.loginViewController = [[[LoginViewController alloc] init] autorelease];
    [self.view insertSubview:self.loginViewController.view belowSubview:self.labelBarViewController.view];
    self.loginViewController.view.userInteractionEnabled = NO;
}

- (void)loadFakeContentView {
    [self.contentViewController.view removeFromSuperview];
    self.contentViewController = [[[StaticContentViewController alloc] init] autorelease];
    [self.contentViewController loadContentByLabelIdentifier:@"test"];
    self.contentViewController.view.frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, self.contentViewController.view.frame.size.width, self.contentViewController.view.frame.size.height);
    [self.view insertSubview:self.contentViewController.view belowSubview:self.labelBarViewController.view];
    self.contentViewController.view.userInteractionEnabled = NO;
}

- (void)loadContentView {
    [self.contentViewController.view removeFromSuperview];
    self.contentViewController = [[[StaticContentViewController alloc] init] autorelease];
    [self.contentViewController loadContentByLabelIdentifier:@"test"];
    self.contentViewController.view.frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, self.contentViewController.view.frame.size.width, self.contentViewController.view.frame.size.height);
    [self.view insertSubview:self.contentViewController.view belowSubview:self.labelBarViewController.view];
    self.contentViewController.view.userInteractionEnabled = YES;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadLabelBarView];
    [self loadFakeContentView];
    [self loadLoginView];
    [self raiseLoginViewAnimated:NO];
    [self.labelBarViewController showLoginLabelAnimated:YES];
    self.labelBarViewController.view.alpha = 0;
    self.loginViewController.view.alpha = 0;
    [UIView animateWithDuration:0.4f animations:^{
        self.labelBarViewController.view.alpha = 1.0f;
        self.loginViewController.view.alpha = 1.0f;
    }];}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark LabelBarViewController delegate
- (void)labelBarView:(LabelBarViewController *)labelBar didSelectParentLabelAtIndex:(NSUInteger)index {
    NSLog(@"labelBarView:%@ didSelectParentLabelAtIndex:%d,labelBar.currentParentLabelIndex:%d",[labelBar labelInfoArray],index,labelBar.currentParentLabelIndex);
    if(labelBar.currentParentLabelIndex!=index){
        LabelInfo *labelInfo = [[labelBar labelInfoArray] objectAtIndex:index];
        [self.contentViewController loadContentByLabelIdentifier:labelInfo.identifier];
    }
}

- (void)labelBarView:(LabelBarViewController *)labelBar didSelectChildLabelWithIndentifier:(NSString *)identifier inParentLabelAtIndex:(NSUInteger)index {
    NSLog(@"labelBarView:%@ didSelectChildLabelWithIndentifier:%@ inParentLabelAtIndex:%d",labelBar,identifier,index);
    //[self.contentViewController setContentViewAtIndex:index forIdentifier:identifier];
}

- (void)labelBarView:(LabelBarViewController *)labelBar didRemoveParentLabelAtIndex:(NSUInteger)index {
    //[self.contentViewController removeContentViewAtIndex:index];
    //  NSLog(@"open user heap count:%d", _openedUserHeap.count);
    NSLog(@"labelBarView:%@ didRemoveParentLabelAtIndex:%d",labelBar,index);
    [_openedUserHeap enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSNumber *openedUserIndex = obj;
        if(openedUserIndex.unsignedIntValue == index) {
            [_openedUserHeap removeObjectForKey:key];
            *stop = YES;
        }
    }];
    [_openedUserHeap enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSNumber *openedUserIndex = obj;
        if(openedUserIndex.unsignedIntValue > index){
            [_openedUserHeap setObject:[NSNumber numberWithUnsignedInt:openedUserIndex.unsignedIntValue - 1] forKey:key];
        }
    }];
}

- (void)labelBarView:(LabelBarViewController *)labelBar willOpenParentLabelAtIndex:(NSUInteger)index {
    //NSString *identifier = [self.contentViewController currentContentIdentifierAtIndex:index];
    //[self.labelBarViewController selectChildLabelWithIdentifier:identifier];
   NSLog(@"labelBarView:%@ willOpenParentLabelAtIndex:%d",labelBar,index);

}

- (void)didSelectLoginLabel {
    if(NO) {
        [[UIApplication sharedApplication] presentToast:@"请登录人人网和新浪微博。" withVerticalPos:kToastBottomVerticalPosition];
    }
    else {
        //self.userDict = self.loginViewController.userDict;
        self.labelBarViewController.loginButton.userInteractionEnabled = NO;
        if(self.loginViewController.modalViewController) {
            [self.loginViewController dismissViewControllerAnimated:YES completion:^{
                [self dropLoginViewAnimated:YES];
            }];
        }
        else 
            [self dropLoginViewAnimated:YES];
    }
}

#pragma mark -
#pragma mark Animations

- (void)dropLabelBarViewAnimationWithCompletion:(void (^)(void))completion {
    CGRect labelBarFrame = self.labelBarViewController.view.frame;
    CGFloat offset = 460.0f - labelBarFrame.size.height;
    if(labelBarFrame.origin.y == offset) {
        if(completion)
            completion();
        return;
    }
    
    labelBarFrame.origin.y = offset;
    
    CGRect contentFrame = self.contentViewController.view.frame;
    contentFrame.origin.y = CONTENT_VIEW_ORIGIN_Y + offset;
    
    [UIView animateWithDuration:0.5f animations:^{
        self.labelBarViewController.view.frame = labelBarFrame;
        self.contentViewController.view.frame = contentFrame;
    } completion:^(BOOL finished) {
        if(completion)
            completion();
    }];
}

- (void)raiseLabelBarViewAnimationWithCompletion:(void (^)(void))completion {
    CGRect labelBarFrame = self.labelBarViewController.view.frame;
//    if(labelBarFrame.origin.y == 0) {
//        if(completion)
//            completion();
//        return;
//    }
//    
//    labelBarFrame.origin.y = 0;
    
    CGRect contentFrame = self.contentViewController.view.frame;
    contentFrame.origin.y = CONTENT_VIEW_ORIGIN_Y;
    
    [UIView animateWithDuration:0.5f animations:^{
        self.labelBarViewController.view.frame = labelBarFrame;
        self.contentViewController.view.frame = contentFrame;
    } completion:^(BOOL finished) {
        if(completion)
            completion();
    }];
}

- (void)dropLoginViewAnimationWithCompletion:(void (^)(void))completion {
    CGRect frame = self.loginViewController.view.frame;
    if(frame.origin.y == 460.0f) {
        if(completion)
            completion();
        return;
    }
    
    frame.origin.y = 460.0f;
    
    [UIView animateWithDuration:0.5f animations:^{
        self.loginViewController.view.frame = frame;
    } completion:^(BOOL finished) {
        if(completion)
            completion();
    }];
}

- (void)raiseLoginViewAnimationWithCompletion:(void (^)(void))completion {
    CGRect frame = self.loginViewController.view.frame;
    if(frame.origin.y == 0) {
        if(completion)
            completion();
        return;
    }
    
    frame.origin.y = 0;
    
    [UIView animateWithDuration:0.5f animations:^{
        self.loginViewController.view.frame = frame;
    } completion:^(BOOL finished) {
        if(completion)
            completion();
    }];
}

- (void)dropLoginViewAnimated:(BOOL)animated {
    if(animated) {
        self.loginViewController.view.userInteractionEnabled = NO;
        [self dropLoginViewAnimationWithCompletion:^{
            [self raiseLabelBarViewAnimationWithCompletion:^{
                self.contentViewController.view.userInteractionEnabled = YES;
                [self.labelBarViewController hideLoginLabelAnimated:YES];
                
                [self performSelector:@selector(loadContentView) withObject:nil afterDelay:0.6f];
                
                [self.loginViewController.view removeFromSuperview];
                self.loginViewController = nil;
            }];
        }];
    }
    else {
        CGRect frame;
        frame = self.loginViewController.view.frame;
        frame.origin.y = 460.0f;
        self.loginViewController.view.frame = frame;
        
        frame = self.contentViewController.view.frame;
        frame.origin.y = CONTENT_VIEW_ORIGIN_Y;
        self.contentViewController.view.frame = frame;
        
        frame = self.labelBarViewController.view.frame;
        frame.origin.y = 0;
        self.labelBarViewController.view.frame = frame;
        
        self.contentViewController.view.userInteractionEnabled = YES;
        self.loginViewController.view.userInteractionEnabled = NO;
    }
}

- (void)raiseLoginViewAnimated:(BOOL)animated {
    if(animated) {
        self.contentViewController.view.userInteractionEnabled = NO;
        [self dropLabelBarViewAnimationWithCompletion:^{
            [self raiseLoginViewAnimationWithCompletion:^{
                self.loginViewController.view.userInteractionEnabled = YES;
            }];
        }];
    }
    else {
        CGRect frame;
        frame = self.loginViewController.view.frame;
        frame.origin.y = 0;
        self.loginViewController.view.frame = frame;
        
        frame = self.contentViewController.view.frame;
        frame.origin.y = 460.0f;
        self.contentViewController.view.frame = frame;
        
        frame = self.labelBarViewController.view.frame;
        frame.origin.y = LABEL_BAR_VIEW_DROP_Y;
        self.labelBarViewController.view.frame = frame;
        
        self.contentViewController.view.userInteractionEnabled = NO;
        self.loginViewController.view.userInteractionEnabled = YES;
    }
}


@end

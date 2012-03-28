//
//  CoverView.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoverView.h"

@implementation CoverView
@synthesize pageIndex = _pageIndex;

@synthesize titleView = _titleView;
@synthesize tipsView = _tipsView;
@synthesize proposalView = _proposalView;
@synthesize titleLabel = _titleLabel;
@synthesize tipsImage = _tipsImage;
@synthesize tipsText = _tipsText;
@synthesize proposalText = _proposalText;
@synthesize proposalDetailButton = _proposalDetailButton;
@synthesize coverViewDelegate = _coverViewDelegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)dealloc{
    [_titleView release];
    [_tipsView release];
    [_proposalView release];
    [_titleLabel release];
    [_tipsImage release];
    [_tipsText release];
    [_proposalText release];
    [_proposalDetailButton release];
    _coverViewDelegate = nil;
    [super dealloc];
}

-(IBAction)proposalDetailButtonClick:(id)sender{
    [_coverViewDelegate proposalDetailButtonClick:sender];
}

/**
 * Called after the page has gone off-screen.
 *
 * This method should be used to reset any state information after a page goes off-screen.
 * For example, in the Nimbus photo viewer we reset the zoom scale so that if the photo
 * was zoomed in it will fit on the screen again when the user flips back and forth between
 * two pages.
 */
- (void)pageDidDisappear{
    NSLog(@"CoverView-pageDidDisappear");
}

/**
 * Called when the frame of the page is going to change.
 *
 * Use this method to maintain any state that may be affected by the frame changing.
 * The Nimbus photo viewer uses this method to save and restore the zoom and center
 * point. This makes the photo always appear to rotate around the center point of the screen
 * rather than the center of the photo.
 */
- (void)setFrameAndMaintainState:(CGRect)frame{
    NSLog(@"CoverView-setFrameAndMaintainState");
}
/**
 * Called immediately after the view has been dequeued from the recycled view pool.
 */
- (void)prepareForReuse{
    NSLog(@"CoverView-prepareForReuse");
}

@end

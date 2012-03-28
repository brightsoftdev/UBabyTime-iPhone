//
//  ArticlePagingScrollViewPage.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArticlePagingScrollViewPage.h"

@implementation ArticlePagingScrollViewPage

@synthesize pageIndex;

@synthesize reuseIdentifier;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.contents = (id)[UIImage imageNamed:@"article_bg.png"].CGImage;
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.layer.shadowColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:0.2] CGColor];
        self.layer.shadowRadius = 3;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor colorWithRed:0.42 green:0.09 blue:0.07 alpha:0.12] CGColor];
        
        [self setContentMode:UIViewContentModeScaleToFill];
    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/**
 * Called after the page has gone off-screen.
 *
 * This method should be used to reset any state information after a page goes off-screen.
 * For example, in the Nimbus photo viewer we reset the zoom scale so that if the photo
 * was zoomed in it will fit on the screen again when the user flips back and forth between
 * two pages.
 */
- (void)pageDidDisappear{
    NSLog(@"ArticlePagingScrollViewPage-pageDidDisappear");
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
    NSLog(@"ArticlePagingScrollViewPage-setFrameAndMaintainState");
}
/**
 * Called immediately after the view has been dequeued from the recycled view pool.
 */
- (void)prepareForReuse{
     NSLog(@"ArticlePagingScrollViewPage-prepareForReuse");
}

@end

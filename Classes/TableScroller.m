//
//  TableScroller.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TableScroller.h"

@implementation TableScroller
@synthesize delegate = _delegate;

-(id)initWithDelegate:(id<TableScrollerDelegate>)delegate{
    self = [super initWithFrame:CGRectMake(205, 0, 80, 32)];
    if(self){
         UIImage *background = [[UIImage imageNamed:@"feed-clock-overlay"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
        UIImageView *_backgroundView = [[[UIImageView alloc] initWithImage:background] autorelease];
        _backgroundView.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        
        _tipsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(30.0f, 4.0f, 50.0f, 20.0f)] autorelease];
        _tipsLabel.textColor = [UIColor whiteColor];
        _tipsLabel.shadowColor = [UIColor blackColor];
        _tipsLabel.shadowOffset = CGSizeMake(-0.5f, -0.5f);
        _tipsLabel.backgroundColor = [UIColor clearColor];
        _tipsLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:9.0f];
        _tipsLabel.autoresizingMask = UIViewAutoresizingNone;
        [_backgroundView addSubview:_tipsLabel];
        
        [self addSubview:_backgroundView];
        
        self.alpha = 0.0f;
    }
    _delegate = delegate;
    return self;
}

- (void)scrollViewDidScroll:(UITableViewCell*)cell{
    NSString *tips = [_delegate tipsForCell:cell];
    _tipsLabel.text = tips;
   
}
- (void) scrollerShow{
    [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState  animations:^{
        self.alpha = 1.0f;
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void) scrollerHide{
    [UIView animateWithDuration:0.3f delay:1.0f options:UIViewAnimationOptionBeginFromCurrentState  animations:^{
        self.alpha = 0.0f;
        self.transform = CGAffineTransformMakeTranslation(10.0f, 0.0f);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)scrollViewDidEndDecelerating{
    [self scrollerHide];
}

- (void)scrollViewWillBeginDragging{
    [self scrollerShow];
}

@end

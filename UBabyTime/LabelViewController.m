//
//  LabelViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LabelViewController.h"
#import "Image+Addition.h"
#import "UIImageView+Addition.h"
#import "UIImage+Addition.h"

#define DEGREES_TO_RADIANS(__ANGLE) ((__ANGLE) / 180.0 * M_PI)


@implementation LabelInfo

@synthesize identifier = _identifier;
@synthesize labelName = _labelName;
@synthesize isRetractable = _isRetractable;
@synthesize isRemovable = _isRemovable;
@synthesize isSelected = _isSelected;
@synthesize isReturnLabel = _isReturnLabel;
@synthesize isParent = _isParent;
@synthesize bgImage = _bgImage;


- (void)dealloc {
    [_labelName release];
    [_identifier release];
    [_bgImage release];
    [super dealloc];
}

+ (LabelInfo *)labelInfoWithIdentifier:(NSString *)identifier labelName:(NSString *)name isRetractable:(BOOL)retractable isParent:(BOOL)isParent{
    LabelInfo *info = [[[LabelInfo alloc] init] autorelease];
    info.identifier = identifier;
    info.labelName = name;
    info.isRetractable = retractable;
    info.isParent = isParent;
    return info;
}

- (void)setBgImage:(UIImage *)bgImage {
    if(_bgImage != bgImage) {
        [_bgImage release];
        _bgImage = [bgImage retain];
    }
}
@end

@implementation LabelViewController

@synthesize titleButton = _titleButton;
@synthesize index = _index;
@synthesize delegate = _delegate;
@synthesize titleLabel = _titleLabel;
@synthesize info = _info;
@synthesize photoImageView = _photoImageView;
@synthesize bgImageView = _bgImageView;
@synthesize reservedFrame = _reservedFrame;

- (void)dealloc {
    // NSLog(@"LNLabelViewController dealloc");
    [_titleButton release];
    [_titleLabel release];
    [_photoImageView release];
    [_bgImageView release];
    _delegate = nil;
    [super dealloc];
}

- (void)setIsSelected:(BOOL)isSelected {
    self.info.isSelected = isSelected;
    if(self.isSelected) {
        [self.titleLabel setHighlighted:YES];
    }
    else {
        [self.titleLabel setHighlighted:NO];
    }
}

- (BOOL)isSelected {
    return self.info.isSelected;
}

- (BOOL)isRetractable {
    return self.info.isRetractable;
}

- (BOOL)isRemovable {
    return self.info.isRemovable;
}

- (BOOL)isReturnLabel {
    return self.info.isReturnLabel;
}

- (BOOL)isParentLabel {
    return self.info.isParent && !self.isReturnLabel;
}

- (BOOL)isChildLabel {
    return !self.isRetractable;
}

- (NSString *)labelName {
    return self.info.labelName;
}

- (void)setLabelName:(NSString *)labelName {
    self.info.labelName = labelName;
}

- (IBAction)clickTitleButton:(id)sender {
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(labelView: didSelectLabelAtIndex:)]) {
        [self.delegate labelView:self didSelectLabelAtIndex:self.index];
    }
    if(sender == nil) {
        // called by label bar or label page
        self.isSelected = YES;
        return;
    }
    if(self.isReturnLabel) {
        if(self.delegate != nil && [self.delegate respondsToSelector:@selector(labelView: didCloseLabelAtIndex:)])
            [self.delegate labelView:self didCloseLabelAtIndex:self.index];
        return;
    }
    else if(self.isRetractable && self.isSelected){ 
        if(self.delegate != nil && [self.delegate respondsToSelector:@selector(labelView: didOpenLabelAtIndex:)])
            [self.delegate labelView:self didOpenLabelAtIndex:self.index];
    }
    self.isSelected = YES;
}

- (void)swipeUp:(UISwipeGestureRecognizer *)ges {
    if(!self.isRemovable)
        return;
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(labelView: didRemoveLabelAtIndex:)])
        [self.delegate labelView:self didRemoveLabelAtIndex:self.index];
}

- (void)changeLabelColor {
    self.bgImageView.image = [UIImage imageNamed:@"label_white.png"];
}

- (void)configureBackgroundImage {
    return; // 删除return开启label background
    if(self.info.bgImage) {
        self.photoImageView.image = self.info.bgImage;
        self.photoImageView.alpha = kCustomHalfAlpha;
    }
    else {
        return;
    }
    [self changeLabelColor];
}

- (void)setInfo:(LabelInfo *)info {
    if(_info != info) {
        [_info release];
        _info = [info retain];
        self.titleLabel.text = _info.labelName;
        self.isSelected = _info.isSelected;
        [self configureBackgroundImage];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UISwipeGestureRecognizer *swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
	swipeUpGesture.direction = UISwipeGestureRecognizerDirectionUp;
	[self.view addGestureRecognizer:swipeUpGesture];
	[swipeUpGesture release];
    
    self.photoImageView.layer.masksToBounds = YES;
    self.photoImageView.layer.cornerRadius = 5.0f;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.titleButton = nil;
    self.titleLabel = nil;
    self.photoImageView = nil;
    self.bgImageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

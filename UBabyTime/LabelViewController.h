//
//  LabelViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol LabelViewControllerDelegate;
@interface LabelInfo : NSObject {
@private
    NSString *_identifier;
    NSString *_labelName;
    BOOL _isRemovable;
    BOOL _isSelected;
    BOOL _isReturnLabel;
    BOOL _isParent;
    
    UIImage *_bgImage;
}

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *labelName;
@property (nonatomic) BOOL isRetractable;
@property (nonatomic) BOOL isRemovable;
@property (nonatomic) BOOL isSelected;
@property (nonatomic) BOOL isReturnLabel;
@property (nonatomic) BOOL isParent;
@property (nonatomic, retain) UIImage *bgImage;



+ (LabelInfo *)labelInfoWithIdentifier:(NSString *)identifier labelName:(NSString *)name isRetractable:(BOOL)retractable isParent:(BOOL)isParent;
@end


@interface LabelViewController : UIViewController
{
    UIButton *_titleButton;
    NSUInteger _index;
    id<LabelViewControllerDelegate> _delegate;
    UILabel *_titleLabel;
    UIImageView *_photoImageView;
    UIImageView *_bgImageView;
    LabelInfo *_info;
    
    CGRect _reservedFrame;
}

@property (nonatomic, retain) IBOutlet UIButton *titleButton;
@property (nonatomic) NSUInteger index;
@property (nonatomic) BOOL isSelected;
@property (nonatomic, readonly) BOOL isRetractable;
@property (nonatomic, readonly) BOOL isRemovable;
@property (nonatomic, readonly) BOOL isReturnLabel;
@property (nonatomic, readonly) BOOL isParentLabel;
@property (nonatomic, readonly) BOOL isChildLabel;
@property (nonatomic, copy) NSString *labelName;
@property (nonatomic, assign) id<LabelViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UIImageView *photoImageView;
@property (nonatomic, retain) IBOutlet UIImageView *bgImageView;
@property (nonatomic, retain) LabelInfo *info;
@property (nonatomic, assign) CGRect reservedFrame;

- (IBAction)clickTitleButton:(id)sender;
@end

@protocol LabelViewControllerDelegate <NSObject>

- (void)labelView:(LabelViewController *)labelView didSelectLabelAtIndex:(NSUInteger)index;
- (void)labelView:(LabelViewController *)labelView didOpenLabelAtIndex:(NSUInteger)index;
- (void)labelView:(LabelViewController *)labelView didCloseLabelAtIndex:(NSUInteger)index;
- (void)labelView:(LabelViewController *)labelView didRemoveLabelAtIndex:(NSUInteger)index;

@end

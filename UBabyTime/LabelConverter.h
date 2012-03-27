//
//  LabelConverter.h
//  SocialFusion
//
//  Created by 王紫川 on 12-1-22.
//  Copyright (c) 2012年 Tongji Apple Club. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kTodayTips          @"kTodayTips"

#define kCheckList         @"kCheckList"
#define kTodayTipsArticle    @"kCheckArticleList"
#define kTodayTipsProposal @"kCheckProposalList"

#define kQuestionAndAnswer       @"kQuestionAndAnswer"

#define kSearchInfo        @"kSearchInfo"

#define kSystemDefaultLabels    @"kSystemDefaultLabels"
#define kLabelName              @"kLabelName"
#define kLabelIsRetractable     @"kLabelIsRetractable"
#define kChildLabels            @"kChildLabels"
#define kLabelIsParent          @"kLabelIsParent"

#define kParentWeiboUser        @"kParentWeiboUser"
#define kParentRenrenUser       @"kParentRenrenUser"


@class LabelInfo;

@interface LabelConverter : NSObject {
    NSDictionary *_configMap;
}

@property (nonatomic, readonly) NSDictionary *configMap;

+ (LabelConverter *)getInstance;
+ (LabelInfo *)getLabelInfoWithIdentifier:(NSString *)identifier;
+ (NSArray *)getSystemDefaultLabelsInfo;
+ (NSArray *)getSystemDefaultLabelsIdentifier;
+ (NSArray *)getChildLabelsInfoWithParentLabelIndentifier:(NSString *)identifier andParentLabelName:(NSString *)name;
+ (NSString *)getDefaultChildIdentifierWithParentIdentifier:(NSString *)parentIdentifier;
+ (NSUInteger)getSystemDefaultLabelCount;
+ (NSUInteger)getSystemDefaultLabelIndexWithIdentifier:(NSString *)identifier;

@end

//
//  ArticleView.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleView : UIScrollView
@property (nonatomic,retain)IBOutlet UITextView *textView;
@property (nonatomic,retain)IBOutlet UIImageView *imageView;
@property (nonatomic,retain)IBOutlet UILabel *titleLabel;
@end

//
//  ViewController.h
//  CoreTextStudy
//
//  Created by Line_Hu on 14-8-5.
//  Copyright (c) 2014年 Alpha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyledPageControl.h"
@interface ViewController : UIViewController<UITextViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (weak, nonatomic) UIImageView *katanaView;
@property (weak, nonatomic) UITextView *textView;
@property (weak, nonatomic) UITextView *historyTextView;
@property (weak, nonatomic) UITextView *personalityTextView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

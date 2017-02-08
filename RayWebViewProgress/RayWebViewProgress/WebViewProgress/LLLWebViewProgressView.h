//
//  LLLWebViewProgressView.h
//  RayWebViewProgress
//
//  Created by 罗雷雷 on 2017/1/16.
//  Copyright © 2017年 4D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLLWebViewProgressView : UIView

@property (nonatomic, assign) float progress;

@property (nonatomic, strong) UIView *progressBarView;
@property (nonatomic) NSTimeInterval barAnimationDuration; // default 0.1
@property (nonatomic) NSTimeInterval fadeAnimationDuration; // default 0.27
@property (nonatomic) NSTimeInterval fadeOutDelay; // default 0.1

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end

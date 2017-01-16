//
//  LLLWebViewProgress.h
//  RayWebViewProgress
//
//  Created by 罗雷雷 on 2017/1/12.
//  Copyright © 2017年 4D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#undef ray_weak
#if __has_feature(objc_arc_weak)
#define ray_weak weak
#else
#define rey_weak unsafe_unretained
#endif

extern const float LLLInitialProgressValue;     //初值
extern const float LLLInteractiveProgressValue; //正在加载时候的值
extern const float LLLFinalProgressValue;       //最终的值

typedef void (^LLLWebViewProgressBlock)(float progress);

@protocol  LLLWebViewProgressDelegate;

@interface LLLWebViewProgress : NSObject<UIWebViewDelegate>
@property (nonatomic, ray_weak) id<LLLWebViewProgressDelegate>progressDelegate;
@property (nonatomic, ray_weak) id<UIWebViewDelegate>webViewProxyDelegate;
@property (nonatomic, copy) LLLWebViewProgressBlock progressBlock;
@property (nonatomic, readonly)float progress;

- (void)reset;

@end

@protocol LLLWebViewProgressDelegate <NSObject>

- (void)webViewProgress:(LLLWebViewProgress *)webViewProgress updateProgress:(float)progress;

@end



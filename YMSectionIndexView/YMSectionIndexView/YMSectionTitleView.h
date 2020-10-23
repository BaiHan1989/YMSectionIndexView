//
//  YMSectionTitleView.h
//  YMSectionIndexView
//
//  Created by 白晗 on 2020/10/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 展示左侧sectionTitle的视图
@interface YMSectionTitleView : UIView
@property (nonatomic, copy) NSString *sectionTitle; //!< section文字
@property (nonatomic, copy) NSString *bgImageName; //!< 背景图片名称
@end

NS_ASSUME_NONNULL_END

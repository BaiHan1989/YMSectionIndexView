//
//  YMSectionIndexView.h
//  YMSectionIndexView
//
//  Created by 白晗 on 2020/9/28.
//

#import <UIKit/UIKit.h>

@class YMSectionIndexView;

NS_ASSUME_NONNULL_BEGIN

@protocol YMSectionIndexViewDelegate <NSObject>

@optional
- (void)sectionIndexView:(YMSectionIndexView *)sectionIndexView sectionTitle:(NSString *)title atIndex:(NSInteger)index;

@end

@interface YMSectionIndexView : UIView

- (instancetype)initWithTitles:(NSArray <NSString *>*)titles;
@property (nonatomic, weak) id <YMSectionIndexViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

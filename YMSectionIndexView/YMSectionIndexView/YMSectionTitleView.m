//
//  YMSectionTitleView.m
//  YMSectionIndexView
//
//  Created by 白晗 on 2020/10/23.
//

#import "YMSectionTitleView.h"

@interface YMSectionTitleView ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation YMSectionTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}


- (void)setupSubViews {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = self.bounds;
}

#pragma mark - setter
- (void)setSectionTitle:(NSString *)sectionTitle {
    _sectionTitle = sectionTitle;
    
    self.titleLabel.text = sectionTitle;
}

@end

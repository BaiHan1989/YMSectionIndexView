//
//  YMSectionTitleView.m
//  YMSectionIndexView
//
//  Created by 白晗 on 2020/10/23.
//

#import "YMSectionTitleView.h"

@interface YMSectionTitleView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation YMSectionTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}


- (void)setupSubViews {
    
    self.bgImageView = [[UIImageView alloc] init];
    self.bgImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.bgImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
    [self addSubview:self.titleLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = self.bounds;
    self.bgImageView.frame = self.bounds;
}

#pragma mark - setter
- (void)setSectionTitle:(NSString *)sectionTitle {
    _sectionTitle = sectionTitle;
    
    self.titleLabel.text = sectionTitle;
}

- (void)setBgImageName:(NSString *)bgImageName {
    _bgImageName = bgImageName;
    self.bgImageView.image = [UIImage imageNamed:bgImageName];
}

@end

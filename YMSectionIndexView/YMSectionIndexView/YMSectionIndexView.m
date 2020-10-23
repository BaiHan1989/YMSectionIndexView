//
//  YMSectionIndexView.m
//  YMSectionIndexView
//
//  Created by 白晗 on 2020/9/28.
//

#import "YMSectionIndexView.h"

@interface YMSectionIndexView ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger lastIndex; //!< 上次选中的Index
@property (nonatomic, strong) UIView *indexView;

@end

@implementation YMSectionIndexView

- (instancetype)initWithTitles:(NSArray<NSString *> *)titles {
    if (self = [super init]) {
        _titles = titles;

        [self addGesture];

        [self setupSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat titleHeight = self.bounds.size.height / _titles.count;
    for (NSInteger i = 0; i < _titles.count; i++) {
        UILabel *titleLabel = self.subviews[i];
        titleLabel.frame = CGRectMake(0, i * titleHeight, self.bounds.size.width, titleHeight);
    }
    
    self.indexView.frame = CGRectMake(-self.bounds.size.width - 50, 0, 50, 50);
}

#pragma mark - Actions

- (void)panGesuter:(UIGestureRecognizer *)panGesture {
    CGPoint point = [panGesture locationInView:panGesture.view];

    // 将点的位置转换为相对于屏幕
    CGPoint newPoint = [self convertPoint:point toView:self.superview];

    // 判断点是否在sectionIndexView内部
    if (CGRectContainsPoint(self.frame, newPoint)) {
        [self setupIndexAndSelectTextWithPoint:point];
    }
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        [self hideIndexView];
    }
}

- (void)tapGesture:(UIGestureRecognizer *)tapGesture {
    // 获取点击的位置
    CGPoint point = [tapGesture locationInView:tapGesture.view];
    [self setupIndexAndSelectTextWithPoint:point];
    
    if (tapGesture.state == UIGestureRecognizerStateEnded) {
        [self hideIndexView];
    }
}

#pragma mark - Private
/// 设置子视图
- (void)setupSubviews {
    for (NSInteger i = 0; i < _titles.count; i++) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = _titles[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:titleLabel];
    }

    // 设置默认选中label
    UILabel *titleLabel = self.subviews[self.lastIndex];
    titleLabel.backgroundColor = [UIColor yellowColor];
    
    // 左侧显示section的视图
    self.indexView = [[UIView alloc] init];
    self.indexView.backgroundColor = [UIColor orangeColor];
    self.indexView.hidden = YES;
    [self addSubview:self.indexView];
}

/// 添加手势
- (void)addGesture {
    // 添加手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesuter:)];
    [self addGestureRecognizer:panGesture];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self addGestureRecognizer:tapGesture];
}

/// 添加震动反馈
- (void)addFeedbackGenerator {
    UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [feedBackGenertor impactOccurred];
}

/// 获取索引
- (NSInteger)getSectionIndexWithTapPoint:(CGPoint)point {
    return floor(point.y / self.bounds.size.height * _titles.count);
}


/// 设置索引和选中文本
/// @param point 滑动/点击的位置
- (void)setupIndexAndSelectTextWithPoint:(CGPoint)point {
    NSInteger index = [self getSectionIndexWithTapPoint:point];
    NSString *title = _titles[index];
    // 获取到选中的label
    UILabel *currentTitleLabel = self.subviews[index];
    currentTitleLabel.backgroundColor = [UIColor yellowColor];

    if (self.lastIndex != index) {
        [self addFeedbackGenerator];
        UILabel *lastTitleLable = self.subviews[self.lastIndex];
        lastTitleLable.backgroundColor = [UIColor clearColor];
        self.lastIndex = index;
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(sectionIndexView:sectionTitle:atIndex:)]) {
        [self.delegate sectionIndexView:self sectionTitle:title atIndex:index];
    }
    
    // 修改indexView 的y
    [self showIndexViewWithPoint:point];
}

- (void)showIndexViewWithPoint:(CGPoint)point {
    CGPoint center = self.indexView.center;
    center.y = point.y;
    self.indexView.center = center;
    self.indexView.hidden = NO;
}

- (void)hideIndexView {
    self.indexView.hidden = YES;
}
@end

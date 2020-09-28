//
//  YMSectionIndexView.m
//  YMSectionIndexView
//
//  Created by 白晗 on 2020/9/28.
//

#import "YMSectionIndexView.h"

@interface YMSectionIndexView ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger lastIndex;

@end

@implementation YMSectionIndexView

- (instancetype)initWithTitles:(NSArray<NSString *> *)titles {
    if (self = [super init]) {
        _titles = titles;
        
        // 添加手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesuter:)];
        [self addGestureRecognizer:panGesture];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [self addGestureRecognizer:tapGesture];
        
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    for (NSInteger i = 0; i < _titles.count; i++) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0];
        titleLabel.text = _titles[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:titleLabel];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat titleHeight = self.bounds.size.height / _titles.count;
    for (NSInteger i = 0; i < _titles.count; i++) {
        UILabel *titleLabel = self.subviews[i];
        titleLabel.frame = CGRectMake(0, i * titleHeight, self.bounds.size.width, titleHeight);
    }
}

- (void)panGesuter:(UIGestureRecognizer *)panGesture {
    
    CGPoint point = [panGesture locationInView:panGesture.view];
    
    // 将点的位置转换为相对于屏幕
    CGPoint newPoint = [self convertPoint:point toView:self.superview];
    
    // 判断点是否在sectionIndexView内部
    if (CGRectContainsPoint(self.frame, newPoint)) {
        NSInteger index = [self getSectionIndexWithTapPoint:point];
        NSString *title = _titles[index];
        if (self.delegate && [self.delegate respondsToSelector:@selector(sectionIndexView:sectionTitle:atIndex:)]) {
            [self.delegate sectionIndexView:self sectionTitle:title atIndex:index];
        }
        // 如果上次选中的index和这次不同，添加震动反馈
        if (self.lastIndex != index) {
            [self addFeedbackGenerator];
            self.lastIndex = index;
        }
        
    }
}

- (void)tapGesture:(UIGestureRecognizer *)tapGesture {
    CGPoint point = [tapGesture locationInView:tapGesture.view];
    
    NSInteger index = [self getSectionIndexWithTapPoint:point];
    NSString *title = _titles[index];
    if (self.delegate && [self.delegate respondsToSelector:@selector(sectionIndexView:sectionTitle:atIndex:)]) {
        [self.delegate sectionIndexView:self sectionTitle:title atIndex:index];
    }
    
}

- (NSInteger)getSectionIndexWithTapPoint:(CGPoint)point {
    return floor(point.y / self.bounds.size.height * _titles.count);;
}

- (void)addFeedbackGenerator {
    UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [feedBackGenertor impactOccurred];
}

@end

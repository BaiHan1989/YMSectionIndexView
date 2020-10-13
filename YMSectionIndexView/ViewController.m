//
//  ViewController.m
//  YMSectionIndexView
//
//  Created by 白晗 on 2020/9/28.
//

#import "ViewController.h"
#import "YMSectionIndexView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, YMSectionIndexViewDelegate>
@property (nonatomic, strong) NSArray *brands;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.brands = @[
            @{
                @"letter": @"A",
                @"brands": @[
                    @"奥迪",
                    @"阿斯顿·马丁",
                    @"阿尔法·罗密欧",
                    @"ATS",
                    @"艾康尼克"
                ],
            },
            @{
                @"letter": @"B",
                @"brands": @[
                    @"奔驰",
                    @"宝马",
                    @"北汽",
                    @"布加迪",
                    @"巴博斯",
                    @"BAC"
                ],
            },
            @{
                @"letter": @"C",
                @"brands": @[
                    @"长安",
                    @"长城",
                    @"长江"
                ],
            },
            @{
                @"letter": @"D",
                @"brands": @[
                    @"大众",
                    @"DS",
                    @"东风风光",
                    @"大发"
                ],
            },
            @{
                @"letter": @"E",
                @"brands": @[
                    @"Elemental",
                    @"Elektron"
                ],
            },
            @{
                @"letter": @"F",
                @"brands": @[
                    @"丰田",
                    @"福特",
                    @"法拉利",
                    @"飞碟汽车"
                ],
            },
            @{
                @"letter": @"G",
                @"brands": @[
                    @"广汽传祺",
                    @"广汽蔚来",
                    @"谷歌"
                ],
            },
            @{
                @"letter": @"H",
                @"brands": @[
                    @"哈佛",
                    @"红旗",
                    @"海马"
                ],
            },
            @{
                @"letter": @"I",
                @"brands": @[
                    @"IED",
                    @"IZERA"
                ],
            },
            @{
                @"letter": @"J",
                @"brands": @[
                    @"吉利汽车",
                    @"几何汽车",
                    @"捷豹",
                    @"金杯",
                    @"江铃"
                ],
            },
            @{
                @"letter": @"K",
                @"brands": @[
                    @"凯迪拉克",
                    @"克莱斯勒",
                    @"卡威",
                    @"科尼塞克"
                ],
            },
            @{
                @"letter": @"L",
                @"brands": @[
                    @"雷克萨斯",
                    @"路虎",
                    @"领克",
                    @"林肯",
                    @"雷诺",
                    @"劳斯莱斯",
                    @"兰博基尼",
                    @"理想汽车"
                ],
            },
            @{
                @"letter": @"M",
                @"brands": @[
                    @"马自达",
                    @"名爵",
                    @"玛莎拉蒂",
                    @"迈凯伦",
                    @"MINI"
                ],
            },
            @{
                @"letter": @"N",
                @"brands": @[
                    @"纳智捷",
                    @"哪吒汽车"
                ],
            },
            @{
                @"letter": @"O",
                @"brands": @[
                    @"讴歌",
                    @"欧拉"
                ],
            },
            @{
                @"letter": @"P",
                @"brands": @[
                    @"帕加尼",
                    @"佩奇奥"
                ],
            },
            @{
                @"letter": @"Q",
                @"brands": @[
                    @"起亚",
                    @"奇瑞",
                    @"启辰"
                ],
            },
            @{
                @"letter": @"R",
                @"brands": @[
                    @"日产",
                    @"荣威"
                ],
            },
            @{
                @"letter": @"S",
                @"brands": @[
                    @"斯柯达",
                    @"三菱",
                    @"斯巴鲁"
                ],
            },
            @{
                @"letter": @"T",
                @"brands": @[
                    @"特斯拉",
                    @"腾势",
                    @"天美汽车"
                ],
            },
            @{
                @"letter": @"U",
                @"brands": @[
                    @"Ultima",
                    @"Uniti"
                ],
            },
            @{
                @"letter": @"V",
                @"brands": @[
                    @"Venturi",
                    @"Vinfast"
                ],
            },
            @{
                @"letter": @"W",
                @"brands": @[
                    @"沃尔沃",
                    @"五菱汽车",
                    @"蔚来",
                    @"WEY",
                    @"威马汽车"
                ],
            },
            @{
                @"letter": @"X",
                @"brands": @[
                    @"雪佛兰",
                    @"现代",
                    @"雪铁龙"
                ],
            },
            @{
                @"letter": @"Y",
                @"brands": @[
                    @"英菲尼迪",
                    @"一汽",
                    @"野马汽车"
                ],
            },
            @{
                @"letter": @"Z",
                @"brands": @[
                    @"众泰",
                    @"中华"
                ],
            }
        ];
        
        
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in self.brands) {
            NSString *letter = dict[@"letter"];
            [temp addObject:letter];
        }
        self.titles = temp.copy;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    YMSectionIndexView *sectionIndexView = [[YMSectionIndexView alloc] initWithTitles:self.titles];
    sectionIndexView.delegate = self;
    sectionIndexView.backgroundColor = [UIColor redColor];
    sectionIndexView.frame = CGRectMake(self.view.bounds.size.width - 20, (self.view.bounds.size.height - 500) / 2, 20, 500);
    [self.view addSubview:sectionIndexView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    view.layer.cornerRadius = 25;
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.brands.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *brands = self.brands[section][@"brands"];
    return brands.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *brandDict = self.brands[indexPath.section];
    NSArray *brandNames = brandDict[@"brands"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = brandNames[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    NSDictionary *brandDict = self.brands[section];
    UIView *letterView = [[UIView alloc] init];
    letterView.backgroundColor = [UIColor lightGrayColor];
    UILabel *letterLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 7.5, self.view.bounds.size.width - 2 * 12, 10)];
    letterLabel.font = [UIFont systemFontOfSize:12];
    letterLabel.text = brandDict[@"letter"];
    [letterView addSubview:letterLabel];
    return letterView;
}

#pragma mark - YMSectionIndexViewDelegate
- (void)sectionIndexView:(YMSectionIndexView *)sectionIndexView sectionTitle:(NSString *)title atIndex:(NSInteger)index {
    
//    NSLog(@"title - %@ - index - %zd", title, index);
    
    // 滚动tableView
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}
@end

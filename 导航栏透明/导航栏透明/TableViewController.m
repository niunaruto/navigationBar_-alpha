//
//  TableViewController.m
//  导航栏透明
//
//  Created by anlaiye on 16/6/2.
//  Copyright © 2016年 wangmingmin. All rights reserved.
//

#import "TableViewController.h"
#import "UIImage+Tool.h"
@interface TableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *mytableView;
@property (nonatomic, strong) UIImageView      *navBackImage;
@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.mytableView setContentInset:UIEdgeInsetsMake(-64, 0, 0, 0)];
    /**
     *  1.我们设置的是BackgroundImage,说明也许在我们的navigationBar上有一个ImageView的子视图,而我们的看到的导航栏实际上看到的就是这个图片,因此设置它为无图片我们就可以看到透明,而设置backgroundColor却不行
     */
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    /**
     *
     
     2.我们还设置了shadowImage为无图,它其实就是导航栏下面的那根细线,如果你不写第二句话你则会看到一根线
     */
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    
    self.navBackImage = self.navigationController.navigationBar.subviews.firstObject;
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellMy" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat minAlphaOffset = - 64;
    CGFloat maxAlphaOffset = 200;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    self.navBackImage.alpha = alpha;
    
}


@end

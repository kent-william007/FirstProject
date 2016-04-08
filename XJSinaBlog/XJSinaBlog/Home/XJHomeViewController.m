//
//  XJHomeViewController.m
//  XJSinaBlog
//
//  Created by Kent on 15/12/25.
//  Copyright © 2015年 kent. All rights reserved.
//

#import "XJHomeViewController.h"
#import "NextViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "XJTitleButton.h"
#import "XJDropdownMenu.h"
@interface XJHomeViewController ()<XJDropdownMenuDelegate>

@end

@implementation XJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNav];
    
    UIButton *bun = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    bun.backgroundColor = [UIColor redColor];
    [bun addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bun];
}
- (void)click
{
    [self.navigationController pushViewController:[[NextViewController alloc]init] animated:YES];
}
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    XJTitleButton *titleButton = [[XJTitleButton alloc]init];
    [titleButton setTitle:@"首你好页" forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(dropdownClick:) forControlEvents:UIControlEventTouchUpInside];
    titleButton.selected = YES;
    self.navigationItem.titleView = titleButton;
}
- (void)friendSearch
{
    
}
- (void)pop
{
}

- (void)dropdownClick:(UIButton *)sender
{
    XJDropdownMenu *menu = [XJDropdownMenu menu];
    menu.delegate = self;
    NextViewController *next = [[NextViewController alloc]init];
    next.view.height = 44*3;
    next.view.width = 150;
    menu.containerController = next;
    [menu showFrom:sender];
}
- (void)dropdownMenuDismiss:(XJDropdownMenu *)dropdownMenu
{
    UIButton *bun = (UIButton *)self.navigationItem.titleView;
    bun.selected = YES;
}
- (void)dropdownMenuShow:(XJDropdownMenu *)dropdownMenu
{
    UIButton *bun = (UIButton *)self.navigationItem.titleView;
    bun.selected = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

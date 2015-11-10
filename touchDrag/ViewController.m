//
//  ViewController.m
//  touchDrag
//
//  Created by Mac on 15/11/7.
//  Copyright (c) 2015年 Moobye. All rights reserved.
//

#import "ViewController.h"
#import "TouchDragView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TouchDragView *view = [[TouchDragView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.delegate = self;
    view.frame = self.view.bounds;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  ViewController.m
//  HotelzManager
//
//  Created by Brandon Roberts on 5/4/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  
  UIView *purpleView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
  purpleView.backgroundColor = [UIColor purpleColor];
  [purpleView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [rootView addSubview:purpleView];
  
  UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
  greenView.backgroundColor = [UIColor greenColor];
  greenView.translatesAutoresizingMaskIntoConstraints = NO;
  [rootView addSubview:greenView];
  
  
  
  NSDictionary *views = @{@"purpleView" : purpleView,
                          @"greenView" : greenView};
  
  [self addConstraintsToRootView:rootView withViews:views];
  
  self.view = rootView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)addConstraintsToRootView:(UIView *)rootView withViews:(NSDictionary *)views {
  NSArray *purpleViewHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[purpleView(40)]" options:0 metrics:nil views:views];
  
    NSArray *greenViewHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[greenView(40)]" options:0 metrics:nil views:views];
  
  UIView *purpleView = views[@"purpleView"];
  [purpleView addConstraints:purpleViewHeight];
  
  UIView *greenView = views[@"greenView"];
  [greenView addConstraints:greenViewHeight];
  
  NSArray *purpleViewHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[greenView]-[purpleView]-|" options:0 metrics:nil views:views];
  [rootView addConstraints:purpleViewHorizontal];
  
  NSArray *purpleViewVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[purpleView]-100-[greenView]" options:0 metrics:nil views:views];
  [rootView addConstraints:purpleViewVertical];
  
  
}

@end

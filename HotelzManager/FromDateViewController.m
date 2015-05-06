//
//  FromDateViewController.m
//  HotelzManager
//
//  Created by Brandon Roberts on 5/5/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "FromDateViewController.h"

@interface FromDateViewController ()

@property (strong, nonatomic) UIDatePicker *datePicker;

@end

@implementation FromDateViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  self.datePicker = [[UIDatePicker alloc] init];
  self.datePicker.translatesAutoresizingMaskIntoConstraints = NO;
  [rootView addSubview:self.datePicker];
  
  NSDate *now = [NSDate date];
  NSDateComponents *newComponents = [NSDateComponents

  NSDictionary *views = @{@"datePicker" : self.datePicker};
  
  [self addConstraintsToRootView:rootView forViews:views];
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addConstraintsToRootView:(UIView *)rootView forViews:(NSDictionary *)views {
  
  NSLayoutConstraint *datePickerCenterX = [NSLayoutConstraint constraintWithItem:self.datePicker attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  
  NSLayoutConstraint *datePickerCenterY = [NSLayoutConstraint constraintWithItem:self.datePicker attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
  
  NSArray *constraints = @[datePickerCenterX, datePickerCenterY];
  
  [rootView addConstraints:constraints];
  
}

@end

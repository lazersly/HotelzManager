//
//  HotelListViewController.m
//  HotelzManager
//
//  Created by Brandon Roberts on 5/6/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "HotelListViewController.h"
#import "Hotel.h"

@interface HotelListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *hotels;

@end

@implementation HotelListViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  self.tableView = [[UITableView alloc] init];
  self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
  [rootView addSubview:self.tableView];
  
  NSDictionary *views = @{@"tableView" : self.tableView};
  [self addConstraintsToRootView:rootView withViews:views];
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  self.hotels = [self fetchHotels];
  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
}

-(void)addConstraintsToRootView:(UIView *)rootView withViews:(NSDictionary *)views {
  
  NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
  
  NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
  
  [rootView addConstraints:horizontalConstraints];
  [rootView addConstraints:verticalConstraints];
  
}

#pragma mark - UITableView Delegate and DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.hotels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  
  if (!cell) {
    cell = [[UITableViewCell alloc] init];
  }
  
  Hotel *hotelAtRow = self.hotels[indexPath.row];
  
  cell.textLabel.text = nil;
  cell.textLabel.text = hotelAtRow.name;
  
  return cell;
}

#pragma mark - Custom Methods

-(NSArray *)fetchHotels {
  return nil;
}



@end

//
//  ViewController.m
//  ParallaxTable
//
//  Created by Frank Bara on 6/9/15.
//  Copyright (c) 2015 BaraLabs. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxTableViewCell.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSArray *tableItems;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableItems = @[[UIImage imageNamed:@"demo_1"],
						[UIImage imageNamed:@"demo_2"],
						[UIImage imageNamed:@"demo_3"],
						[UIImage imageNamed:@"demo_4"],
						[UIImage imageNamed:@"demo_5"],
						[UIImage imageNamed:@"demo_1"],
						[UIImage imageNamed:@"demo_2"],
						[UIImage imageNamed:@"demo_3"],
						[UIImage imageNamed:@"demo_4"],
						[UIImage imageNamed:@"demo_5"],
						[UIImage imageNamed:@"demo_1"],
						[UIImage imageNamed:@"demo_2"],
						[UIImage imageNamed:@"demo_3"],
						[UIImage imageNamed:@"demo_4"],
						[UIImage imageNamed:@"demo_5"]];
	
}

-(void)viewDidAppear:(BOOL)animated {
	
	[super viewDidAppear:animated];
	[self scrollViewDidScroll:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.tableItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"ParallaxCell";
	ParallaxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	cell.parallaxLabel.text = [NSString stringWithFormat:@"File: %li", (long)indexPath.row];
	cell.parallaxImage.image = [self.tableItems objectAtIndex:indexPath.row];
	return cell;
	
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
	
	NSArray *visibleCells = [self.tableView visibleCells];
	for (ParallaxTableViewCell *cell in visibleCells) {
		[cell cellOnTableView:self.tableView didScrollOnView:self.view];
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

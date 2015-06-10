//
//  ParallaxTableViewCell.h
//  ParallaxTable
//
//  Created by Frank Bara on 6/9/15.
//  Copyright (c) 2015 BaraLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *parallaxLabel;
@property (nonatomic, strong) IBOutlet UIImageView *parallaxImage;


- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

@end

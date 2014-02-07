//
//  StatisticsViewController.h
//  Cyvasse
//
//  Created by John West on 2/6/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatisticsView.h"

@interface StatisticsViewController : UIViewController

- (id)initWithFrame:(CGRect)frame
			Picture:(NSString *)picture
			   Name:(NSString *)name
			 Health:(int)health
		  MaxHealth:(int)maxHealth
			 Attack:(int)attack
			Defense:(int)defense
		   Movement:(int)movement;

@property (strong, nonatomic) StatisticsView *StatsV;

@end

//
//  PieceHealthViewController.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PieceHealthView.h"

@interface PieceHealthViewController : UIViewController

- (id)initWithFrame:(CGRect)frame AndColor:(UIColor *)color;
- (void)setHealthBarColor:(UIColor *)color;
- (void)setHealthBarLength:(int)currentHealth :(int)maxHealth;

@property (strong, nonatomic) PieceHealthView *PHView;

@end

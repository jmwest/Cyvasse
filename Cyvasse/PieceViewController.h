//
//  PieceViewController.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "PieceView.h"
#include "PieceHealthViewController.h"

@interface PieceViewController : UIViewController

- (id)initWithImage:(NSString *)imageName Frame:(CGRect)frame AndColor:(UIColor *)color;

@property (strong, nonatomic) PieceView *PView;
@property (strong, nonatomic) PieceHealthViewController *PieceHealthVC;

@end

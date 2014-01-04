//
//  PieceView.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieceView : UIView

- (id)initWithFrame:(CGRect)frame Image:(NSString *)string AndHealthColor:(UIColor *)color;

@property (strong, nonatomic) UIImageView *PieceImage;
@property (strong, nonatomic) UIView *PieceHealthBar;
@property (strong, nonatomic) UIView *PieceHealthBackground;

@end

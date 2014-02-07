//
//  StatisticsView.h
//  Cyvasse
//
//  Created by John West on 2/6/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisticsView : UIView

@property (strong, nonatomic) UIImageView *PictureView;
@property (strong, nonatomic) UITextView *NameView;
@property (strong, nonatomic) UITextView *HealthView;
@property (strong, nonatomic) UITextView *HealthValueView;
@property (strong, nonatomic) UIView *HealthBar;
@property (strong, nonatomic) UIView *HealthBarBackground;
@property (strong, nonatomic) UITextView *AttackView;
@property (strong, nonatomic) UITextView *AttackValueView;
@property (strong, nonatomic) UITextView *DefenseView;
@property (strong, nonatomic) UITextView *DefenseValueView;
@property (strong, nonatomic) UITextView *MovementView;
@property (strong, nonatomic) UITextView *MovementValueView;

@end

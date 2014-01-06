//
//  TileView.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	DefaultT,
	Plains,
	Mountain,
	River
} Terrain;

typedef enum {
	DefaultTO,
	Occupied,
	UnOccupied
} TileOccupied;

@interface TileImageView : UIImageView

@property (assign, nonatomic) Terrain Passability;
@property (assign, nonatomic) TileOccupied Occupied;
@property (strong, nonatomic) UIView *ColorOverlay;

@property (assign, nonatomic) int Column;
@property (assign, nonatomic) int Row;

@end

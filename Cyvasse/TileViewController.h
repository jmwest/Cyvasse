//
//  TileViewController.h
//  Cyvasse
//
//  Created by John West on 1/4/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "TileView.h"

typedef enum {
	DefaultH,
	UnHighlighted,
	Movement,
	Attack
} Highlight;

@interface TileViewController : UIViewController

- (id)initWithColumn:(int)column AndRow:(int)row;
- (id)initWithFrame:(CGRect)rect;

- (void)setTilePassability:(Terrain)terrain;
- (void)setTileOverlay:(Highlight)highlight;
- (void)setTileOccupied:(TileOccupied)tileOccupied;

- (void)setTileColumn:(int)column AndRow:(int)row;
- (int)getTileColumn;
- (int)getTileRow;

- (TileOccupied)checkTileOccupied;

@property (strong, nonatomic) TileView *TileV;

@end

//
//  TileViewController.h
//  Cyvasse
//
//  Created by John West on 1/4/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TileImageView.h"
#import "PieceImportHeader.h"
#import "CoordinateModel.h"

typedef enum {
	DefaultH,
	UnHighlighted,
	Movement,
	Attack
} Highlight;

@protocol TileSelectedDelegate <NSObject>

- (void)TileSelectedToChangeTerrain:(CoordinateModel *)coordinate;
- (void)TileHasBeenSelectedAt:(CoordinateModel *)coordinate;

@end

@interface TileViewController : UIViewController <UIGestureRecognizerDelegate>

- (id)initWithColumn:(int)column AndRow:(int)row;
- (id)initWithFrame:(CGRect)rect;

- (void)tileTapGesture;
- (void)tileTapGestureWhenMoving;
- (void)addTapGestureToTile:(UITapGestureRecognizer *)gesture;
- (void)removeTapGestureFromTile:(UITapGestureRecognizer *)gesture;

- (void)setTilePassability:(Terrain)terrain;
- (void)setTileOverlay:(Highlight)highlight;
- (void)setTileOccupied:(TileOccupied)tileOccupied;

- (void)setTileColumn:(int)column AndRow:(int)row;
- (int)getTileColumn;
- (int)getTileRow;

- (TileOccupied)checkTileOccupied;

@property (strong, nonatomic) TileImageView *TileIV;

@property (strong, nonatomic) UITapGestureRecognizer *TapRecognizer;

@property (weak, nonatomic) id <TileSelectedDelegate> delegate;

@end

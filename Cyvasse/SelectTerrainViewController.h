//
//  SelectTerrainViewController.h
//  Cyvasse
//
//  Created by John West on 1/13/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SelectTerrainView.h"
#import "TileImageView.h"
#import "CoordinateModel.h"

@protocol SelectTerrainDelegate <NSObject>

- (void)ReturnSelectedTerrain:(Terrain)terrain :(CoordinateModel *)coordinate;

@end

@interface SelectTerrainViewController : UIViewController

- (id)initWithCoordinate:(CoordinateModel *)coordinate;

@property (strong, nonatomic) SelectTerrainView *SelectTerrainV;
@property (strong, nonatomic) CoordinateModel *Coordinate;

@property (strong, nonatomic) id <SelectTerrainDelegate> delegate;

@property (strong, nonatomic) UITapGestureRecognizer *MountainRecognizer;
@property (strong, nonatomic) UITapGestureRecognizer *RiverRecognizer;
@property (strong, nonatomic) UITapGestureRecognizer *PlainRecognizer;

@end

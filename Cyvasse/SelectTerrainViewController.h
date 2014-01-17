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

@protocol SelectTerrainDelegate <NSObject>

- (void)ReturnSelectedTerrain:(Terrain *)terrain;

@end

@interface SelectTerrainViewController : UIViewController

@property (strong, nonatomic) SelectTerrainView *SelectTerrainV;

@end

//
//  BoardViewController.h
//  Cyvasse
//
//  Created by John West on 1/4/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BoardView.h"
#import "PieceImportHeader.h"
#import "PieceViewController.h"

@interface BoardViewController : UIViewController <PieceDelegate, TileSelectedDelegate>

@property (strong, nonatomic) NSMutableArray *Tiles;
@property (strong, nonatomic) BoardView *BoardV;

@end

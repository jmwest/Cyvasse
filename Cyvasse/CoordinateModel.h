//
//  CoordinateModel.h
//  Cyvasse
//
//  Created by John West on 1/5/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoordinateModel : NSObject

- (id)initWithColumn:(int)column AndRow:(int)row;

@property (assign, nonatomic) int coordColumn;
@property (assign, nonatomic) int coordRow;

@end

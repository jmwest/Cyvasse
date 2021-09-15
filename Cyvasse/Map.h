//
//  Map.h
//  Cyvasse
//
//  Created by John West on 3/24/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Map : NSObject

- (id)init;

- (int)getValueAtColumn:(int)column AndRow:(int)row;
- (int)setValueAtColumn:(int)column AndRow:(int)row;

@end

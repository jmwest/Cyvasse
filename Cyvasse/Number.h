//
//  Number.h
//  Cyvasse
//
//  Created by John West on 3/24/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	Unchecked,
	InRange,
	OutOfRange
} MapType;

@interface Number : NSObject

@property (assign, nonatomic) MapType num;

@end

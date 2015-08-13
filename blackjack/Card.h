//
//  Card.h
//  blackjack
//
//  Created by Ian Heraty on 8/11/15.
//  Copyright © 2015 Ian Heraty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic) NSString *face;
@property (nonatomic) NSString *suit;
@property (nonatomic) int value;

+ (instancetype) cardWithFaceValueSuit:(NSString *)face value:(int)value suit:(NSString *)suit;

+ (instancetype) card;

@end

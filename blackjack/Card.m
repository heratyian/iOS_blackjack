//
//  Card.m
//  blackjack
//
//  Created by Ian Heraty on 8/11/15.
//  Copyright © 2015 Ian Heraty. All rights reserved.
//

#import "Card.h"

@implementation Card

+ (instancetype) cardWithFaceValueSuit:(NSString *)face value:(int)value suit:(NSString *)suit {
    Card *card = [[[self class] alloc] init];
    
    card.value = value;
    card.face = face;
    card.suit = suit;
    
    return card;
}

+ (instancetype) card {
    return [[[self class] alloc] init];
}

@end

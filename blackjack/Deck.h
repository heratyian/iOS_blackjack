//
//  Deck.h
//  blackjack
//
//  Created by Ian Heraty on 8/11/15.
//  Copyright © 2015 Ian Heraty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic) NSMutableArray *cards;
@property (nonatomic) int next_card;

+ (instancetype) createDeck;

- (Card *) nextCard;

@end

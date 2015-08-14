//
//  Hand.h
//  blackjack
//
//  Created by Ian Heraty on 8/13/15.
//  Copyright © 2015 Ian Heraty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Hand : NSObject

@property (nonatomic) NSMutableArray *cards;

+ (instancetype) createHand;

- (void) addCard:(Card *) card;
- (NSString *) handAsString;
- (NSString *) handValueAsString;
- (int) handValueAsInt;

@end

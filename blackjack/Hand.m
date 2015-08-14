//
//  Hand.m
//  blackjack
//
//  Created by Ian Heraty on 8/13/15.
//  Copyright © 2015 Ian Heraty. All rights reserved.
//

#import "Hand.h"

@implementation Hand

+ (instancetype) createHand {
    Hand *hand = [[[self class] alloc] init];
    hand.cards = [[NSMutableArray alloc] initWithCapacity:10];
    return hand;
}

- (void) addCard:(Card *) card {
    [self.cards addObject:card];
}

- (NSString *) handAsString {
    NSMutableString *faces = [NSMutableString stringWithCapacity:10];
    for (int i=0; i<[self.cards count]; i++) {
        Card *card = self.cards[i];
        NSString *next_card = [NSString stringWithFormat:@"%@ ",card.face];
        [faces appendString:next_card];
    }
    NSString *string = [NSString stringWithFormat:@"%@",faces];
    return string;
}

- (NSString *) handValueAsString {
    NSString *value = [NSString stringWithFormat:@"%d",[self handValueAsInt]];
    return value;
}

- (int) handValueAsInt {
    int value = 0;
    
    for (int i=0; i < [self.cards count]; i++) {
        Card *card = self.cards[i];
        value += card.value;
    }
    
    return value;
}

@end

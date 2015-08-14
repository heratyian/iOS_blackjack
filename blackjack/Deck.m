//
//  Deck.m
//  blackjack
//
//  Created by Ian Heraty on 8/11/15.
//  Copyright © 2015 Ian Heraty. All rights reserved.
//

#import "Deck.h"

@implementation Deck

+ (instancetype) createDeck {
    Deck *deck = [[[super class] alloc] init];
    
    [deck standardizeDeck];
    
    [deck shuffleDeck];
    
    return deck;
}

- (void) standardizeDeck {
    self.cards = [[NSMutableArray alloc] initWithCapacity:53];
    self.next_card = 0;
    
    NSArray *CARD_SUITS = @[@"Clubs",
                            @"Diamonds",
                            @"Hearts",
                            @"Spades"];
    
    NSArray *CARD_FACES = @[@"A",@"2",@"3",@"4",
                            @"5",@"6",@"7",@"8",
                            @"9",@"10",@"J",@"Q",
                            @"K"];
    
    
    for (int i=0; i < [CARD_SUITS count]; i++) {
        for (int j=0; j < [CARD_FACES count]; j++) {
            NSString *face = CARD_FACES[j];
            NSString *suit = CARD_SUITS[i];
            
            int value;
            
            if (j >= 10) {
                value = 10;
            } else {
                value = j + 1;
            }
            
            Card *card = [Card cardWithFaceValueSuit:face value:value suit:suit];
            
            [self.cards addObject:card];
        }
    }
}

- (void) shuffleDeck {
    u_int32_t count = (u_int32_t)[self.cards count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger exchangeIndex = arc4random_uniform(count);
        if (i != exchangeIndex) {
            [self.cards exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
        }
    }
}

- (Card *) nextCard {
    Card *card = self.cards[self.next_card];
    self.next_card += 1;
    
    return card;
}

@end

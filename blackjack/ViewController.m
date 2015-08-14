//
//  ViewController.m
//  blackjack
//
//  Created by Ian Heraty on 8/11/15.
//  Copyright © 2015 Ian Heraty. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "Card.h"
#import "Hand.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *hitMeButton;
@property (weak, nonatomic) IBOutlet UIButton *stayButton;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealerLabel;
@property (nonatomic) Hand *dealerHand;
@property (nonatomic) Hand *playerHand;
@property (nonatomic) Deck *deck;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    for (int i=0; i < [self.deck.cards count]; i++) {
//        Card *card = self.deck.cards[i];
//        NSLog(@"%@ %d %@", card.suit, card.value, card.face);
//    }
    [self resetVariables];
    
    [self.hitMeButton addTarget:self action:@selector(hitMePressed: ) forControlEvents:UIControlEventTouchUpInside];
    [self.stayButton addTarget:self action:@selector(stayPressed: ) forControlEvents:UIControlEventTouchUpInside];
    [self.restartButton addTarget:self action:@selector(restartPressed: ) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)hitMePressed:(UIButton *)button {
    [self.playerHand addCard:self.deck.nextCard];
    [self updateLabels];
}

- (void)stayPressed:(UIButton *)button {
    while ([self.dealerHand handValueAsInt] < 17) {
        [self.dealerHand addCard:self.deck.nextCard];
        [self updateLabels];
    }
}

- (void)restartPressed:(UIButton *)button {
    [self resetVariables];
}

- (void)resetVariables {
    self.deck = [Deck createDeck];
    self.dealerHand = [Hand createHand];
    self.playerHand = [Hand createHand];

    [self updateLabels];
}

- (void) updateLabels {
    self.playerLabel.text = [NSString stringWithFormat:@"%@", self.playerHand.handValueAsString];
    self.dealerLabel.text = [NSString stringWithFormat:@"%@", self.dealerHand.handValueAsString];
}


@end

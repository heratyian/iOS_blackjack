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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *hitMeButton;
@property (weak, nonatomic) IBOutlet UIButton *stayButton;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealerLabel;
@property (nonatomic) NSMutableArray *dealerHand;
@property (nonatomic) NSMutableArray *playerHand;
@property (nonatomic) Deck *deck;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.deck = [Deck createDeck];
    
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
    self.playerHand addObject:[deck.nextCard];
    self.playerLabel.text = [NSString stringWithFormat:@"%d", self.playerHand];
}

- (void)stayPressed:(UIButton *)button {
    
}

- (void)restartPressed:(UIButton *)button {
    [self resetVariables];
}

- (void)resetVariables {
    self.dealerHand = [[NSMutableArray alloc] init];
    self.playerHand = [[NSMutableArray alloc] init];
    
    self.playerLabel.text = [NSString stringWithFormat:@"%d", self.playerHand];
    self.dealerLabel.text = [NSString stringWithFormat:@"%d", self.dealerHand];
}


@end

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
    
    // check for bust
    if ([self.playerHand handValueAsInt] > 21) {
        [self sendAlertWithMessage:@"You Bust!"];
    }
}

- (void)stayPressed:(UIButton *)button {

    while ([self.dealerHand handValueAsInt] < 17) {
        [self.dealerHand addCard:self.deck.nextCard];
        [self updateLabels];
    }
    
    // check for bust
    if ([self.dealerHand handValueAsInt] > 21) {
        [self sendAlertWithMessage:@"Dealer Bust!"];
    }
    
    [self checkOutcome];
}

- (void)restartPressed:(UIButton *)button {
    [self resetVariables];
}

- (void)resetVariables {
    self.deck = [Deck createDeck];
    self.dealerHand = [Hand createHand];
    self.playerHand = [Hand createHand];
    
    [self dealHand:self.playerHand];
    [self dealHand:self.dealerHand];

    [self updateLabels];
}

- (void) dealHand:(Hand *) hand {
    [hand addCard:self.deck.nextCard];
    [hand addCard:self.deck.nextCard];
}

- (void) updateLabels {
    self.playerLabel.text = [NSString stringWithFormat:@"%@", self.playerHand.handAsString];
    self.dealerLabel.text = [NSString stringWithFormat:@"%@", self.dealerHand.handAsString];
}

- (void) checkOutcome {
    
    if ([self.playerHand handValueAsInt] < [self.dealerHand handValueAsInt]) {
        // you lose!
        [self sendAlertWithMessage:@"You Lose!"];
        
    } else if ([self.playerHand handValueAsInt] > [self.dealerHand handValueAsInt]) {
        // you win!
        [self sendAlertWithMessage:@"You Win!"];
    } else {
        // tie
        [self sendAlertWithMessage:@"Tie"];
    }
}

- (void) sendAlertWithMessage:(NSString *) message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaulAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * __nonnull action) {}];
    [alert addAction:defaulAction];
    [self presentViewController:alert animated:YES completion:nil];
}



@end

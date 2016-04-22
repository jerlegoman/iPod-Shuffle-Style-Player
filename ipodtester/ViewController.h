//
//  ViewController.h
//  ipodtester
//
//  Created by Bennett Perkins on 30/10/2013.
//  Copyright (c) 2013 Bennett Perkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) UILabel IBOutlet *currentTrackLabel;
@property (strong, nonatomic) UILabel IBOutlet *currentPlaybackStateLabel;
@property (strong, nonatomic) UILabel IBOutlet *playCountLabel;
@property (strong, nonatomic) UILabel IBOutlet *skipCountLabel;



-(IBAction)playPause:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)prev:(id)sender;



-(void)updateNowPlaying;

@end

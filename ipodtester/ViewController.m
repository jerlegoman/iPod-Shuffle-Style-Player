//
//  ViewController.m
//  ipodtester
//
//  Created by Bennett Perkins on 30/10/2013.
//  Copyright (c) 2013 Bennett Perkins. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@end

@implementation ViewController
{
//this is where i will put the change color settings
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateNowPlaying];
}

-(void)updateNowPlaying
{
    MPMusicPlayerController *player = [(AppDelegate *)[[UIApplication sharedApplication] delegate] myPlayer];
    MPMusicPlaybackState playbackStateI = [player playbackState];
    NSString *playbackState;
    switch (playbackStateI) {
        case MPMusicPlaybackStateStopped:
            playbackState = @"stopped";
            break;
        case MPMusicPlaybackStatePlaying:
            playbackState = @"playing";
            break;
        case MPMusicPlaybackStatePaused:
            playbackState = @"paused";
            break;
        case MPMusicPlaybackStateInterrupted:
            playbackState = @"interrupted";
            break;
        case MPMusicPlaybackStateSeekingForward:
            playbackState = @"seeking forward";
            break;
        case MPMusicPlaybackStateSeekingBackward:
            playbackState = @"seeking backward";
            break;
        default:
            playbackState = @"unknown or undefined";
            break;
    }
    MPMediaItem *nowPlaying = [player nowPlayingItem];
    if (nowPlaying) {
        [_currentTrackLabel setText:[NSString stringWithFormat:@"%@ - %@",
                                     [nowPlaying valueForProperty:MPMediaItemPropertyArtist],
                                     [nowPlaying valueForProperty:MPMediaItemPropertyTitle]]];
        [_playCountLabel setText:[NSString stringWithFormat:@"%@",
                                  [nowPlaying valueForProperty:MPMediaItemPropertyPlayCount]]];
        [_skipCountLabel setText:[NSString stringWithFormat:@"%@",
                                  [nowPlaying valueForProperty:MPMediaItemPropertySkipCount]]];
        [_currentPlaybackStateLabel setText:playbackState];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)playPause:(id)sender
{
    MPMusicPlayerController *player = [(AppDelegate *)[[UIApplication sharedApplication] delegate] myPlayer];
    if ([player playbackState] == MPMusicPlaybackStatePlaying) {
        [player pause];
    } else {
        [player play];
    }
}

-(IBAction)next:(id)sender
{
    MPMusicPlayerController *player = [(AppDelegate *)[[UIApplication sharedApplication] delegate] myPlayer];
    [player skipToNextItem];
}

-(IBAction)prev:(id)sender
{
    MPMusicPlayerController *player = [(AppDelegate *)[[UIApplication sharedApplication] delegate] myPlayer];
    [player skipToPreviousItem];
}

@end

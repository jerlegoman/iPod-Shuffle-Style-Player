//
//  AppDelegate.h
//  ipodtester
//
//  Created by Bennett Perkins on 30/10/2013.
//  Copyright (c) 2013 Bennett Perkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MPMusicPlayerController* myPlayer;

@end

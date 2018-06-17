//
//  Pipit-Bridging-Header.h
//  Pipit
//
//  Created by Nick Thompson on 6/12/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PIPViewControllerDelegate;

@interface PIPViewController : NSViewController
    
    @property (nonatomic, copy, nullable) NSString *name;
    @property (nonatomic, weak, nullable) id<PIPViewControllerDelegate> delegate;
    @property (nonatomic, weak, nullable) NSWindow *replacementWindow;
    @property (nonatomic) NSRect replacementRect;
    @property (nonatomic) bool playing;
    @property (nonatomic) NSSize aspectRatio;
    
- (void)presentViewControllerAsPictureInPicture:(NSViewController *)viewController;
    
    @end

@protocol PIPViewControllerDelegate <NSObject>
    
    @optional
- (BOOL)pipShouldClose:(PIPViewController *)pip __OSX_AVAILABLE_STARTING(__MAC_10_12,__IPHONE_NA);
- (void)pipDidClose:(PIPViewController *)pip __OSX_AVAILABLE_STARTING(__MAC_10_12,__IPHONE_NA);
- (void)pipActionPlay:(PIPViewController *)pip __OSX_AVAILABLE_STARTING(__MAC_10_12,__IPHONE_NA);
- (void)pipActionPause:(PIPViewController *)pip __OSX_AVAILABLE_STARTING(__MAC_10_12,__IPHONE_NA);
- (void)pipActionStop:(PIPViewController *)pip __OSX_AVAILABLE_STARTING(__MAC_10_12,__IPHONE_NA);
    @end

NS_ASSUME_NONNULL_END

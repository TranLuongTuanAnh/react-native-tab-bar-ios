/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNCTabBarManager.h"

#import <React/RCTBridge.h>
#import "RNCTabBar.h"
#import <React/RCTUIManager.h>
#import <React/RCTUIManagerObserverCoordinator.h>

@implementation RCTConvert (UITabBar)

RCT_ENUM_CONVERTER(UITabBarItemPositioning, (@{
  @"fill" : @(UITabBarItemPositioningFill),
  @"auto" : @(UITabBarItemPositioningAutomatic),
  @"center" : @(UITabBarItemPositioningCentered)
}), UITabBarItemPositioningAutomatic, integerValue)

@end

@interface RNCTabBarManager () <RCTUIManagerObserver>

@end

@implementation RNCTabBarManager
{
  // The main thread only.
  NSHashTable<RNCTabBar *> *_viewRegistry;
}

- (void)setBridge:(RCTBridge *)bridge
{
  [super setBridge:bridge];

  [self.bridge.uiManager.observerCoordinator addObserver:self];
}

- (void)invalidate
{
  [self.bridge.uiManager.observerCoordinator removeObserver:self];
}

RCT_EXPORT_MODULE()

- (UIView *)view
{
  if (!_viewRegistry) {
    _viewRegistry = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
  }

  RNCTabBar *view = [RNCTabBar new];
  [_viewRegistry addObject:view];
  return view;
}

RCT_EXPORT_VIEW_PROPERTY(unselectedTintColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(tintColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(barTintColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(translucent, BOOL)
#if !TARGET_OS_TV
RCT_EXPORT_VIEW_PROPERTY(barStyle, UIBarStyle)
#endif
RCT_EXPORT_VIEW_PROPERTY(itemPositioning, UITabBarItemPositioning)
RCT_EXPORT_VIEW_PROPERTY(unselectedItemTintColor, UIColor)

#pragma mark - RCTUIManagerObserver

- (void)uiManagerDidPerformMounting:(__unused RCTUIManager *)manager
{
  RCTExecuteOnMainQueue(^{
    for (RNCTabBar *view in self->_viewRegistry) {
      [view uiManagerDidPerformMounting];
    }
  });
}

@end

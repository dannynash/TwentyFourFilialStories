//
//  JNDGestureRecognizer.h
//  FilialStories
//
//  Created by Jerry on 13/3/17.
//  Copyright (c) 2013年 JerryNDanny. All rights reserved.
//

@interface JNDGestureRecognizer : NSObject
+ (BOOL) isSwipeLeft:(NSMutableArray*) tracedTouches;
+ (BOOL) isSwipeRight:(NSMutableArray*) tracedTouches;
+ (BOOL) isSwipeUp:(NSMutableArray*) tracedTouches;
+ (BOOL) isSwipeDown:(NSMutableArray*) tracedTouches;
+ (BOOL) isSwipeLeftUp:(NSMutableArray*) tracedTouches;
+ (BOOL) isSwipeRightUp:(NSMutableArray*) tracedTouches;
+ (BOOL) isSwipeLeftDown:(NSMutableArray*) tracedTouches;
+ (BOOL) isSwipeRightDown:(NSMutableArray*) tracedTouches;
@end

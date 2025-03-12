//
//  InputModeListView.mm
//  MyKeyboard
//
//  Created by Jinwoo Kim on 3/12/25.
//

#import "InputModeListView.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface InputModeListView () {
    CGPoint _startLocation;
}
@end

@implementation InputModeListView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.systemPinkColor;
    }
    
    return self;
}

- (void)dealloc {
    [_textDocumentProxy release];
    [super dealloc];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint location = [touch locationInView:self];
    _startLocation = location;
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_willPerformOutputOperation"));
    
    id _controllerOutput = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_controllerOutput"));
    assert(_controllerOutput != nil);
    
    reinterpret_cast<void (*)(id, SEL, NSInteger, NSTimeInterval, CGPoint, CGPoint)>(objc_msgSend)(_controllerOutput, sel_registerName("setInputModeList:touchBegan:fromLocation:updatePoint:"), 0, touch.timestamp, location, location);
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_didPerformOutputOperation"));
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint location = [touch locationInView:self];
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_willPerformOutputOperation"));
    
    id _controllerOutput = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_controllerOutput"));
    assert(_controllerOutput != nil);
    
    reinterpret_cast<void (*)(id, SEL, NSInteger, NSTimeInterval, CGPoint, CGPoint)>(objc_msgSend)(_controllerOutput, sel_registerName("setInputModeList:touchBegan:fromLocation:updatePoint:"), 1, touch.timestamp, _startLocation, location);
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_didPerformOutputOperation"));
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint location = [touch locationInView:self];
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_willPerformOutputOperation"));
    
    id _controllerOutput = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_controllerOutput"));
    assert(_controllerOutput != nil);
    
    reinterpret_cast<void (*)(id, SEL, NSInteger, NSTimeInterval, CGPoint, CGPoint)>(objc_msgSend)(_controllerOutput, sel_registerName("setInputModeList:touchBegan:fromLocation:updatePoint:"), 3, touch.timestamp, _startLocation, location);
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_didPerformOutputOperation"));
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint location = [touch locationInView:self];
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_willPerformOutputOperation"));
    
    id _controllerOutput = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_controllerOutput"));
    assert(_controllerOutput != nil);
    
    reinterpret_cast<void (*)(id, SEL, NSInteger, NSTimeInterval, CGPoint, CGPoint)>(objc_msgSend)(_controllerOutput, sel_registerName("setInputModeList:touchBegan:fromLocation:updatePoint:"), 4, touch.timestamp, _startLocation, location);
    
    reinterpret_cast<void (*)(id, SEL)>(objc_msgSend)(self.textDocumentProxy, sel_registerName("_didPerformOutputOperation"));
}

@end

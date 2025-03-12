//
//  KeyboardViewController.mm
//  MyKeyboard
//
//  Created by Jinwoo Kim on 3/12/25.
//

#import "KeyboardViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import "InputModeListView.h"

OBJC_EXPORT id objc_msgSendSuper2(void);

@interface KeyboardViewController ()
@property (retain, nonatomic, readonly, getter=_inputModeListView) InputModeListView *inputModeListView;
@end

@implementation KeyboardViewController
@synthesize inputModeListView = _inputModeListView;

- (void)dealloc {
    [_inputModeListView release];
    [super dealloc];
}

- (void)loadView {
    self.view = self.inputModeListView;
}

- (InputModeListView *)_inputModeListView {
    if (auto inputModeListView = _inputModeListView) return inputModeListView;
    
    InputModeListView *inputModeListView = [InputModeListView new];
    inputModeListView.textDocumentProxy = self.textDocumentProxy;
    
    _inputModeListView = inputModeListView;
    return inputModeListView;
}

- (void)_setTextDocumentProxy:(id<UITextDocumentProxy>)textDocumentProxy {
    objc_super superInfo = { self, [self class] };
    reinterpret_cast<void (*)(objc_super *, SEL, id)>(objc_msgSendSuper2)(&superInfo, _cmd, textDocumentProxy);
    
    self.inputModeListView.textDocumentProxy = textDocumentProxy;
}


@end

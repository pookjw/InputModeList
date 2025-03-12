//
//  InputModeListView.h
//  MyKeyboard
//
//  Created by Jinwoo Kim on 3/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputModeListView : UIView
@property (retain, nonatomic) id<UITextDocumentProxy> textDocumentProxy;
@end

NS_ASSUME_NONNULL_END

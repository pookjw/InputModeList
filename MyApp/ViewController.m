//
//  ViewController.m
//  MyApp
//
//  Created by Jinwoo Kim on 3/12/25.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)dealloc {
    [_textView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textView becomeFirstResponder];
}


@end

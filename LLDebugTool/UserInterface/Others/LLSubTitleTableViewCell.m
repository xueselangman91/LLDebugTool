//
//  LLSubTitleTableViewCell.m
//
//  Copyright (c) 2018 LLDebugTool Software Foundation (https://github.com/HDB-Li/LLDebugTool)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "LLSubTitleTableViewCell.h"
#import "LLConfig.h"

@interface LLSubTitleTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextView *contentLabel;

@end

@implementation LLSubTitleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initial];
}

- (void)setContentText:(NSString *)contentText {
    if (![_contentText isEqualToString:contentText]) {
        _contentText = [contentText copy];
        self.contentLabel.scrollEnabled = NO;
        self.contentLabel.text = _contentText;
    }
}

#pragma mark - Primary
- (void)initial {
    self.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.contentLabel.backgroundColor = nil;
    if (LLCONFIG_CUSTOM_COLOR) {
        self.contentLabel.textColor = LLCONFIG_TEXT_COLOR;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.contentLabel.constraints.count == 3) {
        NSLayoutConstraint *systemHeightCons = self.contentLabel.constraints[1];
        NSLayoutConstraint *heightCons = self.contentLabel.constraints[2];
        if (systemHeightCons.constant > heightCons.constant) {
            self.contentLabel.scrollEnabled = YES;
        } else {
            self.contentLabel.scrollEnabled = NO;
        }
    }
}

@end

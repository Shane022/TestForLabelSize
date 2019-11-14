//
//  ViewController.m
//  TestForLabelSize
//
//  Created by Shane on 2019/11/14.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "ViewController.h"

static CGFloat minFontSize = 8;
static CGFloat maxFontSize = 50;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fontLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UISlider *fontSlider;

@property (weak, nonatomic) IBOutlet UILabel *oneLineContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLineContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *multiLineContentLabel;


@end

@implementation ViewController
{
    CGFloat _curFontSize;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fontSlider.minimumValue = minFontSize;
    self.fontSlider.maximumValue = maxFontSize;
    
    self.fontSlider.value = 11;
    [self changeFont:self.fontSlider];
}

- (IBAction)changeFont:(UISlider *)sender {
    _curFontSize = round(sender.value);
    self.oneLineContentLabel.font = [UIFont systemFontOfSize:_curFontSize];
    [self.oneLineContentLabel sizeToFit];
    self.twoLineContentLabel.font = [UIFont systemFontOfSize:_curFontSize];
    [self.twoLineContentLabel sizeToFit];
    self.multiLineContentLabel.font = [UIFont systemFontOfSize:_curFontSize];
    [self.multiLineContentLabel sizeToFit];
    
    [self.view layoutIfNeeded];
    self.fontLabel.text = [NSString stringWithFormat:@"字体：%.1f", _curFontSize];
    self.heightLabel.text = [NSString stringWithFormat:@"1行：%.1f\n2行：%.1f\n多行：%.1f", self.oneLineContentLabel.intrinsicContentSize.height, self.twoLineContentLabel.intrinsicContentSize.height,
        self.multiLineContentLabel.intrinsicContentSize.height];
}


@end

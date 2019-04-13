//
//  ViewController.m
//  FontAwsomeIniOS
//
//  Created by 李刚 on 2019/4/13.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取字体库名
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Font Awesome 5 Free-Solid-900" ofType:@".otf"];
    NSURL *fontUrl = [NSURL fileURLWithPath:path];
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)fontUrl);
    CGFontRef fontRef = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(fontRef, NULL);
    NSString *fontName = CFBridgingRelease(CGFontCopyPostScriptName(fontRef));
    
    // 使用
    UILabel *awesomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    awesomeLabel.font = [UIFont fontWithName:@"FontAwesome5Free-Solid" size:20];
    awesomeLabel.text = @"\uf015";
    [self.view addSubview:awesomeLabel];
}


@end

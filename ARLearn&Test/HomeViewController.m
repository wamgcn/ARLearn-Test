//
//  HomeViewController.m
//  ARLearn&Test
//
//  Created by new on 2018/11/1.
//  Copyright © 2018年 new. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)buttonClickedWithSender:(UIButton *)sender
{
//    [self performSegueWithIdentifier:@"NewVC" sender:nil];
    switch (sender.tag)
    {
        case 0:
            [self performSegueWithIdentifier:@"MainToWorldTracking" sender:nil];
            break;
            
        case 1:
            [self performSegueWithIdentifier:@"MainToFaceTracking" sender:nil];
            break;
            
        case 2:
            [self performSegueWithIdentifier:@"MainToImageRecognize" sender:nil];
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

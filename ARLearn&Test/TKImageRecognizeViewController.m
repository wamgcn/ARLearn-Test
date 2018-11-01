//
//  TKImageRecognizeViewController.m
//  ARLearn&Test
//
//  Created by new on 2018/11/1.
//  Copyright © 2018年 new. All rights reserved.
//

#import "TKImageRecognizeViewController.h"

@interface TKImageRecognizeViewController ()<ARSCNViewDelegate>
{
    ARSCNView *_scnView;
    ARWorldTrackingConfiguration *_configuration;
}

@end

@implementation TKImageRecognizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"物体识别";
    
    _scnView = [[ARSCNView alloc] initWithFrame:self.view.bounds];
    _scnView.delegate = self;
    _scnView.showsStatistics = YES;
    [self.view addSubview:_scnView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    ARReferenceImage
    NSSet *referenceImageSet = [ARReferenceImage referenceImagesInGroupNamed:@"AR Resources" bundle:nil];
    if (referenceImageSet == nil)
    {
        NSLog(@"AR Resources 资源文件不存在 。");
    }
    
    _configuration = [[ARWorldTrackingConfiguration alloc] init];
    _configuration.detectionImages =[ARReferenceImage referenceImagesInGroupNamed:@"AR Resources" bundle:nil];
    [_scnView.session runWithConfiguration:_configuration];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_scnView.session pause];
}

-(void)renderer:(id<SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
    if (![anchor isKindOfClass:[ARImageAnchor class]])
    {
        return;
    }
    
    ARImageAnchor *imageAnchor = anchor;
    
    ARReferenceImage *referenceImage = imageAnchor.referenceImage;
    
    SCNPlane *plane = [SCNPlane planeWithWidth:referenceImage.physicalSize.width height:referenceImage.physicalSize.height];
    
//    SCNBox *box =[SCNBox boxWithWidth:0.08 height:0.08 length:0.08 chamferRadius:0];
    SCNNode *boxNode = [SCNNode nodeWithGeometry:plane];
    [node addChildNode:boxNode];
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

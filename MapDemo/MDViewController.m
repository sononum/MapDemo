//
//  MDViewController.m
//  MapDemo
//
//  Created by Ulrich Zurucker on 6/13/13.
//  Copyright (c) 2013 Ulrich Zurucker. All rights reserved.
//

#import "MDViewController.h"
#import "RMOpenCycleMapSource.h"

@interface MDViewController ()

@end

@implementation MDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSObject<RMTileSource> *source= nil;

    source = [[RMMBTilesSource alloc] initWithTileSetResource:@"DemoMap" ofType:@"mbtiles"];
    
    /*
     other sources possible:
    source = [[RMOpenCycleMapSource alloc] init];
     */
    
    
    
    RMMapView* mapView = [[RMMapView alloc] initWithFrame:self.view.bounds
                                            andTilesource:source];
    
    mapView.zoom = 8.;
    mapView.showLogoBug = NO;
    mapView.maxZoom = 16.;
    mapView.userTrackingMode = RMUserTrackingModeFollow;
    mapView.showsUserLocation = YES;
    
    mapView.autoresizingMask =
        UIViewAutoresizingFlexibleHeight |
        UIViewAutoresizingFlexibleWidth;
    
    [mapView.tileCache addCache:[[RMDatabaseCache alloc] initUsingCacheDir:NO]];
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

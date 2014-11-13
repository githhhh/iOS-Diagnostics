//
//  ELLSignalBreakdownModel.m
//  iOS Diagnostics
//
//  Created by Christopher Anderson on 11/11/2014.
//  Copyright (c) 2014 Electric Labs. All rights reserved.
//

#import "ELLSignalBreakdownModel.h"
#import "ELLReportSectionModel+Internal.h"
#import "ELLSqlPowerLogAnalyser.h"

@interface ELLSignalBreakdownModel ()
@property (nonatomic, readwrite, strong) NSArray *signalBarToPercentage;
@end

@implementation ELLSignalBreakdownModel

- (void)load {
    [self.logAnalyser processSignalBarsFrom:self.startDate toDate:self.endDate completion:^(NSArray *signalBreakdown, NSError *error) {
        self.signalBarToPercentage = signalBreakdown;
        self.readyToReport = YES;
    }];
}

@end

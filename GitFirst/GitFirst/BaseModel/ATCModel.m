//
//  SWAMCModel.m
//  FeiGuangpu
//
//  Created by iBcker on 14-6-28.
//
//

#import "ATCModel.h"
#import "SWATCModel+AutoCoding.h"

@implementation ATCModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",[self dictionaryRepresentation]];
}

@end

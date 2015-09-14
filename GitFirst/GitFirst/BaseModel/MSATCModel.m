//
//  SWAMCModel.m
//  FeiGuangpu
//
//  Created by iBcker on 14-6-28.
//
//

#import "MSATCModel.h"
#import "SWATCModel+AutoCoding.h"

@implementation MSATCModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",[self dictionaryRepresentation]];
}

@end

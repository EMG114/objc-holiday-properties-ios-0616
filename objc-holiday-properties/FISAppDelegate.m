//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return [self.database[season] allKeys];
    
}


- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSArray *suppliesInHoliday = self.database[season][holiday];
    NSMutableArray *suppliesInHolidayMutable = [suppliesInHoliday mutableCopy];
    
    return suppliesInHolidayMutable;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    
   return [[self.database[season] allKeys] containsObject:holiday];
    
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    return [self.database[season][holiday] containsObject:supply];
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
     self.database[season][holiday] = [@[]mutableCopy];
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply];
}

@end

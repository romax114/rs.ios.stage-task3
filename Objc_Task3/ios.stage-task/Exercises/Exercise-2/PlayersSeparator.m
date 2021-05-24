#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger result = 0;
    
    if ([ratingArray count] < 3){
        NSLog(@"RATING ARRAY COUNT = %lu", (unsigned long)[ratingArray count]);
        result = 0;
    } else {
        for (int i = 0; i < [ratingArray count]; i++) {
            NSNumber *iPlayer = ratingArray[i];
            for (int j = i+1; j < [ratingArray count]; j++) {
                NSNumber *jPlayer = ratingArray[j];
                if ([iPlayer integerValue] < [jPlayer integerValue]){
                    for (int k = j + 1; k < [ratingArray count]; k ++){
                        NSNumber *kPlayer = ratingArray[k];
                        if ([jPlayer integerValue] < [kPlayer integerValue]){
                            result += 1;
                        }
                    }
                } else if ([iPlayer integerValue] > [jPlayer integerValue]) {
                    for (int k = j + 1; k < [ratingArray count]; k ++){
                        NSNumber *kPlayer = ratingArray[k];
                        if ([jPlayer integerValue] > [kPlayer integerValue]){
                            result += 1;
                        }
                    }
                }
            }
        }
    }
    
    return result;
}

@end

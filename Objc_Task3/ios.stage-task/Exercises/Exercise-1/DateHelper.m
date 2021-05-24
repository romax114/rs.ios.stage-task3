#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) {
        return nil;
    }
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString *monthName = [[df monthSymbols] objectAtIndex:(monthNumber-1)];
    return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDate *dateTime  = [dateFormatter dateFromString:date];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * dateComponents = [calendar components: NSCalendarUnitDay fromDate: dateTime];
    NSLog(@"%ld", (long)dateComponents.day);
    return dateComponents.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    dateFormatter.dateFormat = @"EE";
    NSString *day = [dateFormatter stringFromDate:date];
    return day;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
    NSDateComponents *dataComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:date];
    return (currentComponents.year == dataComponents.year) && (currentComponents.weekOfYear == dataComponents.weekOfYear);
}

@end

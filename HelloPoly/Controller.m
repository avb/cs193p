#import "Controller.h"

@implementation Controller

- (void)awakeFromNib {
    polygon.minimumNumberOfSides = 3;
    polygon.maximumNumberOfSides = 12;
    polygon.numberOfSides = numberOfSidesLabel.text.integerValue;
    degreesLabel.text = [NSString stringWithFormat:@"%.2f", polygon.angleInDegrees];
    radiansLabel.text = [NSString stringWithFormat:@"%.6f", polygon.angleInRadians];
    polyNameLabel.text = polygon.name;
    
    NSLog(@"My polygon: %@", polygon);
}

- (IBAction)decrease {
    polygon.numberOfSides = polygon.numberOfSides - 1;
    [self updateInterface];
}

- (IBAction)increase {
    polygon.numberOfSides++;
    [self updateInterface];
}

- (void)updateInterface {
    increaseButton.enabled = (polygon.numberOfSides < 12);
    decreaseButton.enabled = (polygon.numberOfSides > 3);
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
    minValueLabel.text = [NSString stringWithFormat:@"%d", polygon.minimumNumberOfSides];
    maxValueLabel.text = [NSString stringWithFormat:@"%d", polygon.maximumNumberOfSides];
    degreesLabel.text = [NSString stringWithFormat:@"%.2f", polygon.angleInDegrees];
    radiansLabel.text = [NSString stringWithFormat:@"%.6f", polygon.angleInRadians];
    polyNameLabel.text = polygon.name;
}

@end

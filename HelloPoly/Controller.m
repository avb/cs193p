#import "Controller.h"

@implementation Controller

@synthesize polygon;


- (void)dealloc {
    [polygon release];
    [super dealloc];
}

- (void)awakeFromNib {
    polygon= [[PolygonShape alloc] initWithNumberOfSides:[[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfSides"]];
    [sidesSlider setValue:polygon.numberOfSides];
    
    PolygonView *polygonView = [[PolygonView alloc] initWithFrame:CGRectMake(10.0, 160.0, 220.0, 140.0)];
    [polygonView setPolygon:polygon];
    //[self.view setNeedsDisplay];
    [polygonView release];
    
    [self updateInterface];
}

/*- (IBAction)decrease {
    polygon.numberOfSides = polygon.numberOfSides - 1;
    [self updateInterface];
}

- (IBAction)increase {
    polygon.numberOfSides++;
    [self updateInterface];
}*/

- (IBAction)setSides {
    polygon.numberOfSides = [sidesSlider value] ;
    [self updateInterface];
}

- (void)updateInterface {
/*    increaseButton.enabled = (polygon.numberOfSides < 12);
    decreaseButton.enabled = (polygon.numberOfSides > 3); */
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
    minValueLabel.text = [NSString stringWithFormat:@"%d", polygon.minimumNumberOfSides];
    maxValueLabel.text = [NSString stringWithFormat:@"%d", polygon.maximumNumberOfSides];
    degreesLabel.text = [NSString stringWithFormat:@"%.2f", polygon.angleInDegrees];
    radiansLabel.text = [NSString stringWithFormat:@"%.6f", polygon.angleInRadians];
    polyNameLabel.text = polygon.name;
    
    // Save current polygon to disk
    [[NSUserDefaults standardUserDefaults] setInteger:[polygon numberOfSides] forKey:@"numberOfSides"];


    // redraw polygon
    //[self.view setNeedsDisplay];
    
}

@end

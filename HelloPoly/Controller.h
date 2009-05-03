#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet UILabel *minValueLabel;
    IBOutlet UILabel *maxValueLabel;
    IBOutlet UILabel *degreesLabel;
    IBOutlet UILabel *radiansLabel;
    IBOutlet UILabel *polyNameLabel;
    
    IBOutlet PolygonShape *polygon;
}
- (IBAction)decrease;
- (IBAction)increase;
- (void)updateInterface;
@end

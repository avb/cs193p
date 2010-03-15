#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : UIViewController {
//    IBOutlet UIButton *decreaseButton;
//    IBOutlet UIButton *increaseButton;
    IBOutlet UISlider *sidesSlider;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet UILabel *minValueLabel;
    IBOutlet UILabel *maxValueLabel;
    IBOutlet UILabel *degreesLabel;
    IBOutlet UILabel *radiansLabel;
    IBOutlet UILabel *polyNameLabel;
    
    PolygonShape *polygon;
}

@property (nonatomic, retain) IBOutlet PolygonShape *polygon;

//- (IBAction)decrease;
//- (IBAction)increase;

- (IBAction)setSides;
- (void)updateInterface;
@end

#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    //increment the time since the last obstacle
    timeSinceObstacle += delta;
    
    // check if 2s have passed
    if(timeSinceObstacle > 2.0f)
    {
        //add new obstacle
        [self addObstacle];
        
        //reset the timer
        timeSinceObstacle = 0.0f;
    }
        
    
}

// put new methods here
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    //this will get called every time the player touches the screen
    [character flap];
    
    
}
@end

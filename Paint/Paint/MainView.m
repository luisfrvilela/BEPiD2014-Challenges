//
//  MainView.m
//  Paint
//
//  Created by Luís Resende on 29/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "MainView.h"
#import "MainLine.h"
#import "MainCircle.h"
#import "AppDelegate.h"

@interface MainView () <UIGestureRecognizerDelegate>
{
    AppDelegate *appDelegate;
}

@property (nonatomic) NSMutableDictionary *linesInProgress;
@property (nonatomic) NSMutableDictionary *circlesInProgress;

@property (nonatomic) MainLine *selectedLine;
@property (nonatomic) MainCircle *selectedCircle;

@property(nonatomic, strong) UIPanGestureRecognizer *mover;

@property (nonatomic) UISlider *sliderLinhas;
@property (nonatomic) int contador;

@property (nonatomic) UIView *viewPainel;
@property (nonatomic) float tamanhoLinha;

@end



@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _tamanhoLinha = 8.0;
        _linesInProgress = [[NSMutableDictionary alloc]init];
        _circlesInProgress = [[NSMutableDictionary alloc]init];
        appDelegate = [[UIApplication sharedApplication]delegate];
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
        doubleTap.numberOfTapsRequired = 2;
        doubleTap.delaysTouchesBegan = YES;
        
        [self addGestureRecognizer:doubleTap];
        
        UITapGestureRecognizer *tapCircle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCircle:)];
        
        tapCircle.delaysTouchesBegan = YES;
        [tapCircle requireGestureRecognizerToFail:doubleTap];
        [self addGestureRecognizer:tapCircle];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        tap.delaysTouchesBegan = YES;
        [tap requireGestureRecognizerToFail:doubleTap];
        [self addGestureRecognizer:tap];
        
        UILongPressGestureRecognizer *pressionar =
        [[UILongPressGestureRecognizer alloc] initWithTarget:self                                                  action:@selector(longPress:)];
        [self addGestureRecognizer:pressionar];
        
        self.mover = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveLine:)];
        self.mover.delegate = self;
        self.mover.cancelsTouchesInView = NO;
        [self addGestureRecognizer:self.mover];
        
        //Swipe com 3 dedos
        
        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleViewsSwipe:)];
        swipe.numberOfTouchesRequired = 3;
        swipe.direction = UISwipeGestureRecognizerDirectionUp;
        swipe.delaysTouchesBegan = YES;
        [self addGestureRecognizer:swipe];
        
        //Swipe down
        
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleViewsSwipe:)];
        swipeDown.numberOfTouchesRequired = 3;
        swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
        swipeDown.delaysTouchesBegan = YES;
        [self addGestureRecognizer:swipeDown];
        
        appDelegate = [[UIApplication sharedApplication]delegate];
        
        self.multipleTouchEnabled = YES;

    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([touches count]==2) {
        
        NSArray *points = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:[points objectAtIndex:0]];
        CGPoint point1 = [[points objectAtIndex:0] locationInView:self];
        CGPoint point2 = [[points objectAtIndex:1] locationInView:self];
        
        CGPoint centerPoint = CGPointMake((point1.x + point2.x) / 1.0, (point1.y + point2.y) / 1.0);

        float radianoLength = MIN(fabsf((point2.x + point1.x) / 2.0) , fabsf((point2.y + point1.y) / 2.0));
    
        MainCircle *novoCirculo = [[MainCircle alloc]init];
        [novoCirculo setCentro:centerPoint];
        [novoCirculo setRadianos:radianoLength];
        
        [_circlesInProgress setObject:novoCirculo forKey:key];
    }
    else{
    
        for (UITouch *t in touches) {
            
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            
            CGPoint location = [t locationInView:self];
            MainLine *novaLinha = [[MainLine alloc]init];
            [novaLinha setBegin:location];
            [novaLinha setEndLine:location];
            
            [_linesInProgress setObject:novaLinha forKey:key];
        }
    }
    [self setNeedsDisplay];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([touches count]==2){
        
        NSArray *points = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:[points objectAtIndex:0]];
        CGPoint point1 = [[points objectAtIndex:0] locationInView:self];
        CGPoint point2 = [[points objectAtIndex:1] locationInView:self];
        
        CGPoint centerPoint = CGPointMake((point1.x + point2.x) / 2.0, (point1.y + point2.y) / 2.0);
        float radianoLength = fabsf((point2.y - point1.y) / 2.0);
        
        MainCircle *circuloExistente = [_circlesInProgress objectForKey:key];
        [circuloExistente setCentro:centerPoint];
        [circuloExistente setRadianos:radianoLength];
    }
    else{
        
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            MainLine *linha = [_linesInProgress objectForKey:key];
            
            CGPoint location = [t locationInView:self];
            [linha setEndLine:location];
        }
    }
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
   
    if ([_circlesInProgress count]) {
        
        NSArray *points = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:[points objectAtIndex:0]];
        MainCircle *circuloExistente = [_circlesInProgress objectForKey:key];
        if (circuloExistente) {
            [appDelegate.finishedCircles addObject:circuloExistente];
            [_circlesInProgress removeAllObjects];
            [_linesInProgress removeAllObjects];
        }
    }
    else{
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            
            MainLine *line = self.linesInProgress[key];
            
            [appDelegate.finishedLines addObject:line];
            [self.linesInProgress removeObjectForKey:key];
        }
    }
    
    [self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    [[UIColor blackColor]set];
    if (self.selectedLine!=nil){
        [[UIColor greenColor]set];
        [self.selectedLine stroke];
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    for (MainLine *line in appDelegate.finishedLines){
        
        float delta_x = [line endLine].x - [line begin].x;
        float delta_y = [line endLine].y - [line begin].y;
        float hue = fabsf(atanf(delta_y / delta_x)) / ((2.0 * M_PI) / 4.0);
        
        [[UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0] set];
        
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line endLine].x, [line endLine].y);
        CGContextSetLineWidth(context, 10);
        CGContextStrokePath(context);
    }
    [[UIColor redColor]set];
    for (NSValue *key in self.linesInProgress){
        MainLine *line = self.linesInProgress[key];
        
        float delta_x = [line endLine].x - [line begin].x;
        float delta_y = [line endLine].y - [line begin].y;
        float hue = fabsf(atanf(delta_y / delta_x)) / ((2.0 * M_PI) / 4.0);
        
        [[UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0] set];
        
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line endLine].x, [line endLine].y);
        CGContextStrokePath(context);
        
        [line stroke];
    }
    
    for (MainCircle *circle in appDelegate.finishedCircles) {
        if (![circle corCirculo]) {
            float delta_x = [circle centro].x - [circle radianos];
            float delta_y = [circle centro].y - [circle radianos];
            float hue = fabsf(atanf(delta_y / delta_x)) / ((2.0 * M_PI) / 4.0);
            [circle setCorCirculo:[UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0]];
        }
        [[circle corCirculo]set];
        
        CGContextAddArc(context, [circle centro].x, [circle centro].y, [circle radianos], 0, M_PI * 2.0, 1);
        CGContextSetLineWidth(context, 8.0);
        CGContextStrokePath(context);
    }
    
    [[UIColor redColor]set];
    for (NSValue *v in _circlesInProgress) {
        MainCircle *circle = [_circlesInProgress objectForKey:v];
        CGContextAddArc(context, [circle centro].x, [circle centro].y, [circle radianos], 0, M_PI * 2.0, 1);
        CGContextStrokePath(context);
    }
}

-(void)doubleTap:(UIGestureRecognizer*)gestureRecognizer{
    
    [self.linesInProgress removeAllObjects];
    [appDelegate.finishedLines removeAllObjects];
    
    [self.circlesInProgress removeAllObjects];
    [appDelegate.finishedCircles removeAllObjects];
    
    [self setNeedsDisplay];
}

-(void)tap:(UIGestureRecognizer*)gestureRecognizer{
    
    CGPoint point = [gestureRecognizer locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    self.selectedCircle = [self circleAtPoint:point];
    
    if (self.selectedLine) {
        [self becomeFirstResponder];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        UIMenuItem *deleteItem = [[UIMenuItem alloc]initWithTitle:@"Delette" action:@selector(deleteLine:)];
        
        menu.menuItems = @[deleteItem];
        
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
    }
    
    else{
        [[UIMenuController sharedMenuController]setMenuVisible:NO animated:YES];
    }
    
    [self setNeedsDisplay];
}

-(void)tapCircle:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint point = [gestureRecognizer locationInView:self];
    self.selectedCircle = [self circleAtPoint:point];
    
    if(self.selectedCircle){
        
        [self becomeFirstResponder];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteCircle:)];
        menu.menuItems = @[deleteItem];
        
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
    }
    else{
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
    }
    [self setNeedsDisplay];
}

-(MainLine *)lineAtPoint: (CGPoint)p{
    for (MainLine *l in appDelegate.finishedLines) {
        if ([l havePoint:p]) {
            return l;
        }
    }
    return nil;
}

-(MainCircle *)circleAtPoint: (CGPoint)p{
    for (MainCircle *c in appDelegate.finishedCircles) {
        if ([c havePoint:p]) {
            return c;
        }
    }
    return nil;
}

-(void)deleteLine: (id)sender
{
    [appDelegate.finishedLines removeObject:self.selectedLine];
    self.selectedLine = nil;
    
    [self setNeedsDisplay];
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void) deleteCircle: (id)sender{
    [appDelegate.finishedCircles removeObject:self.selectedCircle];
    self.selectedCircle = nil;
    
    [self setNeedsDisplay];
}

- (void)longPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gestureRecognizer locationInView:self];
        self.selectedLine = [self lineAtPoint:point];
        if (self.selectedLine) {
            [self.linesInProgress removeAllObjects];
        }
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        self.selectedLine = nil;
    }
    [self setNeedsDisplay];
}

- (void)moveLine:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (!self.selectedLine) {
        return;
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:self];
        CGPoint begin = self.selectedLine.begin;
        CGPoint end = self.selectedLine.endLine;
        begin.x += translation.x;
        begin.y += translation.y;
        end.x += translation.x;
        end.y += translation.y;
        
        self.selectedLine.begin = begin;
        self.selectedLine.endLine = end;
        
        [self setNeedsDisplay];
        [gestureRecognizer setTranslation:CGPointZero inView:self];
    }
}
- (void)handleViewsSwipe:(UISwipeGestureRecognizer *)recognizer {
    NSUInteger touches = recognizer.numberOfTouches;
    switch (touches) {
        case 3:
            [self sliderInicial];
            if(recognizer.direction == UISwipeGestureRecognizerDirectionDown)
                [self hiddenSlider];
            break;
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)other
{
    if (gestureRecognizer == self.mover) {
        return YES;
    }
    return NO;
}
-(void)sliderInicial{
    
    if(_contador == 0){
        self.viewPainel = [[UIView alloc] initWithFrame: CGRectMake (0, 500, 400, 150)];
        self.viewPainel.backgroundColor = [UIColor blackColor];
        self.viewPainel.alpha = 0.5;
        [self addSubview:self.viewPainel];
    }
    self.viewPainel.hidden = NO;
}

-(void) hiddenSlider{
    
    _sliderLinhas.hidden = YES;
    _viewPainel.hidden = YES;
    
}
-(IBAction)mySlider
{
    if(_contador == 0){
        CGRect frame = CGRectMake(35.0, 485.0, 250.0, 100.0);
        _sliderLinhas = [[UISlider alloc] initWithFrame:frame];
        [_sliderLinhas addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        [_sliderLinhas setBackgroundColor:[UIColor clearColor]];
        _sliderLinhas.minimumValue = 0.0;
        _sliderLinhas.maximumValue = 15.0;
        _sliderLinhas.continuous = YES;
        _sliderLinhas.value = 10.0;
        [self addSubview:_sliderLinhas];
        _contador++;
    }
    
    [_sliderLinhas setHidden:NO];
}

-(void)sliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    _tamanhoLinha = slider.value;
    
}
@end

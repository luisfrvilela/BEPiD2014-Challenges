//
//  MainView.m
//  exemplo2907
//
//  Created by Rodrigo Von-Grapp Freitas on 29/07/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import "MainView.h"
#import "MainLine.h"
#import "MainCircle.h"
#import "AppDelegate.h"

@interface MainView () <UIGestureRecognizerDelegate>
{
    AppDelegate *app;
}
@property (nonatomic) float tamanhoLinha;
@property (nonatomic) NSMutableDictionary *linesInProgress;
@property (nonatomic) NSMutableDictionary *circlesInProgress;

@property (nonatomic, strong) UIPanGestureRecognizer *mover;

@property (nonatomic) MainLine *selectedLine;
@property (nonatomic) MainCircle *selectedCircle;

@property (nonatomic) UISlider *sliderLinhas;
@property (nonatomic) int contador;

@property (nonatomic) UIView *viewPainel;
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
        
        //Deleta todas as linhas e circulos
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
        
        doubleTap.numberOfTapsRequired = 2;
        doubleTap.delaysTouchesBegan = YES;
        
        [self addGestureRecognizer:doubleTap];
        
        //Seleciona um circulo
        UITapGestureRecognizer *tapCircle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCircle:)];
        
        tapCircle.delaysTouchesBegan = YES;
        [tapCircle requireGestureRecognizerToFail:doubleTap];
        [self addGestureRecognizer:tapCircle];

        
        //Seleciona uma linha
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
        
        app = [[UIApplication sharedApplication]delegate];
        
        self.multipleTouchEnabled = YES;
    }
    return self;
}
-(void)doubleTap:(UIGestureRecognizer *)gestureRecognizer{
    NSLog(@"Removendo Tudo");
    
    [self.linesInProgress removeAllObjects];
    [app.endedLines removeAllObjects];
    
    [self.circlesInProgress removeAllObjects];
    [app.endedCircles removeAllObjects];
    
    [self setNeedsDisplay];
}
-(void)tap:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint point = [gestureRecognizer locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    self.selectedCircle = [self circleAtPoint:point];
    
    if(self.selectedLine){
        
        [self becomeFirstResponder];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        menu.menuItems = @[deleteItem];
        
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
    }
    else{
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([touches count] == 2) {
        NSArray *points = [touches allObjects];
        // Identifica os pontos do circulo
        NSValue *key = [NSValue valueWithNonretainedObject:[points objectAtIndex:0]];
        CGPoint point1 = [[points objectAtIndex:0] locationInView:self];
        CGPoint point2 = [[points objectAtIndex:1] locationInView:self];
        
        // O centro entre os dois pontos
        CGPoint centerPoint = CGPointMake((point1.x + point2.x) / 1.0, (point1.y + point2.y) / 1.0);
        // Minimo entre x e y
        float radiusLength = MIN(fabsf((point2.x + point1.x) / 2.0) , fabsf((point2.y + point1.y) / 2.0));
        
        MainCircle *circle = [[MainCircle alloc]init];
        [circle setValorCentral:centerPoint];
        [circle setRadianos:radiusLength];
        
        // Dicionario de circulos
        [self.circlesInProgress setObject:circle forKey:key];
    }
    else{
    
        for(UITouch *t in touches){
            CGPoint location = [t locationInView:self];
    
            MainLine *line = [[MainLine alloc]init];
            line.begin = location;
            line.end = location;
    
            NSValue *key = [NSValue valueWithNonretainedObject:t];
        
            [self.linesInProgress setObject:line forKey:key];
        }
    }
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([touches count] == 2) {
        
        NSArray *points = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:[points objectAtIndex:0]];
        CGPoint point1 = [[points objectAtIndex:0] locationInView:self];
        CGPoint point2 = [[points objectAtIndex:1] locationInView:self];
        
        CGPoint centerPoint = CGPointMake((point1.x + point2.x) / 2.0, (point1.y + point2.y) / 2.0);
        float radiusLength = fabsf((point2.y - point1.y) / 2.0);
        
        MainCircle *circle = [_circlesInProgress objectForKey:key];
        [circle setValorCentral:centerPoint];
        [circle setRadianos:radiusLength];
    }else{
        for(UITouch *t in touches){
            CGPoint location = [t locationInView:self];
            NSValue *key = [NSValue valueWithNonretainedObject:t];
        
            MainLine *line = self.linesInProgress[key];
            line.end = location;
        }
    }
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([_circlesInProgress count]) {
        NSArray *points = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:[points objectAtIndex:0]];
        MainCircle *circle = [_circlesInProgress objectForKey:key];
        if (circle) {
            [app.endedCircles addObject:circle];
            [_circlesInProgress removeAllObjects];
            [_linesInProgress removeAllObjects];
        }
        
    }
    else{
        for(UITouch *t in touches){
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            
            MainLine *line = self.linesInProgress[key];
        
            [app.endedLines addObject:line];
            [self.linesInProgress removeObjectForKey:key];
        }
    }
    [self setNeedsDisplay];
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 8.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    [[UIColor blackColor]set];

    
    for(MainLine *line in app.endedLines){
        //Usa a Hue para colorir de acordo com a posição inicial e final (angulo).
        //Valores usados para calcular o inicio e final da linha e a mudança de cor.
        float valor_x = [line end].x - [line begin].x;
        float valor_y = [line end].y - [line begin].y;
        //fabsf altera o valor float negativo para um valor absoluto
        //atanf pega o valor principal float do arc tangente
        float manterCorAngulo = fabsf(atanf(valor_y / valor_x)) / ((2.0 * M_PI) / 4.0);
        
        [[UIColor colorWithHue:manterCorAngulo saturation:1.0 brightness:1.0 alpha:1.0] set];
        
        //Nas linhas finalizadas mantém a cor que foi escolhida no angulo.
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
    }
    
    [[UIColor redColor]set];
    for(NSValue *key in self.linesInProgress) {
        MainLine *line = self.linesInProgress[key];
        //Usa a Hue para colorir de acordo com a posição inicial e final (angulo).
        //Valores usados para calcular o inicio e final da linha e a mudança de cor.
        float valor_x = [line end].x - [line begin].x;
        float valor_y = [line end].y - [line begin].y;
        //fabsf altera o valor float negativo para um valor absoluto
        //atanf pega o valor principal float do arc tangente
        float mudaCorLinhas = fabsf(atanf(valor_y / valor_x)) / ((2.0 * M_PI) / 4.0);
        
        //Altera a cor a partir do angulo de cada linha.
        [[UIColor colorWithHue:mudaCorLinhas saturation:1.0 brightness:1.0 alpha:1.0] set];
        
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
        [line stroke];
    }
    //Para os circulos finalizados
    for (MainCircle *circle in app.endedCircles) {
        // Cor do circulo é randomica
        if (![circle corCirculo]) {
            float valor_x = [circle valorCentral].x - [circle radianos];
            float valor_y = [circle valorCentral].y - [circle radianos];
            float hue = fabsf(atanf(valor_y / valor_x)) / ((2.0 * M_PI) / 4.0);
            [circle setCorCirculo:[UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0]];
        }
        [[circle corCirculo]set];
        
        CGContextAddArc(context, [circle valorCentral].x, [circle valorCentral].y, [circle radianos], 0, M_PI * 2.0, 1);
        CGContextSetLineWidth(context, 8.0);
        CGContextStrokePath(context);
    }
    
    // Circulos em progresso
    [[UIColor redColor]set];
    for (NSValue *v in _circlesInProgress) {
        MainCircle *circle = [_circlesInProgress objectForKey:v];
        CGContextAddArc(context, [circle valorCentral].x, [circle valorCentral].y, [circle radianos], 0, M_PI * 2.0, 1);
        CGContextStrokePath(context);
    }
    if(self.selectedLine != nil){
        
        [[UIColor greenColor]set];
        [self.selectedLine stroke];
        
    }
}
- (MainLine *)lineAtPoint: (CGPoint)p{
    
    for (MainLine *line in app.endedLines){
        if([line havePoint:p]){
            return line;
        }
    }
    return nil;
}

- (MainCircle *)circleAtPoint: (CGPoint)p{
    
    for (MainCircle *circle in app.endedCircles){
        if([circle havePoint:p]){
            return circle;
        }
    }
    return nil;
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void) deleteCircle: (id)sender{
    [app.endedCircles removeObject:self.selectedCircle];
    self.selectedCircle = nil;
    
    [self setNeedsDisplay];
}

-(void) deleteLine: (id)sender{
    [app.endedLines removeObject:self.selectedLine];
    self.selectedLine = nil;
    
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
        CGPoint end = self.selectedLine.end;
        begin.x += translation.x;
        begin.y += translation.y;
        end.x += translation.x;
        end.y += translation.y;
        
        self.selectedLine.begin = begin;
        self.selectedLine.end = end;
        
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

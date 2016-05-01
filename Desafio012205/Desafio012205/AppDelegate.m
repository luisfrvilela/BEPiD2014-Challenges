//
//  AppDelegate.m
//  Desafio012205
//
//  Created by Luís Resende on 22/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "AppDelegate.h"
#import "PrincipalViewController.h"
#import "Pessoa.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    
    bigRect.size.width *=4.0;
    
    //Adicionando o uiscrollview na tela
    UIScrollView *scroolView = [[UIScrollView alloc]initWithFrame:screenRect];
    int larguraTela = self.window.bounds.size.width;
    int alturaTela = self.window.bounds.size.height;
    
    //Primeira Pessoa
    
    //Adicionando imagem
    UIImageView *imagem1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png" ]];
    CGRect posicaoFoto1 = imagem1.frame;
    posicaoFoto1.origin.x = 10;
    posicaoFoto1.origin.y = 30;
    posicaoFoto1.size.height = 200;
    posicaoFoto1.size.width = 300;
    imagem1.frame = posicaoFoto1;
    [scroolView addSubview:imagem1];
    
    //Adicionando nome e idade
    UILabel *nome = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, larguraTela, alturaTela/4)];
    nome.text = @"Luis";
    [scroolView addSubview:nome];
    
    UILabel *idade = [[UILabel alloc]initWithFrame:CGRectMake(0, 270, larguraTela, alturaTela/4)];
    idade.text = @"19";
    [scroolView addSubview:idade];
    
    //Adicionando imagem
    UIImageView *imagem2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png" ]];
    CGRect posicaoFoto2 = imagem2.frame;
    posicaoFoto2.origin.x = posicaoFoto1.origin.x+larguraTela;
    posicaoFoto2.origin.y = posicaoFoto1.origin.y;
    posicaoFoto2.size.height = 200;
    posicaoFoto2.size.width = 300;
    imagem2.frame = posicaoFoto2;
    [scroolView addSubview:imagem2];
    
    //Adicionando nome e idade
    UILabel *nome2 = [[UILabel alloc]initWithFrame:CGRectMake((nome.bounds.origin.x+larguraTela), 250, larguraTela, alturaTela/4)];
    nome2.text = @"Igor";
    [scroolView addSubview:nome2];
    
    UILabel *idade2 = [[UILabel alloc]initWithFrame:CGRectMake((idade.bounds.origin.x+larguraTela), 270, larguraTela, alturaTela/4)];
    idade2.text = @"26";
    [scroolView addSubview:idade2];
    
    //Adicionando imagem
    UIImageView *imagem3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png" ]];
    CGRect posicaoFoto3 = imagem3.frame;
    posicaoFoto3.origin.x = posicaoFoto2.origin.x+larguraTela;
    posicaoFoto3.origin.y = posicaoFoto2.origin.y;
    posicaoFoto3.size.height = 200;
    posicaoFoto3.size.width = 300;
    imagem3.frame = posicaoFoto3;
    [scroolView addSubview:imagem3];
    
    //Adicionando nome e idade
    UILabel *nome3 = [[UILabel alloc]initWithFrame:CGRectMake(larguraTela*2, 250, larguraTela, alturaTela/4)];
    nome3.text = @"Marcela";
    [scroolView addSubview:nome3];
    
    UILabel *idade3 = [[UILabel alloc]initWithFrame:CGRectMake(larguraTela*2, 270, larguraTela, alturaTela/4)];
    idade3.text = @"25";
    [scroolView addSubview:idade3];
    
    //Adicionando imagem
    UIImageView *imagem4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png" ]];
    CGRect posicaoFoto4 = imagem4.frame;
    posicaoFoto4.origin.x = posicaoFoto3.origin.x+larguraTela;
    posicaoFoto4.origin.y = posicaoFoto3.origin.y;
    posicaoFoto4.size.height = 200;
    posicaoFoto4.size.width = 300;
    imagem4.frame = posicaoFoto4;
    [scroolView addSubview:imagem4];
    
    //Adicionando nome e idade
    UILabel *nome4 = [[UILabel alloc]initWithFrame:CGRectMake(larguraTela*3, 250, larguraTela, alturaTela/4)];
    nome4.text = @"Alan";
    [scroolView addSubview:nome4];
    
    UILabel *idade4 = [[UILabel alloc]initWithFrame:CGRectMake(larguraTela*3, 270, larguraTela, alturaTela/4)];
    idade4.text = @"22";
    [scroolView addSubview:idade4];

   
    //Informando o tamanho da scroolView
    scroolView.contentSize = bigRect.size;
    
    scroolView.pagingEnabled = YES;
    
    PrincipalViewController *principal = [[PrincipalViewController alloc]init];
    
    [principal.view addSubview:scroolView];
    
    self.window.rootViewController = principal;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

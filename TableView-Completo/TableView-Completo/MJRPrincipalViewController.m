//
//  MJRPrincipalViewController.m
//  TableView-Completo
//
//  Created by Luís Resende on 09/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "MJRPrincipalViewController.h"

@interface MJRPrincipalViewController ()
{
    UIRefreshControl *refresh;
}

@end

@implementation MJRPrincipalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Coloca titulo na view em cima da tableview
    self.title = @"Minha tableView";
    
    //adicionando o botao edit na navigation controller
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //adicionando o botao de add
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(alertNovoObjeto)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    //Prenchendo o array
    self.numbers = [[NSMutableArray alloc]initWithObjects:@"Um", @"Dois", @"Três",@"Quatro",@"Cinco",@"Seis",@"Sete",@"Oito",@"Nove",@"Dez", nil];
    
    self.imagens = [[NSMutableArray alloc]initWithObjects:@"1.png", @"2.png", @"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png", nil];
    
    refresh = [[UIRefreshControl alloc]init];
    [refresh addTarget:self action:@selector(alertNovoObjeto) forControlEvents:UIControlEventValueChanged];
    [self.myTableView addSubview:refresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numbers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndetifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    }
    
    cell.textLabel.text = [self.numbers objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:[[NSString alloc]initWithFormat:@"%ld",(long)indexPath.row+1]];
    
    return cell;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    [self.myTableView setEditing:editing animated:animated];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPat{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        //removendo o dado do nsmutablearray
        [self.numbers removeObjectAtIndex:indexPath.row];
        
        //removendo o dado da imagem no mutablearray
        [self.imagens removeObjectAtIndex:indexPath.row];
        
        //removendo do nosso table view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) alertNovoObjeto {
    
    //Mostrar a mensagem
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Digite o número" message:@"" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Ok", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    [refresh endRefreshing];
    [self.myTableView reloadData];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1){
        
        //pegando o texto
        NSString *texto = [alertView textFieldAtIndex:0].text;
        
        //boas praticas- erifica se existe
        if(!self.numbers){
            self.numbers = [[NSMutableArray alloc]init];
        }
        
        
        //insere o valor do objeto no array
        [self.numbers insertObject:texto atIndex:0];
        
        //gerar um index para adicionar na tableview
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [self.myTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //[self alertNovoObjeto];
}

@end

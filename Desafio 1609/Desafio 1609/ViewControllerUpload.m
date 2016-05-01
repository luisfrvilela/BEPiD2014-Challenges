//
//  ViewControllerUpload.m
//  Desafio 1609
//
//  Created by Eduardo Alves on 17/09/14.
//  Copyright (c) 2014 Eduardo, Marco, Wgleyberton. All rights reserved.
//

#import "ViewControllerUpload.h"

@interface UIViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblProcessado;

@end

@implementation UIViewControllerUpload

- (IBAction)pushPick:(id)sender {
    UIImagePickerController *imagem = [[UIImagePickerController alloc]init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagem.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
        imagem.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    imagem.allowsEditing = YES;
    imagem.delegate = self;
    
    [self presentViewController:imagem animated:YES completion:nil];
    

}
- (IBAction)pushUpload:(id)sender {
    NSData *imageData = UIImageJPEGRepresentation(self.imageView.image, 90);
    NSString *urlString = @"http://localhost:8888/upload.php";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];

    NSString *boundary = @"----------------------2982192"; //                 <-------------------- COMPLETAR O BOUNDARY
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"userfile\" ; filename=\".jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(returnString);
    
    self.lblProcessado.text = @"Imagem Enviada.";
    self.lblProcessado.hidden = FALSE;
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissModalViewControllerAnimated:YES];
    //imageView.image = picker;
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.lblProcessado.text=@"";
    self.lblProcessado.hidden = TRUE;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
    
    self.lblProcessado.text=@"";
    self.lblProcessado.hidden=TRUE;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

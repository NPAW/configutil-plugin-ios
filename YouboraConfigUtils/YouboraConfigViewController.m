////
////  YouboraConfigViewController.m
////  AVPlayerAdapterExample
////
////  Created by Joan on 27/04/2017.
////  Copyright © 2017 NPAW. All rights reserved.
////
//
//#import "YouboraConfigViewController.h"
//#import <YouboraLib/YouboraLib.h>
//#import "YouboraConfigManager.h"
//
//@interface YouboraConfigViewController ()
//
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (strong, nonatomic) IBOutlet UIView *contentView;
//
//@property (weak, nonatomic) IBOutlet UISwitch *switchValueEnabled;
//@property (weak, nonatomic) IBOutlet UISwitch *switchValueHttps;
//@property (weak, nonatomic) IBOutlet UISwitch *switchValueParseHls;
//@property (weak, nonatomic) IBOutlet UISwitch *switchValueParseCdnNode;
//@property (weak, nonatomic) IBOutlet UISwitch *switchValueContentIsLive;
//
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledHost;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledAccountCode;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledUsername;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledParseCdnNameHeader;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledNetworkIP;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledNetworkISP;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledNetworkConnectionType;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledDeviceCode;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledContentResource;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledContentIsLive;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledContentTitle;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledContentTitle2;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledContentDuration;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledContentTransactionCode;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledBitrate;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledThroughput;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledRendition;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledCdn;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledFps;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam1;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam2;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam3;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam4;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam5;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam6;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam7;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam8;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam9;
//@property (weak, nonatomic) IBOutlet UISwitch *switchEnabledExtraparam10;
//
//
//@property (weak, nonatomic) IBOutlet UITextField *textHost;
//@property (weak, nonatomic) IBOutlet UITextField *textAccountCode;
//@property (weak, nonatomic) IBOutlet UITextField *textUsername;
//@property (weak, nonatomic) IBOutlet UITextField *textParseCdnNameHeader;
//@property (weak, nonatomic) IBOutlet UITextField *textNetworkIP;
//@property (weak, nonatomic) IBOutlet UITextField *textNetworkISP;
//@property (weak, nonatomic) IBOutlet UITextField *textNetworkConnectionType;
//@property (weak, nonatomic) IBOutlet UITextField *textDeviceCode;
//@property (weak, nonatomic) IBOutlet UITextField *textContentResource;
//@property (weak, nonatomic) IBOutlet UITextField *textContentTitle;
//@property (weak, nonatomic) IBOutlet UITextField *textContentTitle2;
//@property (weak, nonatomic) IBOutlet UITextField *textContentDuration;
//@property (weak, nonatomic) IBOutlet UITextField *textContentTransactionCode;
//@property (weak, nonatomic) IBOutlet UITextField *textBitrate;
//@property (weak, nonatomic) IBOutlet UITextField *textThroughput;
//@property (weak, nonatomic) IBOutlet UITextField *textRendition;
//@property (weak, nonatomic) IBOutlet UITextField *textCdn;
//@property (weak, nonatomic) IBOutlet UITextField *textFps;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam1;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam2;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam3;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam4;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam5;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam6;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam7;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam8;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam9;
//@property (weak, nonatomic) IBOutlet UITextField *textExtraparam10;
//
//@end
//
//@implementation YouboraConfigViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.navigationItem.title = @"Youbora Settings";
//
//    [[NSBundle bundleForClass:[self class]] loadNibNamed:@"YouboraConfigViewController" owner:self options:nil];
//
//    [self.scrollView addSubview:self.contentView];
//    
//    YBOptions * options = [YouboraConfigManager getOptions];
//    
//    NSDictionary *dict = options.toDictionary;
//    
//    [self populateUIWithOptions:options];
//}
//
//- (void) populateUIWithOptions:(YBOptions *) options {
//    
//    self.switchValueEnabled.on = options.enabled;
//    self.switchValueHttps.on = options.httpSecure;
//    self.switchValueParseHls.on = options.parseHls;
//    self.switchValueParseCdnNode.on = options.parseCdnNode;
//    
//    NSValue * val = options.contentIsLive;
//    self.switchEnabledContentIsLive.on = val != nil;
//    self.switchValueContentIsLive.enabled = val != nil;
//    self.switchValueContentIsLive.on = val != nil? [val isEqualToValue:@YES] : NO;
//    
//    [self setSwitchAndTextFieldForValue:options.host uiswitch:self.switchEnabledHost textField:self.textHost];
//    [self setSwitchAndTextFieldForValue:options.accountCode uiswitch:self.switchEnabledAccountCode textField:self.textAccountCode];
//    [self setSwitchAndTextFieldForValue:options.username uiswitch:self.switchEnabledUsername textField:self.textUsername];
//    [self setSwitchAndTextFieldForValue:options.parseCdnNameHeader uiswitch:self.switchEnabledParseCdnNameHeader textField:self.textParseCdnNameHeader];
//    [self setSwitchAndTextFieldForValue:options.networkIP uiswitch:self.switchEnabledNetworkIP textField:self.textNetworkIP];
//    [self setSwitchAndTextFieldForValue:options.networkIsp uiswitch:self.switchEnabledNetworkISP textField:self.textNetworkISP];
//    [self setSwitchAndTextFieldForValue:options.networkConnectionType uiswitch:self.switchEnabledNetworkConnectionType textField:self.textNetworkConnectionType];
//    [self setSwitchAndTextFieldForValue:options.deviceCode uiswitch:self.switchEnabledDeviceCode textField:self.textDeviceCode];
//    [self setSwitchAndTextFieldForValue:options.contentResource uiswitch:self.switchEnabledContentResource textField:self.textContentResource];
//    [self setSwitchAndTextFieldForValue:options.contentTitle uiswitch:self.switchEnabledContentTitle textField:self.textContentTitle];
//    [self setSwitchAndTextFieldForValue:options.contentTitle2 uiswitch:self.switchEnabledContentTitle2 textField:self.textContentTitle2];
//    [self setSwitchAndTextFieldForValue:options.contentDuration uiswitch:self.switchEnabledContentDuration textField:self.textContentDuration];
//    [self setSwitchAndTextFieldForValue:options.contentTransactionCode uiswitch:self.switchEnabledContentTransactionCode textField:self.textContentTransactionCode];
//    [self setSwitchAndTextFieldForValue:options.contentBitrate uiswitch:self.switchEnabledBitrate textField:self.textBitrate];
//    [self setSwitchAndTextFieldForValue:options.contentThroughput uiswitch:self.switchEnabledThroughput textField:self.textThroughput];
//    [self setSwitchAndTextFieldForValue:options.contentRendition uiswitch:self.switchEnabledRendition textField:self.textRendition];
//    [self setSwitchAndTextFieldForValue:options.contentCdn uiswitch:self.switchEnabledCdn textField:self.textCdn];
//    [self setSwitchAndTextFieldForValue:options.contentFps uiswitch:self.switchEnabledFps textField:self.textFps];
//    [self setSwitchAndTextFieldForValue:options.extraparam1 uiswitch:self.switchEnabledExtraparam1 textField:self.textExtraparam1];
//    [self setSwitchAndTextFieldForValue:options.extraparam2 uiswitch:self.switchEnabledExtraparam2 textField:self.textExtraparam2];
//    [self setSwitchAndTextFieldForValue:options.extraparam3 uiswitch:self.switchEnabledExtraparam3 textField:self.textExtraparam3];
//    [self setSwitchAndTextFieldForValue:options.extraparam4 uiswitch:self.switchEnabledExtraparam4 textField:self.textExtraparam4];
//    [self setSwitchAndTextFieldForValue:options.extraparam5 uiswitch:self.switchEnabledExtraparam5 textField:self.textExtraparam5];
//    [self setSwitchAndTextFieldForValue:options.extraparam6 uiswitch:self.switchEnabledExtraparam6 textField:self.textExtraparam6];
//    [self setSwitchAndTextFieldForValue:options.extraparam7 uiswitch:self.switchEnabledExtraparam7 textField:self.textExtraparam7];
//    [self setSwitchAndTextFieldForValue:options.extraparam8 uiswitch:self.switchEnabledExtraparam8 textField:self.textExtraparam8];
//    [self setSwitchAndTextFieldForValue:options.extraparam9 uiswitch:self.switchEnabledExtraparam9 textField:self.textExtraparam9];
//    [self setSwitchAndTextFieldForValue:options.extraparam10 uiswitch:self.switchEnabledExtraparam10 textField:self.textExtraparam10];
//}
//
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    self.contentView.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.contentView.frame.size.height);
//    self.scrollView.contentSize = self.contentView.frame.size;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [YouboraConfigManager save];
//    [super viewWillDisappear:animated];
//}
//
//- (void) updateUI {
//    
//    // Update Text fields status depending on the switches
//    self.textHost.enabled = self.switchEnabledHost.on;
//    self.textAccountCode.enabled = self.switchEnabledAccountCode.on;
//    self.textUsername.enabled = self.switchEnabledUsername.on;
//    self.textParseCdnNameHeader.enabled = self.switchEnabledParseCdnNameHeader.on;
//    self.textNetworkIP.enabled = self.switchEnabledNetworkIP.on;
//    self.textNetworkISP.enabled = self.switchEnabledNetworkISP.on;
//    self.textNetworkConnectionType.enabled = self.switchEnabledNetworkConnectionType.on;
//    self.textDeviceCode.enabled = self.switchEnabledDeviceCode.on;
//    self.textContentResource.enabled = self.switchEnabledContentResource.on;
//    
//    self.switchValueContentIsLive.enabled = self.switchEnabledContentIsLive.on;
//    
//    self.textContentTitle.enabled = self.switchEnabledContentTitle.on;
//    self.textContentTitle2.enabled = self.switchEnabledContentTitle2.on;
//    self.textContentDuration.enabled = self.switchEnabledContentDuration.on;
//    self.textContentTransactionCode.enabled = self.switchEnabledContentTransactionCode.on;
//    self.textBitrate.enabled = self.switchEnabledBitrate.on;
//    self.textThroughput.enabled = self.switchEnabledThroughput.on;
//    self.textRendition.enabled = self.switchEnabledRendition.on;
//    self.textCdn.enabled = self.switchEnabledCdn.on;
//    self.textFps.enabled = self.switchEnabledFps.on;
//    self.textExtraparam1.enabled = self.switchEnabledExtraparam1.on;
//    self.textExtraparam2.enabled = self.switchEnabledExtraparam2.on;
//    self.textExtraparam3.enabled = self.switchEnabledExtraparam3.on;
//    self.textExtraparam4.enabled = self.switchEnabledExtraparam4.on;
//    self.textExtraparam5.enabled = self.switchEnabledExtraparam5.on;
//    self.textExtraparam6.enabled = self.switchEnabledExtraparam6.on;
//    self.textExtraparam7.enabled = self.switchEnabledExtraparam7.on;
//    self.textExtraparam8.enabled = self.switchEnabledExtraparam8.on;
//    self.textExtraparam9.enabled = self.switchEnabledExtraparam9.on;
//    self.textExtraparam10.enabled = self.switchEnabledExtraparam10.on;
//}
//
//- (void) updateOptions {
//    YBOptions * options = [YouboraConfigManager getOptions];
//    
//    // UI -> Options
//    
//    // bool
//    options.enabled = self.switchValueEnabled.on;
//    options.httpSecure = self.switchValueHttps.on;
//    options.parseHls = self.switchValueParseHls.on;
//    options.parseCdnNode = self.switchValueParseCdnNode.on;
//
//    // NSValue (Boolean)
//    options.contentIsLive = self.switchEnabledContentIsLive.on? @(self.switchValueContentIsLive.on) : @NO;
//    
//    // NSString
//    options.host = self.switchEnabledHost.on ? self.textHost.text : nil;
//    options.accountCode = self.switchEnabledAccountCode.on ? self.textAccountCode.text : nil;
//    options.username = self.switchEnabledUsername.on ? self.textUsername.text : nil;
//    options.parseCdnNameHeader = self.switchEnabledParseCdnNameHeader.on ? self.textParseCdnNameHeader.text : nil;
//    options.networkIP = self.switchEnabledNetworkIP.on ? self.textNetworkIP.text : nil;
//    options.networkIsp = self.switchEnabledNetworkISP.on ? self.textNetworkISP.text : nil;
//    options.networkConnectionType = self.switchEnabledNetworkConnectionType.on ? self.textNetworkConnectionType.text : nil;
//    options.deviceCode = self.switchEnabledDeviceCode.on ? self.textDeviceCode.text : nil;
//    options.contentResource = self.switchEnabledContentResource.on ? self.textContentResource.text : nil;
//    options.contentTitle = self.switchEnabledContentTitle.on ? self.textContentTitle.text : nil;
//    options.contentTitle2 = self.switchEnabledContentTitle2.on ? self.textContentTitle2.text : nil;
//    options.contentTransactionCode = self.switchEnabledContentTransactionCode.on ? self.textContentTransactionCode.text : nil;
//    options.contentRendition = self.switchEnabledRendition.on ? self.textRendition.text : nil;
//    options.contentCdn = self.switchEnabledCdn.on ? self.textCdn.text : nil;
//    options.extraparam1 = self.switchEnabledExtraparam1.on ? self.textExtraparam1.text : nil;
//    options.extraparam2 = self.switchEnabledExtraparam2.on ? self.textExtraparam2.text : nil;
//    options.extraparam3 = self.switchEnabledExtraparam3.on ? self.textExtraparam3.text : nil;
//    options.extraparam4 = self.switchEnabledExtraparam4.on ? self.textExtraparam4.text : nil;
//    options.extraparam5 = self.switchEnabledExtraparam5.on ? self.textExtraparam5.text : nil;
//    options.extraparam6 = self.switchEnabledExtraparam6.on ? self.textExtraparam6.text : nil;
//    options.extraparam7 = self.switchEnabledExtraparam7.on ? self.textExtraparam7.text : nil;
//    options.extraparam8 = self.switchEnabledExtraparam8.on ? self.textExtraparam8.text : nil;
//    options.extraparam9 = self.switchEnabledExtraparam9.on ? self.textExtraparam9.text : nil;
//    options.extraparam10 = self.switchEnabledExtraparam10.on ? self.textExtraparam10.text : nil;
//
//    // NSNumber
//    options.contentDuration = self.switchEnabledContentDuration.on ? @(self.textContentDuration.text.doubleValue) : nil;
//    options.contentBitrate = self.switchEnabledBitrate.on ? @(self.textBitrate.text.doubleValue) : nil;
//    options.contentThroughput = self.switchEnabledThroughput.on ? @(self.textThroughput.text.doubleValue) : nil;
//    options.contentFps = self.switchEnabledFps.on ? @(self.textFps.text.doubleValue) : nil;
//}
//
//- (IBAction)switchEnabledValueChanged:(UISwitch *)sender {
//    [self updateUI];
//    [self updateOptions];
//}
//
//- (IBAction)switchValueValueChanged:(UISwitch *)sender {
//    [self updateUI];
//    [self updateOptions];
//}
//
//- (IBAction)textEditingChanged:(UITextField *)sender {
//    NSLog(@"Text changed: %@", sender.text);
//    [self updateOptions];
//}
//
//- (IBAction)resetYouboraClicked:(id)sender {
//
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Restore defaults"
//                                                                   message:@"Do you want to restore the default Youbora config?"
//                                                            preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:[UIAlertAction actionWithTitle:@"Restore" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        [YouboraConfigManager reset];
//        [self populateUIWithOptions:[YouboraConfigManager getOptions]];
//    }]];
//    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
//    
//    [self presentViewController:alert animated:YES completion:nil];
//    
//}
//
//- (void) setSwitchAndTextFieldForValue:(NSObject *) value uiswitch:(UISwitch *) sw textField:(UITextField *) textField {
//    NSString * strValue = nil;
//    if (value != nil) {
//        strValue = [NSString stringWithFormat:@"%@", value];
//    }
//    
//    sw.on = strValue != nil;
//    textField.enabled = strValue != nil;
//    textField.text = strValue;
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end

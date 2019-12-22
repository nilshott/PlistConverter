//
//  MainWindowController.h
//  Plist Converter
//
//  Created by Danilo Campos on 3/30/09.
//  Copyright 2009 Danilo Campos. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSWindowController {
	
	IBOutlet NSTextField *pathInputField;
	IBOutlet NSButton *executeButton;
	
	NSURL *pathToFile;
	NSString *pathAsString;
}

@property (nonatomic, retain) NSString *pathAsString;

- (IBAction)executeConversion:(id)sender;

@end


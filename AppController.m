//
//  MainWindowController.m
//  Plist Converter
//
//  Created by Danilo Campos on 3/30/09.
//  Copyright 2009 Danilo Campos. All rights reserved.
//

#import "AppController.h"
#import "parseCSV.h"

@implementation AppController

@synthesize pathAsString;

- (IBAction)executeConversion:(id)sender
{
	
//	NSLog(@"Converting %@",pathAsString);
	
	
	CSVParser *parser = [CSVParser new];
	[parser openFileWithPath:pathAsString];
	NSMutableArray *csvContent = [parser parseFile];
	[parser closeFile];
	
	if (pathAsString != nil)
	{
		
		NSArray *keyArray = [csvContent objectAtIndex:0];
		
		NSMutableArray *plistOutputArray = [NSMutableArray array];
		
		NSInteger i = 0;
		
		for (NSArray *array in csvContent)
		{
			
			
			
			NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
			
			NSInteger keyNumber = 0;
			
			for (NSString *string in array)
			{
				
				[dictionary setObject:string forKey:[keyArray objectAtIndex:keyNumber]];
				
				keyNumber++;
				
			}
			
			if (i > 0)
			{
				[plistOutputArray addObject:dictionary];
			}
			
			i++;
			
		}
		
//		NSLog(@"Plist output array %@", plistOutputArray);
		
		NSMutableString *mutableString = [NSMutableString stringWithString:pathAsString];
		[mutableString replaceOccurrencesOfString:@".csv" withString:@".plist" options:0 range:NSMakeRange([mutableString length]-4, 4)];
		
		NSURL *url = [NSURL fileURLWithPath:mutableString];
		
	
		
//		NSLog(@"Write to URL %@",url);
		
		[plistOutputArray writeToURL:url atomically:YES];
		
	}
	
	
	
}


@end


/*
 
 File: MyDocument.m
 
 Abstract: A document class to manage a single track object.
 
 Version: 1.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by  Apple Inc. ("Apple") in consideration of your agreement to the following terms, and your use, installation, modification or redistribution of this Apple software constitutes acceptance of these terms.  If you do not agree with these terms, please do not use, install, modify or redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and subject to these terms, Apple grants you a personal, non-exclusive license, under Apple's copyrights in this original Apple software (the "Apple Software"), to use, reproduce, modify and redistribute the Apple Software, with or without modifications, in source and/or binary forms; provided that if you redistribute the Apple Software in its entirety and without modifications, you must retain this notice and the following text and disclaimers in all such redistributions of the Apple Software.  Neither the name, trademarks, service marks or logos of Apple Inc.  may be used to endorse or promote products derived from the Apple Software without specific prior written permission from Apple.  Except as expressly stated in this notice, no other rights or licenses, express or implied, are granted by Apple herein, including but not limited to any patent rights that may be infringed by your derivative works or by other works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2007 Apple Inc. All Rights Reserved.
 
 */


#import "MyDocument.h"
#import "Track.h"


@implementation MyDocument


/*
 NSDocument method to initialize the user interface
 */
- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}


/*
 action method to update the track's volume based on the float value of the sender
 */
- (IBAction)updateVolumeFrom:(id)sender
{
	float newVolume = [sender floatValue];
	[track setVolume:newVolume];
	// changed value of track's volume, need to update the user interface
	[self updateUserInterface];
}


/*
 updates the user interface to reflect the track's current volume
 */
- (void)updateUserInterface
{
	[slider setFloatValue:[track volume]];
	[textField setFloatValue:[track volume]];
}


/*
 sets track's volumeto 0
 */
- (IBAction)muteTrack:(id)sender
{
	[track setVolume:0.0];
	// changed value of track's volume, need to update the user interface
	[self updateUserInterface];
}


#pragma mark ----- methods common to all implementations -----

/*
 * These methods are the same for all implementations
 */

/*
 standard init method
 creates an instance of Track and sets its volume to 5.0
 */
- init
{
	if (self = [super init])
	{
		track = [[Track alloc] init];
		[track setVolume:5.0];
	}
	return self;	
}

/*
 NSDocument method to return the name of the nib file for the document
 */
- (NSString *)windowNibName
{
    return @"MyDocument";
}

/*
 accessor methods for track
 */
- (Track *)track
{
    return [[track retain] autorelease];
}

- (void)setTrack:(Track *)newTrack
{
    if (track != newTrack)
	{
        [track release];
        track = [newTrack retain];
    }
}


/*
 standard dealloc method -- releases track
 */
- (void)dealloc
{
    [track release], track = nil;
    [super dealloc];
}


@end

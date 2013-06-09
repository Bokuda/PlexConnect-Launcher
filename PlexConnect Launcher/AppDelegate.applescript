--
--  AppDelegate.applescript
--  PlexConnect Launcher
--
--  Created by zacharyowen on 6/8/13.
--  Copyright (c) 2013 Zachary Owen. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    
    on ButtonHandlerStartPlexConnect_(sender)
        tell application "Terminal"
            do shell script "/Users/zacharyowen/PlexConnect/PlexConnect.py" with administrator privileges
        end tell
    end ButtonHandlerStartPlexConnect_
	
    on applicationWillFinishLaunching_(aNotification)
    end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		tell application "Terminal"
            do shell script "ps -ef | grep python | grep -v grep | awk '{print$2}' | xargs kill" with administrator privileges
        end tell
        tell application "Terminal"
            do shell script "ps -ef | grep PlexConnect | grep -v grep | awk '{print$2}' | xargs kill" with administrator privileges
        end tell

        return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script
-- Abijr's config 
-- xmonad.hs
-- using xmonad darcs
-- happy hacking!
--
 
import XMonad
import Data.Monoid
import System.Exit
import System.IO
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Hooks.ScreenCorners

import XMonad.Hooks.FadeInactive
-- Data.List provides isPrefixOf isSuffixOf and isInfixOf
import Data.List 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.DynamicHooks
import XMonad.Hooks.ManageDocks
import XMonad.Layout.LayoutHints
import XMonad.Layout.PerWorkspace
import XMonad.ManageHook
import XMonad.Util.Run
import XMonad.Layout.Spacing
import XMonad.Actions.GridSelect
import XMonad.Hooks.ManageHelpers

import XMonad.Util.EZConfig
 
import XMonad.Util.Replace
import XMonad.Util.Run

import XMonad.Layout.ThreeColumns
 
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "xterm"
 
-- Width of the window border in pixels.
--
myBorderWidth   = 2
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod1Mask
 
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
--myNumlockMask   = mod2Mask
 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
myWorkspaces = ["www", "code", "docs", "all", "gimp"] ++ map show [6..7]
--
--myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]
 
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#242424"
myFocusedBorderColor = "#FFFFFF"
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
 
    -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenuz")

	-- launch thunar
	, ((modm, 				xK_w	 ), spawn "thunar")
 
	-- launch firefox
	, ((modm .|. shiftMask,	xK_w	 ), spawn "firefox")
 
	-- launch firefox
	, ((modm,				xK_e	 ), spawn "dmenucalc")
 
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "xterm -e ncmpcpp")
 
    -- close focused window 
    , ((modm .|. shiftMask, xK_c     ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
 
	-- Just Checking out Grid Select
	, ((modm, xK_g), goToSelected defaultGSConfig)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((mod4Mask,               xK_k     ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((mod4Mask,               xK_j     ), windows W.focusUp  )
 
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
	
	-- XF86 binded keycodes 
    , ((0,               0x1008FF2A), spawn "susp")
    , ((0,               0x1008ff14), spawn "mpc toggle")
    , ((0,               0x1008ff15), spawn "word")
    , ((0,               0x1008ff16), spawn "mpc prev")
    , ((0,               0x1008ff17), spawn "mpc next ")
    , ((0,               0x1008ff11), spawn "amixer -c 0 set Master 3- unmute")
    , ((0,               0x1008ff12), spawn "amixer -c 0 set Master toggle")
    , ((0,               0x1008ff13), spawn "amixer -c 0 set Master 3+ unmute")
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "startup -k" >> spawn "xmonad --recompile; xmonad --restart")
 
    -- Restart to openbok
    , ((modm .|. shiftMask, xK_o     ), spawn "startup -k" >> restart "/home/abijr/.scripts/obtoxmd" True)
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
   -- ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    --[((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
     --   | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      --  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
-- 

 
myLayout = spacing 3 $ onWorkspace "gimp" gimp $ tiled |||  Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
 
     -- The default number of windows in the master pane
     nmaster = 1
 
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
 
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100
 
     -- tiling algorithm for gimp
     gimp = ThreeColMid 1 (1/100) (75/100)
 
 
------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll .concat $
    [ [className =? "MPlayer"            --> doFloat]
    , [className =? "Gimp"               --> doF (W.shift "gimp")]
    , [className =? "Gimp-2.6"           --> doF (W.shift "gimp")]
    , [className =? "Gimp-2.6"           --> doF (W.shift "gimp")]
	, [role =? "gimp-image-window"       --> doF (W.shiftMaster)]
	, [role =? "gimp-toolbox"            --> doF (W.swapDown)]
	, [role =? "gimp-dock"               --> doF (W.swapDown)]
	, [isFullscreen                      --> doFullFloat] -- fullscreen flash and stuff
    , [className =? "WINWORD.EXE"        --> doF (W.shift "docs")]
    , [className =? "Gimp-2.7"           --> doFloat]
    , [fmap ("VLC" `isInfixOf`) title    --> doFloat]
    , [resource  =? "desktop_window"     --> doFloat]
    , [resource  =? "conky"              --> doIgnore]
    , [resource  =? "kdesktop"           --> doIgnore] 
	]
 
role = stringProperty "WM_WINDOW_ROLE" 
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Color, font and iconpath definitions:
--
myFont = "-xos4-terminus-medium-r-normal-*-14-*-*-*-c-*-iso10646-1"
myIconDir = "/home/abijr/.dzen"
myDzenFGColor = "#555555"
myDzenBGColor = "#1A1C21"
myNormalFGColor = "#aaaaaa"
myNormalBGColor = "#3F3F3F"
myFocusedFGColor = "#f0f0f0"
myFocusedBGColor = "#333333"
myUrgentFGColor = "#0099ff"
myUrgentBGColor = "#0077ff"
myIconFGColor = "#777777"
myIconBGColor = ""
mySeperatorColor = "#555555"
myGreen = "#688668"
myGray = "#3F3F3F"
myGreen2 = "#000000"
myBlue = "#27325E"
myRed = "#9A2323"
myYellow = "#D7CD93"
--Status bar with dzen 
 
--A function to delete output from dynamic log
del :: String -> String
del string = a
	where
		a = ""

 
myDzenPP :: PP 
myDzenPP = defaultPP
    { ppCurrent = wrap ("^bg(" ++ myGreen2 ++ ")^fg(" ++ myGreen ++ ")[^fg(" ++ myYellow ++ ")") ("^fg(" ++ myGreen ++ ")]^fg()^bg()") 
    , ppVisible = wrap ("^fg(" ++ myNormalFGColor ++ ")^bg(" ++ myFocusedBGColor ++ ")^p()^fg(" ++ myNormalFGColor ++ ")") "^fg()^bg()^p()"
    , ppHidden = wrap ("^fg()^bg()") "^fg()^bg()^p()" 
    , ppHiddenNoWindows = wrap ("^fg(" ++ myNormalBGColor ++ "") (")") 
    , ppUrgent = wrap ("^fg(" ++ myUrgentFGColor ++ ")^bg()^p()") "^fg()^bg()^p()" . \wsId -> if (':' `elem` wsId) then drop 2 wsId else wsId
    , ppSep = " "
    , ppWsSep = " "
    , ppTitle = del
    , ppLayout = wrap ("^bg(" ++ myGreen2 ++ ")^fg(" ++ myYellow ++ ") ") (" ^fg()^bg()") . 
        (\x -> case x of
        "Spacing 3 Tall" -> "[ |:]"
        "Spacing 3 Full" -> "[ ]"
        "Spacing 3 ThreeCol" -> "~A~" 
        _ -> x
        )
    }
myDzenPP2 :: PP 
myDzenPP2 = defaultPP
    { ppCurrent = del
    , ppVisible = del
    , ppHidden = del
    , ppHiddenNoWindows = del
    , ppUrgent = del
    , ppSep = " "
    , ppWsSep = " "
    , ppTitle = dzenColor ("" ++ myNormalFGColor ++ "") "" . wrap " " " "
    , ppLayout = del
    }

------------------------------------------------------------------------
-- 
fadeMostInactives :: Rational -> X ()
fadeMostInactives = fadeOutLogHook . fadeIf (isUnfocused <&&> noneOf qs)
  where noneOf = fmap not . foldr1 (<||>)
        qs = [isFullscreen, fmap ("layer" `isInfixOf`) className, className =? "Cinelerra", className =? "Gimp",className =? "Gimp-2.6", className =? "WINWORD.EXE", className =? "okular", className =? "Okular", className =? "Wine", className =? "Namoroka", className =? "Navigator"]


-- Log Hook
--
myLogHook :: Handle -> X ()
myLogHook h = do 
	dynamicLogWithPP myDzenPP { ppOutput = hPutStrLn h }
	fadeMostInactives 0xcccccccc
 
myLogHook2 :: Handle -> X ()
myLogHook2 h = do 
	dynamicLogWithPP myDzenPP2 { ppOutput = hPutStrLn h }


------------------------------------------------------------------------
-- Startup hook
 
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
	addScreenCorner SCLowerLeft (goToSelected defaultGSConfig )
------------------------------------------------------------------------
-- 
  
myEventHook e = do
	screenCornerEventHook e
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
		replace
		xmproc <- spawnPipe "dzen2 -e '' -x '0' -y '780' -h '20' -w '350' -ta l -fg '#aaaaaa' -bg '#1a1c21' -fn -*-terminus-medium-*-*-*-19-*-*-*-*-*-*-*"
		second <- spawnPipe "dzen2 -e '' -x '0' -y '760' -h '20' -w '350' -ta l -fg '#aaaaaa' -bg '#1a1c21' -fn -*-terminus-medium-*-*-*-18-*-*-*-*-*-*-*"
		-- Small script to start or kill conky, awn, and cairo compmgr.
		spawnPipe "startup -s"
		spawnPipe "avant-window-navigator"
		xmonad $ defaultConfig
			{
 
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will 
-- use the defaults defined in xmonad/XMonad/Config.hs
-- 
-- No need to modify this.
--
 
      -- simple stuff
		
    	manageHook = myManageHook <+> manageDocks
        , layoutHook = avoidStruts  $  myLayout
        , logHook = do
			myLogHook xmproc
			myLogHook2 second

        ,terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
		handleEventHook	   = myEventHook,
 
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings
 
     -- hooks, layouts
        , startupHook      = myStartupHook
    }


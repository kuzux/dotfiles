import qualified Data.Map as M

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.Gaps
import XMonad.Layout.LayoutHints
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed

myKeys conf@(XConfig{ XMonad.modMask = modm}) = M.fromList $ 
  [ ((modm, xK_p), spawn "rofi -show run"),
    ((modm, xK_Escape), spawn "/home/arddd/kbswitch.sh"),
    ((modm, xK_g), sendMessage $ ToggleGaps),

    -- scrot stuff
    ((modm, xK_v), spawn "scrot -e 'mv $f ~/caps/'"),
    ((modm .|. shiftMask, xK_v), spawn "sleep 0.2; scrot -s -e 'mv $f ~/caps/'"),

    -- controlling spotify
    ((modm, xK_s), spawn "/home/arddd/spotify-ctl.sh pause"), 
    ((modm, xK_a), spawn "/home/arddd/spotify-ctl.sh prev"), 
    ((modm, xK_d), spawn "/home/arddd/spotify-ctl.sh next"),

    -- moving workspaces
    ((modm, xK_Left),    prevWS),
    ((modm, xK_Right),   nextWS),
    ((modm .|. shiftMask, xK_Left),    shiftToPrev),
    ((modm .|. shiftMask, xK_Right),   shiftToNext) ]

layouts = (renamed [Replace "V"] . smartSpacing 10 . layoutHints  $ tiled) ||| 
    (renamed [Replace "H"] . smartSpacing 10 . layoutHints $ Mirror tiled) ||| 
    renamed [Replace "T"] simpleTabbed
  where
    tiled = ResizableTall nmaster delta ratio slaves
    nmaster = 1
    delta = 3/100
    ratio = 1/2
    slaves = []

myManageHook = composeAll 
  [ className =? "Steam" --> doFloat ]

myPP = xmobarPP {
  ppTitle = xmobarColor "green" "" . wrap "<" ">" . shorten 80
}

conf = def {
  modMask = mod4Mask,
  terminal = "urxvt",
  borderWidth = 2,
  focusFollowsMouse = True,
  manageHook = manageDocks <+> myManageHook <+> manageHook def,
  layoutHook = (gaps gapLengths) . avoidStruts . smartBorders $ layouts,
  logHook = dynamicLogWithPP myPP,
  keys = \c -> myKeys c `M.union` keys def c
}
  where
    gapLengths = [(U, 50), (D, 50), (L, 150), (R, 150)]

main = xmonad =<< xmobar conf


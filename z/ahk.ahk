

; space键
space:: send {Space}
;;space & 0::send {Space}
space & y::Reload
space & t::run, notepad++.exe "D:\Portable Programs\ahk\flAHK.ahk"

;编辑
space & a::send ^a
space & s::send ^s
space & z::send ^z
space & x::send ^x
space & c::send ^c
space & v::send ^v
space & Tab::send {Enter}
space & r::send {AppsKey}
space & q::send {Space}
space & n::send {Home}
space & m::send {End}
space & h::send {Backspace}
space & g::send {Del}
space & p::send ^!p
space & 1::send {!}
space & 2::send @
space & 3::send {#}
space & 4::send $
space & 5::send `%
space & 6::send {^}
space & 7::send {&}
space & 8::send *
space & 9::send (
space & 0::send )
space & ,::send <
space & .::send >
space & -::send _
space & =::send {+}
space & [::send {{}
space & ]::send {}}
space & `;::send {:}
Alt & f::send ^f

; 上下左右方向键
space & f::send {Down}
space & d::send {Up}
space & e::send {Right}
space & w::send {Left}
space & WheelUp::send {Up}
space & WheelDown::send {Down}

; 鼠标滚轮
space & j::send {WheelDown} 
space & k::send {WheelUp}



; 窗口控制
space & i::AltTab
Alt & WheelUp::AltTab
Alt & WheelDown::ShiftAltTab 
Alt & w::send #e 
Alt & Esc::send !{F4}
;Alt & d::send #d

; 去掉窗口标题
Alt & t::
if(_hasTitle = 0)
{
WinGetActiveTitle, g_ATitle
WinSet, Style, -0xC00000,%g_ATitle%
_hasTitle = 1
}
else{
WinGetActiveTitle, g_ATitle
WinSet, Style, +0xC00000,%g_ATitle%
_hasTitle = 0
}
Return

; 窗口置顶
#`::
MouseGetPos, , , id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
WinSet, AlwaysOnTop, , ahk_id %id%
Return

Alt & `:: ;窗口半透明
if (_checkBox = 0)
{
WinGetActiveTitle, g_ATitle
WinSet, Transparent, off, %g_ATitle%
_checkBox = 1

}
else 
{
WinGetActiveTitle, g_ATitle
WinSet, Transparent, 80, %g_ATitle%
_checkBox = 0

}
return


; 启动everything
Alt & e::
DetectHiddenWindows, on
IfWinNotExist ahk_class EVERYTHING
Run E:\Program Files\Everything\Everything.exe
ELSE
IfWinNotActive ahk_class EVERYTHING
WinActivate
ELSE
WinClose



; 程序相关改建


; Adoble pdf
#IfWinActive ahk_class AcrobatSDIWindow
Down::send {WheelDown}
Up::send {WheelUp}
j::send {WheelDown}
k::send {WheelUp}
space & j::send j
space & k::send k



;windows窗口
#ifWinActive ahk_class CabinetWClass
Esc::send !{F4}
space & q::
send !d
send ^c
run cmd.exe
WinWait ahk_class ConsoleWindowClass
send cd /D{Space}
WinActivate ahk_class ConsoleWindowClass
return

;chrome 窗口
;#IfWinActive ahk_class Chrome_WidgetWin_1
;Esc::send ^w


;记事本
#IfWinActive ahk_class Notepad
Esc::send !{F4}

;notepad++
#ifWinActive ahk_class Notepad++
Esc::send ^w
;Alt & w::send !+a


;winrar
#ifwinactive ahk_class WinRarWindow
Esc::send !{F4}

; cmd窗口
#IfWinActive ahk_class ConsoleWindowClass
Esc::send ^c exit {Enter}

#ifWinActive ahk_class PX_WINDOW_CLASS
Esc::send ^w

; HBuilder窗口
#ifWinActive ahk_class SWT_Window0
Alt & w::send {RButton} p {Enter}
space & r::send ^r
Esc::send ^w
#IfWinActive



OpenCmdInCurrent()
{
    WinGetText, full_path, A  ; This is required to get the full path of the file from the address bar

    ; Split on newline (`n)
    StringSplit, word_array, full_path, `n
    full_path = %word_array1%   ; Take the first element from the array

    ; Just in case - remove all carriage returns (`r)
    StringReplace, full_path, full_path, `r, , all  
    full_path := RegExReplace(full_path, "^Address: ", "") ;

    IfInString full_path, \
    {
        Run, cmd /K cd /D "%full_path%"
    }
    else
    {
        Run, cmd /K cd /D "C:\ "
    }
}
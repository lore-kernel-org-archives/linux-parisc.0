From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] J2240 mouse
Date: Sun, 22 Jan 2006 22:35:32 +0100
Message-ID: <200601222235.32555.deller@gmx.de>
References: <001601c61f9a$9314db00$3301a8c0@POGO>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <001601c61f9a$9314db00$3301a8c0@POGO>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Try this:

Section "InputDevice"
	Identifier	"Mouse"
	Driver		"mouse"
	Option		"CorePointer"
	Option		"Device"		"/dev/input/mice"
	Option		"Protocol"		"ImPS/2"
	Option		"ZAxisMapping"		"4 5"
EndSection

Helge

On Sunday 22 January 2006 22:26, Craig D. Lansing wrote:
> 
> I'm almost there with X from the console.  Gnome "looks" good.  I finally
> got the video settings where I want them, I just can't seem to get the mouse
> to work.  I've tried almost every option via `dpkg-reconfigure
> xserver-xfree86`, but no luck.  I rebooted into HP-UX and the mouse does
> work there, so it isn't a hardware problem.  HP-UX sees the mouse as "8/12/7
> Built-in Keyboard/Mouse ps2 ".  Hopefully some of the information below will
> show the error of my ways.  Any help would be greatly appreciated!!!!
> 
> /etc/X11/XF86Config-4:
> 
> Section "InputDevice"
> 
>         Identifier      "Configured Mouse"
> 
>         Driver          "mouse"
> 
>         Option          "CorePointer"
> 
>         Option          "Device"                "/dev/psaux"
> 
>         Option          "Protocol"              "PS/2"
> 
>         Option          "Emulate3Buttons"       "true"
> 
>         Option          "ZAxisMapping"          "4 5"
> 
> EndSection
> 
>  
> 
> ll /dev/psaux
> 
> crw-rw----  1 root root 10, 1 Jan 22 15:30 /dev/psaux
> 
>  
> 
>  
> 
> End of XFree86.0.log
> 
>  
> 
> (II) Keyboard "Generic Keyboard" handled by legacy driver
> 
> (**) Option "Protocol" "PS/2"
> 
> (**) Configured Mouse: Protocol: "PS/2"
> 
> (**) Option "CorePointer"
> 
> (**) Configured Mouse: Core Pointer
> 
> (**) Option "Device" "/dev/psaux"
> 
> (**) Option "Emulate3Buttons" "true"
> 
> (**) Configured Mouse: Emulate3Buttons, Emulate3Timeout: 50
> 
> (**) Option "ZAxisMapping" "4 5"
> 
> (**) Configured Mouse: ZAxisMapping: buttons 4 and 5
> 
> (**) Configured Mouse: Buttons: 5
> 
> (II) XINPUT: Adding extended input device "Configured Mouse" (type: MOUSE)
> 
> (II) Configured Mouse: ps2EnableDataReporting: succeeded
> 
> Could not init font path element unix/:7100, removing from list!
> 
> AUDIT: Sun Jan 22 16:09:07 2006: 3943 X: client 4 rejected from local host
> 
>  
> 
>  
> 
> howlin:/boot# grep -i mouse config-2.6.8-2-32-smp
> 
> CONFIG_INPUT_MOUSEDEV=y
> 
> CONFIG_INPUT_MOUSEDEV_PSAUX=y
> 
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> 
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
> 
> CONFIG_INPUT_MOUSEDEV_PSAUX_ENABLE=y
> 
> CONFIG_INPUT_MOUSE=y
> 
> CONFIG_MOUSE_PS2=m
> 
> CONFIG_MOUSE_SERIAL=m
> 
> CONFIG_MOUSE_INPORT=m
> 
> # CONFIG_MOUSE_ATIXL is not set
> 
> CONFIG_MOUSE_LOGIBM=m
> 
> CONFIG_MOUSE_PC110PAD=m
> 
> CONFIG_MOUSE_VSXXXAA=m
> 
> CONFIG_MOUSE_HIL=m
> 
> CONFIG_USB_MOUSE=m
> 
>  
> 
>  
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

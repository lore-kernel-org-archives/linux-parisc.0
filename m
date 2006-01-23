From: "Craig D. Lansing" <clansing@charter.net>
Subject: RE: [parisc-linux] J2240 mouse
Date: Sun, 22 Jan 2006 19:30:50 -0500
Message-ID: <002801c61fb4$43296b00$3301a8c0@POGO>
References: <20060122233459.GA16327@levanta.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: "'Helge Deller'" <deller@gmx.de>,
 <parisc-linux@lists.parisc-linux.org>
To: "'Richard Hirst'" <rhirst@levanta.com>
Return-Path: <clansing@charter.net>
In-Reply-To: <20060122233459.GA16327@levanta.com>
List-ID: <linux-parisc.vger.kernel.org>


I was not at the console, but I did the following from a telnet session...

howlin:~# modprobe psmouse
howlin:~#

A little later I noticed a message on the console...

Input: PS/2 Logitech Mouse on parisc8:12:8
Ts: Compaq touchscreen protocol output

All works now in X, even the important stuff like mahjongg.  Thanx for the
help!!!!!!!!!!!!!


Here's the list of what is now working:
perl 5.8.4
php 4.3.10
php 5.1.2 (installed from source)
PostgreSQL 8.1.2 (installed from source)
Apache 2.0 (inc. perl CGI, php4, and php5 w/ PostgreSQL 8.1.2)
MySQL (installed and daemons run, I have not created a database)
wu-ftp
telnet
ssh
X (finally, inc. GNOME on HP p1120 console, remote sessions),  No XDMCP.

I'm impressed.  I'm glad I didn't haul the "J" to the dump.


-----Original Message-----
From: Richard Hirst [mailto:rhirst@levanta.com] 
Sent: Sunday, January 22, 2006 6:35 PM
To: Craig D. Lansing
Cc: 'Helge Deller'; parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 mouse

Have you tried 'modprobe psmouse' ?

Richard

On Sun, Jan 22, 2006 at 04:58:16PM -0500, Craig D. Lansing wrote:
> I'm fairly sure I tried that one, but just to safe I tried again.  Still
> nothing when moving the mouse or using any of the 3 buttons.
> 
> Section "InputDevice"
>         Identifier      "Mouse"
>         Driver          "mouse"
>         Option          "CorePointer"
>         Option          "Device"                "/dev/input/mice"
>         Option          "Protocol"              "ImPS/2"
>         Option          "ZAxisMapping"          "4 5"
> EndSection
> 
> [snip]
> 
> Section "ServerLayout"
>         Identifier      "Default Layout"
>         Screen          "Default Screen"
>         InputDevice     "Generic Keyboard"
>         InputDevice     "Mouse"
> EndSection
> 
> 
> 
> -----Original Message-----
> From: Helge Deller [mailto:deller@gmx.de] 
> Sent: Sunday, January 22, 2006 4:36 PM
> To: parisc-linux@lists.parisc-linux.org
> Cc: Craig D. Lansing
> Subject: Re: [parisc-linux] J2240 mouse
> 
> Try this:
> 
> Section "InputDevice"
> 	Identifier	"Mouse"
> 	Driver		"mouse"
> 	Option		"CorePointer"
> 	Option		"Device"		"/dev/input/mice"
> 	Option		"Protocol"		"ImPS/2"
> 	Option		"ZAxisMapping"		"4 5"
> EndSection
> 
> Helge
> 
> On Sunday 22 January 2006 22:26, Craig D. Lansing wrote:
> > 
> > I'm almost there with X from the console.  Gnome "looks" good.  I
finally
> > got the video settings where I want them, I just can't seem to get the
> mouse
> > to work.  I've tried almost every option via `dpkg-reconfigure
> > xserver-xfree86`, but no luck.  I rebooted into HP-UX and the mouse does
> > work there, so it isn't a hardware problem.  HP-UX sees the mouse as
> "8/12/7
> > Built-in Keyboard/Mouse ps2 ".  Hopefully some of the information below
> will
> > show the error of my ways.  Any help would be greatly appreciated!!!!
> > 
> > /etc/X11/XF86Config-4:
> > 
> > Section "InputDevice"
> > 
> >         Identifier      "Configured Mouse"
> > 
> >         Driver          "mouse"
> > 
> >         Option          "CorePointer"
> > 
> >         Option          "Device"                "/dev/psaux"
> > 
> >         Option          "Protocol"              "PS/2"
> > 
> >         Option          "Emulate3Buttons"       "true"
> > 
> >         Option          "ZAxisMapping"          "4 5"
> > 
> > EndSection
> > 
> >  
> > 
> > ll /dev/psaux
> > 
> > crw-rw----  1 root root 10, 1 Jan 22 15:30 /dev/psaux
> > 
> >  
> > 
> >  
> > 
> > End of XFree86.0.log
> > 
> >  
> > 
> > (II) Keyboard "Generic Keyboard" handled by legacy driver
> > 
> > (**) Option "Protocol" "PS/2"
> > 
> > (**) Configured Mouse: Protocol: "PS/2"
> > 
> > (**) Option "CorePointer"
> > 
> > (**) Configured Mouse: Core Pointer
> > 
> > (**) Option "Device" "/dev/psaux"
> > 
> > (**) Option "Emulate3Buttons" "true"
> > 
> > (**) Configured Mouse: Emulate3Buttons, Emulate3Timeout: 50
> > 
> > (**) Option "ZAxisMapping" "4 5"
> > 
> > (**) Configured Mouse: ZAxisMapping: buttons 4 and 5
> > 
> > (**) Configured Mouse: Buttons: 5
> > 
> > (II) XINPUT: Adding extended input device "Configured Mouse" (type:
MOUSE)
> > 
> > (II) Configured Mouse: ps2EnableDataReporting: succeeded
> > 
> > Could not init font path element unix/:7100, removing from list!
> > 
> > AUDIT: Sun Jan 22 16:09:07 2006: 3943 X: client 4 rejected from local
host
> > 
> >  
> > 
> >  
> > 
> > howlin:/boot# grep -i mouse config-2.6.8-2-32-smp
> > 
> > CONFIG_INPUT_MOUSEDEV=y
> > 
> > CONFIG_INPUT_MOUSEDEV_PSAUX=y
> > 
> > CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> > 
> > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
> > 
> > CONFIG_INPUT_MOUSEDEV_PSAUX_ENABLE=y
> > 
> > CONFIG_INPUT_MOUSE=y
> > 
> > CONFIG_MOUSE_PS2=m
> > 
> > CONFIG_MOUSE_SERIAL=m
> > 
> > CONFIG_MOUSE_INPORT=m
> > 
> > # CONFIG_MOUSE_ATIXL is not set
> > 
> > CONFIG_MOUSE_LOGIBM=m
> > 
> > CONFIG_MOUSE_PC110PAD=m
> > 
> > CONFIG_MOUSE_VSXXXAA=m
> > 
> > CONFIG_MOUSE_HIL=m
> > 
> > CONFIG_USB_MOUSE=m
> > 
> >  
> > 
> >  
> > 
> > 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cactus.bheadley.org (d174.focal4.interaccess.com [207.208.139.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id A46DD482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Feb 2002 16:46:43 -0700 (MST)
Received: from earthlink.net (IDENT:mJMx3pthXYV7NEMEXJOBpdPCS6BmD3iD@localhost.localdomain [127.0.0.1])
	by cactus.bheadley.org (8.11.6/8.11.6) with ESMTP id g16NjwI15549
	for <parisc-linux@lists.parisc-linux.org>; Wed, 6 Feb 2002 17:46:04 -0600
Message-ID: <3C61C035.5010205@earthlink.net>
Date: Wed, 06 Feb 2002 17:45:57 -0600
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: XFree86 Question
References: <3C619C13.8293C241@cup.hp.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Gururaj Ananthateerta wrote:
> 
> 
> 
> I am facing simila problem and tried the fix suggested
> Rather, I don't know whether I have applied the fix xorrectly.
> Could anyone please explain how to fix this problem.
> 
> 
> Question
> ----------
> 
> And now, an X question :-)
> 
> I'm getting this on startup of the X server,
> 
>         FBIOPUT_VSCREENINFO: Invalid argument
> 
>         Fatal server error:
>         AddScreen/ScreenInit failed for driver 0
> 
> Any ideas? Ran the release note patch, and upgraded to 2.4.16-pa24 to no
> 
> avail. X server is rev 4.1.0-9.0.1.


The kernel when it boots up displays the colordepth and resolution that 
the frame buffer device will run at. The message scrolls away fast, but 
can be found in your /var/log/messages file.

Another way to get the same info is to run (as root),

	fbset -i

 From my machine, I get:

--
mode "1280x1024"
     geometry 1280 1024 1280 1024 32
     timings 0 0 0 0 0 0 0
     rgba 8/16,8/8,8/0,8/24
endmode

Frame buffer device information:
     Name        :
     Address     : 0xf5000000
     Size        : 8388608
     Type        : PACKED PIXELS
     Visual      : TRUECOLOR
     XPanStep    : 0
     YPanStep    : 0
     YWrapStep   : 0
     LineLength  : 8192
     Accelerator : No
--

This tells me that the framebuffer supports 1280x1024 resolution ONLY. 
If you look on the second line, the last number is 32, which is my 
colordepth (your mileage may vary; I have a C110). I forget where the 
explanation of how 32 bpp is really 24 bpp -- maybe in the X docs 
somewhere, but I knew that already. Here's how I converted that info 
into my XF86Config-4 file:

---
Section "Device"
         Identifier      "Generic Video Card"
         Driver          "fbdev"
         Option          "UseFBDev"              "true"
EndSection

Section "Monitor"
         Identifier      "Generic Monitor"
         HorizSync       30-100
         VertRefresh     50-160
         Option          "DPMS"
EndSection

Section "Screen"
         Identifier      "Default Screen"
         Device          "Generic Video Card"
         Monitor         "Generic Monitor"
         DefaultDepth    24
         SubSection "Display"
                 Depth           1
                 Modes           "1280x1024"
         EndSubSection
         SubSection "Display"
                 Depth           4
                 Modes           "1280x1024"
         EndSubSection
         SubSection "Display"
                 Depth           8
                 Modes           "1280x1024"
         EndSubSection
         SubSection "Display"
                 Depth           15
                 Modes           "1280x1024"
         EndSubSection
         SubSection "Display"
                 Depth           16
                 Modes           "1280x1024"
         EndSubSection
         SubSection "Display"
                 Depth           24
                 Modes           "1280x1024"
         EndSubSection
EndSection
---
Which tells X that my framebuffer supports colordepths from 1 to 32 
(actually 24), and for each, the video resolution is only 1280x1024 (no 
other resolutions supported. If you give it any other resolution(s), 
you'll get the terse FBIOPUT_VSCREENINFO error.

Now, what else? Ah, Gnome & Gtk. Those two, in conjunction with the X 
server and the kernel that came with 0.9.3, do not work. I forget the 
exact error message, but it had to do with saving private information...

Update the kernel. I forget which version had this fixed; I suspect that 
the kernel 'dselect' offers to download will do the trick. If not, get 
the latest sources and roll one.

Can't run X until this is done? (And you can't build a kernel without 
several xterms to entertain?) Well, if you are running Gnone, or a 
window manager that uses Gtk, you're temporarily doomed until you've 
fixed the kernel.

What to do in the meantime? Well, you need to look in the 
/etc/alternatives directory. There's a softlink there called 
'x-window-manager' that points to the window manager you want to run. If 
it's pointing to a Gtk-based on, you're doomed. Go get a copy of 
BlackBox, have the softlink point to that window manager.

While you are at it, check what /etc/alternatives/x-session-manager is 
pointing to. If you're set up for gnome, it points to 
/usr/bin/gnome-session. If kde, /usr/bin/kde2. If you are using a 
"simpler" window manager by itself (like blackbox, fvwm, twm, gwm), the 
link doesn't exist. If you have it, remove it.

Now you can start xinit, fire off a few xterms, get dselect running, get 
the kernel fixed, and have a good time.


-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net

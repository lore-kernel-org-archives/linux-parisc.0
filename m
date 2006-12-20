From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Wed, 20 Dec 2006 10:06:22 -0500 (EST)
Message-ID: <200612201506.kBKF6MvZ008771__17297.2336913974$1416624236$gmane$org@hiauly1.hia.nrc.ca>
References: <200612192045.46789.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200612192045.46789.deller@gmx.de> from "Helge Deller" at Dec 19, 2006 08:45:46 pm
List-ID: <linux-parisc.vger.kernel.org>

> The old patch didn't catched all syscalls and cases, e.g. all string-ops weren't handled.
> Maybe you could git-pull and try again ?

This is looking promising.  su works and I had a full build of GCC
last night without any hung java processes.  I still had one test
failure in the libstdc++-v3 testsuite

FAIL: 22_locale/time_get/get_date/wchar_t/4.cc execution test

which may be a kernel problem since the fail doesn't occur using
a 64-bit kernel.  The test also doesn't fail under hpux, so it's
not likely a compilation issue.  The problem is in setting a
date/time string.  Might have something to do with locale functions.

Also, X is broken again.  It seems the card is outputing at higher
scan rate than the card can handle after X starts (no problem
with penguin).  However, the rate shown in the log file seems fine:

(II) Setting vga for screen 0.
(**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
(==) FBDEV(0): Default visual is PseudoColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): hardware: stifb (video memory: 2048kB)
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0):  mode "1280x1024" ok
(II) FBDEV(0): checking modes against monitor...
(--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDEV(0):  Default mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0
kHz, 60.0 Hz
(II) FBDEV(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 1025 1028
 1066 +hsync +vsync

The monitor runs just fine at 64.0 kHz, 60 Hz.  The monitor says the
output mode of the VIS EG is about 90 kHz, 75 Hz.

Don't think this has anything to do with your patch since older kernels
have same problem.  However, thought you might have a suggestion as
to what's wrong.  Running unstable.

Thanks,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

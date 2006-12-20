From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Wed, 20 Dec 2006 22:37:45 +0100
Message-ID: <200612202237.46357.deller__11758.678922388$1416624237$gmane$org@gmx.de>
References: <200612201506.kBKF6MvZ008771@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612201506.kBKF6MvZ008771@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dave,

On Wednesday 20 December 2006 16:06, John David Anglin wrote:
> > The old patch didn't catched all syscalls and cases, e.g. all string-ops weren't handled.
> > Maybe you could git-pull and try again ?
> 
> This is looking promising.  su works and I had a full build of GCC
> last night without any hung java processes.  I still had one test
> failure in the libstdc++-v3 testsuite

That's great !

> FAIL: 22_locale/time_get/get_date/wchar_t/4.cc execution test
> 
> which may be a kernel problem since the fail doesn't occur using
> a 64-bit kernel.  The test also doesn't fail under hpux, so it's
> not likely a compilation issue.  The problem is in setting a
> date/time string.  Might have something to do with locale functions.

Can you provide an strace ?
 
> Also, X is broken again.  It seems the card is outputing at higher
> scan rate than the card can handle after X starts (no problem
> with penguin).  However, the rate shown in the log file seems fine:
> 
> (II) Setting vga for screen 0.
> (**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
> (==) FBDEV(0): Default visual is PseudoColor
> (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
> (II) FBDEV(0): hardware: stifb (video memory: 2048kB)
> (II) FBDEV(0): checking modes against framebuffer device...
> (II) FBDEV(0):  mode "1280x1024" ok
> (II) FBDEV(0): checking modes against monitor...
> (--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
> (**) FBDEV(0):  Default mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0
> kHz, 60.0 Hz
> (II) FBDEV(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 1025 1028
>  1066 +hsync +vsync
> 
> The monitor runs just fine at 64.0 kHz, 60 Hz.  The monitor says the
> output mode of the VIS EG is about 90 kHz, 75 Hz.
> 
> Don't think this has anything to do with your patch since older kernels
> have same problem.  However, thought you might have a suggestion as
> to what's wrong.  Running unstable.

That seems to be a generic problem in the Xorg FBDEV driver. I saw this problem as well.
It has nothing to do with monitor frequencies, since the FBDEV (Framebuffer device driver) can't change the monitor/graphics card frequencies anyway.
So I assume it's more a problem of FBDEV picking the wrong line length (which is always 2048 bytes).

I'll look into this when I find time, but compiling X is not my favorite task :-)

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

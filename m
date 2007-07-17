From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Tue, 17 Jul 2007 23:03:06 +0200
Message-ID: <200707172303.06515.deller__46177.9104815379$1416624415$gmane$org@gmx.de>
References: <8C996C28EAB2003-444-120B@WEBMAIL-MA12.sysops.aol.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org
To: kurtm22@netscape.net
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <8C996C28EAB2003-444-120B@WEBMAIL-MA12.sysops.aol.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Kurt,
CC: parisc-kernel development list

On Tuesday 17 July 2007, kurtm22@netscape.net wrote:
> You seem to be the maintainer for the stifb.c code for the Debian port
> to hppa. I have a 735/125 w/ 520MB mem and A1439A graphics.

The A1439A seems to be a "CRX24 = CRX+ (24-plane color)" graphics card acording to include/asm/grfioctl.h linux kernel header source file.

> I have been unable to boot the 2.6.18-4-parisc and 2.6.8-4-32 kernels.
> Before the system panics, 

Your problem looks similiar to this thread:
http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/024834.html
(or search for CRX on: http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/thread.html#24834)
What's the panic message / register dump ?

> there appears to be a line that says "switching to  
> STI color mode (I think).? 

What does it say exactly ?
There are two different strings which can be printed:
a) Console: switching to colour STI console 128x48
b) Console: switching to colour frame buffer device 128x48

The first (a) means it switches to text-only console (sticon), the second (b) is printed if the kernel switches to framebuffer mode (stifb).
Only the second one provides /dev/fb0 support and will allow you to use the X server.

> So what I am thinking is that there is something 
> up with accessing the hardware through the framebuffer.? 

Yes, might be.
You might want to try a more recent kernel (e.g. build yourself the original 2.6.22 kernel from kernel.org sources, it should build cleanly on hppa and no additional patches are needed).
Looking at the sources, it might be that the fb_memset() call in the function rattlerSetupPlanes()  [file: drivers/video/stifb.c] is wrong.
I sadly don't have the hardware to test, but if you compile a kernel, try to just delete this fb_memset() call. At least maybe it then maybe doesn't panic any more?

Sadly I don't have such a card myself to test.
Anyone wants to send me one ? :-)

> The system has been dist-upgraded to etch from sarge which
> may be why I can boot the 2.4.17-32 kernel but I cannot get X to start:
> -------------------------------------
> X Window System Version 7.1.1
> Release Date: 12 May 2006
> X Protocol Version 11, Revision 0, Release 7.1.1
> Build Operating System: UNKNOWN
> Current Operating System: Linux boss-429 2.4.17-32 #1 Sat Mar 16 17:09:00 MST 2002 parisc
> Build Date: 03 April 2007
> ??????? Before reporting problems, check http://wiki.x.org
> ??????? to make sure that you have the latest version.
> Module Loader present
> Markers: (--) probed, (**) from config file, (==) default setting,
> ??????? (++) from command line, (!!) notice, (II) informational,
> ??????? (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> (==) Log file: "/var/log/Xorg.0.log", Time: Tue Jul 17 15:44:00 2007
> (==) Using config file: "/etc/X11/xorg.conf"
> (EE) open /dev/fb0: No such device
> (EE) No devices detected.

Read above.
Probably sticon (which does not provide graphics mode) is active.

> This is what the device file looks like:
> /dev/fb0 = crw-rw---- 1 root video 29, 0 Oct? 3? 1999 /dev/fb0

That's ok.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

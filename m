From: kurtm22@netscape.net
Subject: Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Wed, 25 Jul 2007 14:23:45 -0400
Message-ID: <8C99D001206F8C3-1154-788__16545.3658126809$1416624418$gmane$org@webmail-dd01.sysops.aol.com>
References: <8C996C28EAB2003-444-120B@WEBMAIL-MA12.sysops.aol.com> <200707172303.06515.deller@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
  boundary="--------MB_8C99D001206F8C3_1154_F37_webmail-dd01.sysops.aol.com"
Cc: deller@gmx.de
To: parisc-linux@lists.parisc-linux.org
Return-Path: <kurtm22@netscape.net>
In-Reply-To: <200707172303.06515.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>


----------MB_8C99D001206F8C3_1154_F37_webmail-dd01.sysops.aol.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"


 Hi Helge,

I did what you suggested and built a new kernel from scratch using the 2.6.22
source tar.? I did not comment out the fb_memset() call in stifb.c
prior to the build so I could post the crash results - perhaps
it will provide more insight to what is going on:

sticon: Initializing sti text console
Console: switching to colour STI console 160x64
Backtrace:
??? [<1044e1b0>] stifb_init_fb+0x67c/0x928
??? [<1044e4c4>] stifb_init+0x68/0xf8
??? ? [<1043d4187>] kernel_init+0xfc/0x2c8
??? [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

kernel fault:? code=15? regs=10984200? (addr=f9000000)

.
.
.
.

I can post more of the dump if you need it.? I left the machine 
sitting there as i am writing down what I see on the screen.

--Kurt



 

-----Original Message-----
From: Helge Deller <deller@gmx.de>
To: kurtm22@netscape.net
Cc: parisc-linux@lists.parisc-linux.org
Sent: Tue, 17 Jul 2007 5:03 pm
Subject: Re: Boot problem with HPPA 735/125 w/ A1439A CRX










Hi Kurt,
CC: parisc-kernel development list

On Tuesday 17 July 2007, kurtm22@netscape.net wrote:
> You seem to be the maintainer for the stifb.c code for the Debian port
> to hppa. I have a 735/125 w/ 520MB mem and A1439A graphics.

The A1439A seems to be a "CRX24 = CRX+ (24-plane color)" graphics card acording 
to include/asm/grfioctl.h linux kernel header source file.

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

The first (a) means it switches to text-only console (sticon), the second (b) is 
printed if the kernel switches to framebuffer mode (stifb).
Only the second one provides /dev/fb0 support and will allow you to use the X 
server.

> So what I am thinking is that there is something 
> up with accessing the hardware through the framebuffer.? 

Yes, might be.
You might want to try a more recent kernel (e.g. build yourself the original 
2.6.22 kernel from kernel.org sources, it should build cleanly on hppa and no 
additional patches are needed).
Looking at the sources, it might be that the fb_memset() call in the function 
rattlerSetupPlanes()  [file: drivers/video/stifb.c] is wrong.
I sadly don't have the hardware to test, but if you compile a kernel, try to 
just delete this fb_memset() call. At least maybe it then maybe doesn't panic 
any more?

Sadly I don't have such a card myself to test.
Anyone wants to send me one ? :-)

> The system has been dist-upgraded to etch from sarge which
> may be why I can boot the 2.4.17-32 kernel but I cannot get X to start:
> -------------------------------------
> X Window System Version 7.1.1
> Release Date: 12 May 2006
> X Protocol Version 11, Revision 0, Release 7.1.1
> Build Operating System: UNKNOWN
> Current Operating System: Linux boss-429 2.4.17-32 #1 Sat Mar 16 17:09:00 MST 
2002 parisc
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



 


________________________________________________________________________
Check Out the new free AIM(R) Mail -- Unlimited storage and industry-leading spam and email virus protection.

----------MB_8C99D001206F8C3_1154_F37_webmail-dd01.sysops.aol.com
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="us-ascii"


<div> Hi Helge,<br>
<br>
I did what you suggested and built a new kernel from scratch using the 2.6.22<br>
source tar.&nbsp; I did not comment out the <tt><tt>fb_memset() call in stifb.c<br>
prior to the build so I could post the crash results - perhaps<br>
it will provide more insight to what is going on:<br>
<br>
sticon: Initializing sti text console<br>
Console: switching to colour STI console 160x64<br>
Backtrace:<br>
&nbsp;&nbsp;&nbsp; [&lt;1044e1b0&gt;] stifb_init_fb+0x67c/0x928<br>
&nbsp;&nbsp;&nbsp; </tt></tt><tt><tt>[&lt;1044e4c4&gt;] stifb_init+0x68/0xf8<span style="font-family: Verdana,Arial,Helvetica,sans-serif;"><br>
&nbsp;&nbsp;&nbsp; &nbsp; </span>[&lt;1043d4187&gt;] kernel_init+0xfc/0x2c8<br>
&nbsp;&nbsp;&nbsp; </tt></tt><tt><tt>[&lt;10109c5c&gt;] ret_from_kernel_thread+0x1c/0x24<br>
<br>
kernel fault:&nbsp; code=15&nbsp; regs=10984200&nbsp; (addr=f9000000)<br>
<br>
.<br>
.<br>
.<br>
.<br>
<br>
I can post more of the dump if you need it.&nbsp; I left the machine <br>
sitting there as i am writing down what I see on the screen.<br>
<br>
--Kurt<br>

</tt></tt></div>

<div> <br>
</div>
-----Original Message-----<br>
From: Helge Deller &lt;deller@gmx.de&gt;<br>
To: kurtm22@netscape.net<br>
Cc: parisc-linux@lists.parisc-linux.org<br>
Sent: Tue, 17 Jul 2007 5:03 pm<br>
Subject: Re: Boot problem with HPPA 735/125 w/ A1439A CRX<br>
<br>






<div id="AOLMsgPart_0_921e2ff8-35fe-4d3f-b7ab-8f92dc087900" style="margin: 0px; font-family: Tahoma,Verdana,Arial,Sans-Serif; font-size: 12px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">

<pre style="font-size: 9pt;"><tt>Hi Kurt,<br>
CC: parisc-kernel development list<br>
<br>
On Tuesday 17 July 2007, <a href="mailto:kurtm22@netscape.net">kurtm22@netscape.net</a> wrote:<br>
&gt; You seem to be the maintainer for the stifb.c code for the Debian port<br>
&gt; to hppa. I have a 735/125 w/ 520MB mem and A1439A graphics.<br>
<br>
The A1439A seems to be a "CRX24 = CRX+ (24-plane color)" graphics card acording <br>
to include/asm/grfioctl.h linux kernel header source file.<br>
<br>
&gt; I have been unable to boot the 2.6.18-4-parisc and 2.6.8-4-32 kernels.<br>
&gt; Before the system panics, <br>
<br>
Your problem looks similiar to this thread:<br>
<a href="http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/024834.html" target="_blank">http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/024834.html</a><br>
(or search for CRX on: <a href="http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/thread.html#24834" target="_blank">http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/thread.html#24834</a>)<br>
What's the panic message / register dump ?<br>
<br>
&gt; there appears to be a line that says "switching to  <br>
&gt; STI color mode (I think).? <br>
<br>
What does it say exactly ?<br>
There are two different strings which can be printed:<br>
a) Console: switching to colour STI console 128x48<br>
b) Console: switching to colour frame buffer device 128x48<br>
<br>
The first (a) means it switches to text-only console (sticon), the second (b) is <br>
printed if the kernel switches to framebuffer mode (stifb).<br>
Only the second one provides /dev/fb0 support and will allow you to use the X <br>
server.<br>
<br>
&gt; So what I am thinking is that there is something <br>
&gt; up with accessing the hardware through the framebuffer.? <br>
<br>
Yes, might be.<br>
You might want to try a more recent kernel (e.g. build yourself the original <br>
2.6.22 kernel from kernel.org sources, it should build cleanly on hppa and no <br>
additional patches are needed).<br>
Looking at the sources, it might be that the fb_memset() call in the function <br>
rattlerSetupPlanes()  [file: drivers/video/stifb.c] is wrong.<br>
I sadly don't have the hardware to test, but if you compile a kernel, try to <br>
just delete this fb_memset() call. At least maybe it then maybe doesn't panic <br>
any more?<br>
<br>
Sadly I don't have such a card myself to test.<br>
Anyone wants to send me one ? :-)<br>
<br>
&gt; The system has been dist-upgraded to etch from sarge which<br>
&gt; may be why I can boot the 2.4.17-32 kernel but I cannot get X to start:<br>
&gt; -------------------------------------<br>
&gt; X Window System Version 7.1.1<br>
&gt; Release Date: 12 May 2006<br>
&gt; X Protocol Version 11, Revision 0, Release 7.1.1<br>
&gt; Build Operating System: UNKNOWN<br>
&gt; Current Operating System: Linux boss-429 2.4.17-32 #1 Sat Mar 16 17:09:00 MST <br>
2002 parisc<br>
&gt; Build Date: 03 April 2007<br>
&gt; ??????? Before reporting problems, check <a href="http://wiki.x.org" target="_blank">http://wiki.x.org</a><br>
&gt; ??????? to make sure that you have the latest version.<br>
&gt; Module Loader present<br>
&gt; Markers: (--) probed, (**) from config file, (==) default setting,<br>
&gt; ??????? (++) from command line, (!!) notice, (II) informational,<br>
&gt; ??????? (WW) warning, (EE) error, (NI) not implemented, (??) unknown.<br>
&gt; (==) Log file: "/var/log/Xorg.0.log", Time: Tue Jul 17 15:44:00 2007<br>
&gt; (==) Using config file: "/etc/X11/xorg.conf"<br>
&gt; (EE) open /dev/fb0: No such device<br>
&gt; (EE) No devices detected.<br>
<br>
Read above.<br>
Probably sticon (which does not provide graphics mode) is active.<br>
<br>
&gt; This is what the device file looks like:<br>
&gt; /dev/fb0 = crw-rw---- 1 root video 29, 0 Oct? 3? 1999 /dev/fb0<br>
<br>
That's ok.<br>
<br>
Helge<br>
</tt></pre>
</div>
 <!-- end of AOLMsgPart_0_921e2ff8-35fe-4d3f-b7ab-8f92dc087900 -->

<div class="AOLPromoFooter">
<hr style="margin-top:10px;" />
<a href="http://pr.atwola.com/promoclk/100122638x1081283466x1074645346/aol?redir=http%3A%2F%2Fwww%2Eaim%2Ecom%2Ffun%2Fmail%2F" target="_blank"><b>Check Out the new free AIM(R) Mail</b></a> -- Unlimited storage and industry-leading spam and email virus protection.<br />
</div>

----------MB_8C99D001206F8C3_1154_F37_webmail-dd01.sysops.aol.com--

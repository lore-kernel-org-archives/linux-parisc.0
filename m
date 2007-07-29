From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 15:08:14 +0200
Message-ID: <200707291508.14810.deller__46768.0325768471$1416624421$gmane$org@gmx.de>
References: <8C996C28EAB2003-444-120B@WEBMAIL-MA12.sysops.aol.com>
	<200707172303.06515.deller@gmx.de>
	<8C99D001206F8C3-1154-788@webmail-dd01.sysops.aol.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org
To: kurtm22@netscape.net
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <8C99D001206F8C3-1154-788@webmail-dd01.sysops.aol.com>
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

On Wednesday 25 July 2007, kurtm22@netscape.net wrote:
> I did what you suggested and built a new kernel from scratch using the 2.6.22
> source tar.? I did not comment out the fb_memset() call in stifb.c
> prior to the build so I could post the crash results - perhaps
> it will provide more insight to what is going on:
> 
> sticon: Initializing sti text console
> Console: switching to colour STI console 160x64
> Backtrace:
> ??? [<1044e1b0>] stifb_init_fb+0x67c/0x928
> ??? [<1044e4c4>] stifb_init+0x68/0xf8
> ??? ? [<1043d4187>] kernel_init+0xfc/0x2c8
> ??? [<10109c5c>] ret_from_kernel_thread+0x1c/0x24
> 
> kernel fault:? code=15? regs=10984200? (addr=f9000000)
> 
> I can post more of the dump if you need it.? I left the machine 
> sitting there as i am writing down what I see on the screen.

code 15 means "Data TLB miss fault/Data page fault", so in fact it writes to memory it shouldn't, or in a way it shouldn't.
I still suspect the fb_memset() call.
Nevertheless, without more info, esp. where in the C-file/stifb_init_fb() function is 0x67c I can't do more.
Please read http://parisc-linux.org/faq/kernelbug-howto.html, esp. the section "More advanced bug reports".
It describes how to find the problematic code lines.
Alternatively, just comment out the fb_memset() call and try again.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

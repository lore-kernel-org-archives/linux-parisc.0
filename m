Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA18642
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Oct 2000 19:44:43 -0600
Date: 6 Oct 2000 01:45:43 -0000
Message-ID: <20001006014543.5219.qmail@mailserv2.iuinc.com>
Received: from y18626 ([10.108.21.26]) by smtp.huawei.com
          (Netscape Messaging Server 4.15) with SMTP id G1ZJ3G01.R08 for
          <parisc-linux@thepuffingroup.com>; Fri, 6 Oct 2000 09:35:40 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: parisc-linux@thepuffingroup.com
From: yuqian <yuqian@huawei.com>
Subject: Re: [parisc-linux] bug report on Sym53C895a or config error? 
List-ID: <linux-parisc.vger.kernel.org>

At 09:40 00-10-5 -0700, you wrote:
>The B2000 isn't really supported yet. The piece that's missing
>support is the SuckyIO (superio from NCR) chip. SuckyIO provides
>USB, IDE, Floppy, Serial port, etc.
>I'm using an add-on serial card as my "console" in a C3000.
>The built-in Serial port 1 provides output until linux switches
>from PDC console to serial console.
>Once SuckyIO support is in place, the add-on serial card won't
>be needed.
:-(
But if I only use net-access, maybe it work well?

>No one has taken ownership of HPUX XC builds since building
>on i686-linux is pretty fast. Did I hear you volunteer? :^)
Oh, I am glad to be a volunteer. For my i686PC must in M$ Window
for working, the available workbench is B2000. (My manager don't
care the OS is HP-UX or Linux but only cares it work or not :-)

Another question is: why not build FDISK/PALO/E2FScp for HP-UX?
because all HP box with HP-UX's install/recover CD, so if has 
fdisk/palo/e2fscp program running on HP-UX, the work becames so 
simple that install Linux onto HP box.

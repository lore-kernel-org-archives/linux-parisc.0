Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 433F54875
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 15:10:09 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo 2
Date: Mon, 12 Apr 2004 23:09:59 +0200
References: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200404122309.59140.deller@gmx.de>
Cc: "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Monday 12 April 2004 01:12, M. Grabert wrote:
> I'm about to purchase a Voodoo2 PCI graphics card since I saw some
> reports on the p-l list that it is working on Linux/PA-RISC.
> 
> I want to ask a couple of questions before I'm going to buy the graphics card:
> 
> - Helge prepared a patch to make the Voodoo working, and was incorporated
>   into the 2.4.19-pa18 kernel. It seems that it's still in 2.4.25-pa1.
>   But is the patch integrated into the mainstream 2.4?
>   I just took a brief look, and it appears so, is this correct?

No idea yet. I will check.

> - What about 2.6? I don't think that it's been forwarded to 2.6 yet?

It's in 2.6. I just tested my Vodoo2 in my c3k and it works.
Linux version 2.6.5-pa6 (root@p100) (gcc version 3.0.2 20010829 (prerelease)) #29 Mon Apr 12 22:46:03 CEST 2004
The 32-bit Kernel has started...
..
sstfb: Voodoo2 (revision 2) with ICS ICS5342 dac
sstfb: framebuffer at 0xfb400000, mapped to 0xfb400000, size 2MB
fb0: Voodoo2 frame buffer device at 0xfb400000
..

I can run the driver, graphics & Tux penguin comes up.
Running "fbset -a 1024x768-75" even gives me a nice big screen (although
I still don't like this "stty cols 64 rows 48" stuff yet...)

> - there is also the XFree86 Voodoo 1/2 driver from Alan Cox
> (http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022382.html)
> 
>   I suppose this driver also doesn't require the Voodoo2 card to be initialized,
>   and I think the advanage over using sstfb would be that it supports DGA
>   and some 2D acceleration.

At least it should (if it works :-))

>   Has anybody tested it (I couldn't even compile it)?

Neither me (I was lacking the XFree86 sources).

Helge

Return-Path: <vapier@gentoo.org>
Received: from wh0rd.org (wh0rd.org [212.13.198.204])
	by dsl2.external.hp.com (Postfix) with ESMTP id 619CA49F0
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 22:21:28 -0600 (MDT)
From: Mike Frysinger <vapier@gentoo.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo 2
Date: Tue, 13 Apr 2004 00:21:13 -0400
References: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
	<200404122309.59140.deller@gmx.de>
In-Reply-To: <200404122309.59140.deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200404130021.13209.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Monday 12 April 2004 05:09 pm, Helge Deller wrote:
> On Monday 12 April 2004 01:12, M. Grabert wrote:
> > - What about 2.6? I don't think that it's been forwarded to 2.6 yet?
>
> It's in 2.6. I just tested my Vodoo2 in my c3k and it works.
> Linux version 2.6.5-pa6 (root@p100) (gcc version 3.0.2 20010829
> (prerelease)) #29 Mon Apr 12 22:46:03 CEST 2004 The 32-bit Kernel has
> started...
> ..
> sstfb: Voodoo2 (revision 2) with ICS ICS5342 dac
> sstfb: framebuffer at 0xfb400000, mapped to 0xfb400000, size 2MB
> fb0: Voodoo2 frame buffer device at 0xfb400000
> ..

this interests me since i'd love to get something better than the 8bit vid 
card running in my C360 :)

i threw my obsidian voodoo2 into my box, but it did what it always has for 
me ... i build the sstfb as a module and when i modprobe it, the box locks 
up ... i builld it as a module because otherwise it'll lock at boot and i 
have to do a little manual rescue foo :)
-mike

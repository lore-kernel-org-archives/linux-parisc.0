Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1321A4CAE
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Apr 2004 19:08:04 -0600 (MDT)
Subject: Re: [parisc-linux] problems installing on k 200
From: Ryan Bradetich <rbradetich@uswest.net>
To: JKonrad@linotype.com
In-Reply-To: <OF340E924B.3CE17FA1-ONC1256E6F.0047D690@fonts.de>
References: <OF340E924B.3CE17FA1-ONC1256E6F.0047D690@fonts.de>
Content-Type: text/plain
Message-Id: <1081386451.29158.13.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Wed, 07 Apr 2004 19:07:31 -0600
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Jay,

There was a major number change for the MUX driver in the 2.4 kernels.

Check the major number for /dev/ttyB0, and either change it to 11 from
60 or 60 from 11.

Hope that helps!

- Ryan


On Wed, 2004-04-07 at 07:06, JKonrad@linotype.com wrote:
> Hi,
> 
> I have just tried to install my K 200 with this netinstall.iso:
> 
> palinux-2.4.21-pa6-20030718-netinst.iso
> 
> which is the newest. This image allows me to fully install the machine using the CD, but when I reboot my machine, it boots Linux, then hangs, telling me:
> 
> bin/sh: /dev/ttyB0: No such device
> 
> It looks like the kernel on the CD supports ttyB0, but the kernel the CD installs does not. How can that be, and how can I fix this?
> 
> Yours,
> 
> Jay
> 
> P.S.: The latest full image debian-30r1-hppa-binary-NONUS.iso won't even let me install, it hangs immediately, telling me my console isn't right, although I set it on ttyB0 with IPL.
> 
> PPS: the e-mail for bug reports does not seem to work anymore
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

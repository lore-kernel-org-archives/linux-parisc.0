Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B335482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 05:33:31 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3A1BFB00C; Fri,  6 Jul 2001 12:32:46 +0100 (BST)
Date: Fri, 6 Jul 2001 12:32:46 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Joachim Kress <jkress@unilog.de>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] palinux
Message-ID: <20010706123246.S23509@linuxcare.com>
References: <41E365428D7DD21192B700104BB0EA3D01526E1C@nttue01.tue.integrata.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <41E365428D7DD21192B700104BB0EA3D01526E1C@nttue01.tue.integrata.de>; from jkress@unilog.de on Thu, Jul 05, 2001 at 03:34:39PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 05, 2001 at 03:34:39PM +0200, Joachim Kress wrote:
> Hello,
> 
> I have a HP9000 / 712 Workstation.
> 
> Can You tell me a general working-step for installing palinux on my machine
> ( step 1,....., step 9, ......)?

First wait for ESIEE to post a working 0.9.1 ISO at http://mkhppa1.esiee.fr
(the one with md5sum 473c029b513472cccab1a4d6e2156619 is broken).
Hopefully they will get a new one up on Monday.

That is a gzipped image, so uncompress it before burning a CD.

Boot the CD - it should work fine on serial or graphical console.

> i am in confusion about your install-steps on your Website !
> 
> then i have many problems to make a bootable CDROM for my Workstation!

If you cannot boot the CD, you need to set up a bootp server and
boot the lifimage file on the CD.  The README on the CD should make
that clear.  Having booted the lifimage, you may then install from
the CD or from the network.  Please post again if you still have
problems.

(if you are going to do a network install anyway, the current 0.9.1
ISO is ok - you just can't boot from it).

Richard

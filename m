Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id A075C482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jul 2001 17:26:53 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9040BB00C; Thu, 19 Jul 2001 00:24:47 +0100 (BST)
Date: Thu, 19 Jul 2001 00:24:47 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>
Cc: marteaut@esiee.fr, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6-pa20 question about modules
Message-ID: <20010719002447.L30356@linuxcare.com>
References: <OF9ED32FBA.01646964-ONC1256A8D.0059C095@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <OF9ED32FBA.01646964-ONC1256A8D.0059C095@LocalDomain>; from jso@europay.com on Wed, Jul 18, 2001 at 06:33:21PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 18, 2001 at 06:33:21PM +0200, Joël Soete wrote:
> Hi Thomas,
> 
> With your tips
> (http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/013081.html)
> 
> the cvs 20010717 seems to works fine.
> (for b180 still have to unplug re-plug kdb)
> 
> I also try to recompile it with the .config file supply with palinux-0.9.2.
> It also seems to works well but modules are not install naturally.
> Can you explain me how to compile it and install it?

If I understand correctly, you are rebuilding the kernel, and want
kernel modules installed correctly under /lib/modules?


cd /usr/src/linux   (or wherever your source tree is)
# save your .config file, if you want it
make distclean
cp <config file> .config
make oldconfig
make dep
make
make modules
make modules_install
cp vmlinux /boot/vmlinux   (or whereever you want it to go)


Richard

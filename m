Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0483B482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 08:47:02 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1FD69B00C; Tue, 10 Jul 2001 15:45:49 +0100 (BST)
Date: Tue, 10 Jul 2001 15:45:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti console problem
Message-ID: <20010710154549.G23509@linuxcare.com>
References: <01070916084706.01035@flambe.ireste.fr> <20010710143749.E23509@linuxcare.com> <01071016061106.03565@flambe.ireste.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01071016061106.03565@flambe.ireste.fr>; from matthieu.lecorre@polytech.univ-nantes.fr on Tue, Jul 10, 2001 at 04:06:11PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 10, 2001 at 04:06:11PM +0200, Matthieu Le Corre wrote:
> in fact i've installed the 0.9 iso from the serial console
> first and second stage are correct !
> it boot correctly , but,
> at the end of booting process ,
> in sti console i get an "unable to open initial" console...
> and then a login appears in serial console !
> in fact all boot message appears un sti console execpt the boot prompt !
> I have check inittab and /dev/tty* files , they seems ok ! i don't understand 

For 0.9 we had different ISOs for 32 bit STI console and 32 bit
serial console.  It sounds as though you might have booted
the STI ISO, but used a serial console.  You get the login prompt
on the serial console, because that is where inittab starts a
getty.  Sounds like kernel printk output is displayed on the STI
console, sugests you are using the STI kernel.  Not sure about
this though...  Check the kernel boot params; do you have
console=tty0 or console=ttyS0?

You can try the 0.9.1 CD from http://mkhppa1.esiee.fr which should
auto-detect which console you used and route messages appropriately.


Richard
 

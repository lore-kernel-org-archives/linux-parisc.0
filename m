Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 121F7482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 20:48:35 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f7F2xuX00381
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 22:59:56 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f7F2n5J27927
	for parisc-linux@lists.parisc-linux.org; Tue, 14 Aug 2001 22:49:05 -0400
Date: Tue, 14 Aug 2001 22:49:05 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] LAN booting
Message-ID: <20010814224905.B26703@megatonmonkey.net>
References: <christian@familie-weerts.de> <200108132355.RAA14012@puffin.external.hp.com> <20010814135337.C345@familie-weerts.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010814135337.C345@familie-weerts.de>; from christian@familie-weerts.de on Tue, Aug 14, 2001 at 01:53:37PM +0000
List-ID: <linux-parisc.vger.kernel.org>

> I will try, but first i had to boot the machine over LAN, that's my problem
> at the moment.
> The RISC-Machine tells something like "Error: cannot load IPL, error
> detected. Bootprocess failed..."
> Perhaps you could help me, so i attach the bootptab and the dhcp-conf. Also
> attached are the daemon.log and output from tcpdump. Btw., gorilla is the
> server and mirage the client.
> I don't know what's wrong. 
> On the risc-machine i told him to boot from the lan.<hw-addr-server>.
> 

There should be nothing wrong with booting over the lan.

I did not receive any attachments with this email?

> Ack.

Cross compiling is really not all that bad 8)

> > Could you mount the 0.92 ISO on an x86-linux box and steal that kernel?
> > (there are probably several but just try the 32-bit ones.)
> I'll try. So, you mean i don't need the nfsroot-package named in Martin's
> HOWTO?

You can use it.

If you handroll a kernel with nfs-root parameters 
and setup an nfs share for you root, you
can boot without a disk onto the nfs-root.

What do you put on your nfs-root?:

- The unpacked nfsroot tarball
- sid baseplus tarball (under the debian directories).
- nothing (You get to check if the setup is okay, 
  though the kernel will panic when it doesn't find /)

Cheers,
Carlos.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92521482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:40:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ZzOo-0008IN-00; Thu, 23 Aug 2001 19:40:14 +0100
Date: Thu, 23 Aug 2001 19:40:14 +0100
From: Matthew Wilcox <willy@debian.org>
To: nick@snowman.net
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
Message-ID: <20010823194014.C27374@parcelfarce.linux.theplanet.co.uk>
References: <20010823181407.890B4482A@dsl2.external.hp.com> <Pine.LNX.4.21.0108231418490.16296-100000@ns>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0108231418490.16296-100000@ns>; from nick@snowman.net on Thu, Aug 23, 2001 at 02:21:10PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 23, 2001 at 02:21:10PM -0400, nick@snowman.net wrote:
> I'm not even getting that far.  I can't get the linux kernel to start
> booting, I always get errors along the lines of 
> Current command line:
> vmlinux HOME=/ TERM=vt100 root=/dev/nfs nfsroot=172.16.1.1:/mnt
> console=ttyS0
>  0: vmlinux
>  1: HOME=/
>  2: TERM=vt100
>  3: root=/dev/nfs
>  4: nfsroot=172.16.1.1:/mnt
>  5: console=ttyS0
> Edit which field?
> (or 'b' to boot with this command line)? b
> Kernel: partition 0 file vmlinux
> ERROR: Read from boot device failed (status = -3).
> byteio_read: seekread() returned -1 expected 2048

You're running into a known palo bug.  Sometimes when you're editing
entries it does this.  No-one's tracked down the cause yet (and it
is sporadic).

-- 
Revolutions do not require corporate support.

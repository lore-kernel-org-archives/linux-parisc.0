Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8F00482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Dec 2001 11:10:59 -0700 (MST)
Date: Fri, 14 Dec 2001 19:10:58 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: Peter Mottram <peter@petescaff.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Network bootproblem with 712/80
In-Reply-To: <Pine.LNX.4.42.0112141738450.29092-100000@r6.petescaff.com>
Message-ID: <Pine.LNX.4.42.0112141908140.1049-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

It looks like my problems are simply down to supplying the NCR overflow
fix parameter. Without that I can boot & install without problems.

Let's just hope I can get away with an install without too many problems &
then go for a fixed kernel later.

PeteM

On Fri, 14 Dec 2001, Peter Mottram wrote:

> I tried messing as per my previous mail but the net boot fails miserably.
> I get the following output in the console (some lines truncated beyond my
> control).....
>
> Edit which field?
> (or 'b' to boot with this command line)? b
>
> Command line for kernel: 'ncr53c8xx=burst:3 HOME=/ root=/dev/ram
> console=ttyS0 '
> Selected kernel: /vmlinux32 from partition 0
> Selected ramdisk: /ramdisk from partition 0
>
> ERROR: Read from boot device failed (status = -3).
> byteio_read: seekread() returned -1 expected 2048
>
> ERROR: Read from boot device failed (status = -3).
> byteio_read: seekread() returned -1 expected 2048
>                                              Couldn't grok your kernel exect
> ERROR: failed to load kernel
>
>
> I will try again later with a lifimage from 0.9.2 as I used that some time
> ago without any problems.
>
> PeteM
>
> On Fri, 14 Dec 2001, Peter Mottram wrote:
>
> > Hello Tommi
> >
> > On Fri, 14 Dec 2001, Tommi Aihkisalo wrote:
> >
> > > Hello all!
> > >
> > > I am having a problem with my 712/80 when booting with bootp/tftp. With
> > > some effort I got it requesting kernel image (lifimage) over the
> > > network. The
> >
> > [SNIP]
> >
> > I too have just tried a net boot of 0.9.3 from a remote location and also
> > failed. I noticed MUCH too late that the lifimage contains the following
> > files:
> >
> >     0/vmlinux32 3122078 bytes @ 0x7800
> >     0/vmlinux64 3990942 bytes @ 0x302000
> >     0/ramdisk 1946807 bytes @ 0x6d0800
> >
> > But PALO chooses a default kernel path of
> >
> >     0/linux
> >
> > I assume that is simply that the PALO definition in the lifimage is
> > incorrect. Once I get my remote button pusher to power cycle the system
> > for me (she is out shopping right now) I will try an interactive boot &
> > change the command line to boot the correct kernel.
> >
> > If you get chance to try this before me then please let me know how it
> > goes.
> >
> > Cheers
> > PeteM
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

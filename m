Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC8694A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 13:20:55 -0700 (MST)
Message-Id: <200102062022.MAA04003@milano.cup.hp.com>
To: "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Generic Parisc Linux Kernel Questions & 9000/730 success report 
In-reply-to: Your message of "Tue, 06 Feb 2001 18:31:26 PST."
             <Pine.LNX.4.21.0102061808500.2465-100000@sgate.charlysworld.de>
Date: Tue, 06 Feb 2001 12:22:03 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Max,
I'm going to take a shot at answering your questions.
Some I don't know the answer.

"M. Grabert" wrote:
> Hello there!
> 
> I'm lucky again :)))))
> 
> 
> Finally I got my HP box bootin & running Linux *smile*

Excellent!


> There are some minor troubles, but I think these will be fixed soon,
> e.g.
> 
> smb won't compile
> netware won't compile
> ppp_sync won't compile

People just have to work through these issues one-by-one.
Feel free to post the issues (one per e-mail) to parisc-linux.
Include error messages from the compiler and where you
got the source from.

> fbcon-sti won't compile (at least when I don't compile STI-console)

The ESIEE team in France is doing alot of work with STI interfaces.
Hopefully they could answer this.
 
> hwclock doesn't work (can't use /dev/rtc), 'though I seems the
>    time and date is read correctly (but hwclock can't set them).
>    Is this a known problem ?

No. I had wrongly assume the /dev/rtc was on the latest NFS root
tar ball (it is not). You need to create it by hand:
	# mknod /dev/rtc c 10 135

If it already exists, then...well, post the console output of hwclock
command to parisc-linux as well.

> 
> I think the "do_page_fault() messages & stack traces"  (, which are
>    not seen when I switch VERBOSE=no in /etc/defaults/rcS,)
>    are because of some segfaults whilst running some rc-scripts.
>    Hope that will be fixed in the new nfsroot.

I think so. The patch from rhirst should help alot with this though.


> Many segfaults in sourcing / executing rc-boot-scripts and
>    shutdown-scripts. Therefore (I think) I can't reboot/shutdown
>    properly (last message is: "sending all processes the TERM signal").
>    At least the HP doesn't reboot. But e2fsck reports ext2 is clean.

ditto.

> Is the well known problem of the missing termcap fixed in the new nfsroot?

yes. (afaict).


> Is is enough to copy nfsroot onto the scsi disc and adopt /etc/fstab,
>    or should I use base.tgz ? what's the difference ?

You should be able to "install" the nfsroot as outlined in
the README.INSTALL (note that the PALO command has changed slightly).

If you want to just clobber an existing root that's in use, I think that
is a bit more complicated. Installing from NFS root or onto a different
disk should be easier.

> Mhhh. missing ftp and (open)ssh, strace in (old) nfstools. Are they in the
>    new one?

only ftp is there.
ssh has been built and used. Not sure if that was openssh.
Don't know about strace.

> Does the new xc fix major problems or is it just a a little update ?
>    IMHO there was a lot done for parisc64, but also for parisc(32) ?

Don't know. amodra?


> Some questions regarding kernel support of...
> 
> networking: can I use all the protocols like ipv6, routing, masq etc?

not tested. You *should* be able to assuming they access data
with proper address alignment.

> 
> WAX: is it still not usable ? if not, can I use all the Linux-2.4 isa
>    drivers (easily) ?

Don't know. (read my .sig "^)

> modules: are kernel modules supported (fully) on parisc ?

yes. But you need to install modutils before enabling that.
modutils_2.4.1-2_hppa.deb is available from the parisc-linux.org ftp site.

hope this helps,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253

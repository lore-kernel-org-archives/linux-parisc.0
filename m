Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10F034961
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Oct 2001 02:25:24 -0600 (MDT)
Date: Wed, 10 Oct 2001 08:25:17 +0000 (UTC)
From: Sonny Cook <sonny@aspersion.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] kernel 2.5.9-pa24 won't boot 735/125
In-Reply-To: <20010925092401.M5051@linuxcare.com>
Message-ID: <Pine.LNX.4.33.0110100813560.4675-100000@lefou.zayda.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Wooohooo.
I got it to work.  Well, not quite.  A retired b132l showed up on my
doorstep last night and rejuvinated my somewhat flagging interest in
getting hp workstations to run linux.  I promply hooked it up and tried it
out.  It did the same thing my 735 did.  Argggh.

So, now I'm up to 2.4.90-pa45 kernel.  The kernel is booting and the
machine will let me log on if I pass the kernel 'init=/bin/sh'.  I then
locks up during various operations.  Starting sysklogd and klogd in rc2.d,
but also this part of bootmisc.sh would lock up in rcS.d:

if [ ! -c
/dev/.devfsd ] && [ -c /dev/ttyp0 ]
then
        chmod 666 /dev/tty[p-za-e][0-9a-f]
        chown root:tty /dev/tty[p-za-e][0-9a-f]
fi

The solution for me was to get the init scripts in rcS.d to run, set up
networking and then 'apt-get upgrade' the system.  After that, all of the
init scripts run without a hitch and the system boots into runlevel 2
without a problem.  I am assuming that this solution will work for the
735/125 as well.  I'll noow in a little while, as I am mirroring the
working system onto another disk.

Thanks for all of your help.
Sonny


On Tue, 25 Sep 2001, Richard Hirst wrote:

> On Mon, Sep 24, 2001 at 10:09:09PM -0600, Sonny Cook wrote:
> > Okay, I've written off cross compiling as a loss.  I did get a 715/80
> > working with no obvious problems.  I've compiled a kernel with the
> > EARLY_BOOTUP_DEBUG flag defined.  So, I boot my 735/125 with that kernel
> > and get much more interesting information.  Thusly:
> ...
> > Setting the System Clock using the Hardware Clock as reference...
> > Cannot access the Hardware Clock via any known method.
> > Use the --debug option to see the details of our search for an access
> > method.
> > System Clock set. Local time: Tue Sep 25 20:35:45 MDT 2001
> >
> > Cleaning: /tmp /var/lock /var/run.
> >
> > At this point the system refuses to give any more output.  I can ping the
> > box, but there are no services running (sshd is supposed to start up.)  I
> > also assume that the root file system (/dev/sdb2) is indeed mounted,
> > because if I just cold reboot, it has to fsck the filesystem next time.
> >
> > The kernel is compiled without STI or framebuffer support.  It also has
> > all of the non experimental iptables options compiled in.
>
> To eliminate the possibility of a kernel config problem, I would
> make distclean; cp arch/parisc/debian-configs/32 .config; make oldconfig
> make dep; make
>
> The other thing you can try is booting with init=/bin/sh and try
> starting things up by hand to see what hangs it.  Or maybe remove
> non-essentail services, then if it boots ok try starting them one
> by one.
>
> Richard
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp5ve.mailsrvcs.net (smtp5vepub.gte.net [206.46.170.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3211B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 00:06:49 -0600 (MDT)
Received: from neuronet.pitt.edu (client-151-201-23-51.pittpa.adsl.bellatlantic.net [151.201.23.51])
	by smtp5ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id GAA26200421
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 06:06:47 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3B4BECF6.2F58760A@neuronet.pitt.edu>
Date: Wed, 11 Jul 2001 02:06:46 -0400
From: Rafael Herrera <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.1 installation failed with and ext2-fs error
References: <3B4495BC.C3E7A04D@neuronet.pitt.edu> <20010706125701.W23509@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> 
> On Thu, Jul 05, 2001 at 12:28:44PM -0400, Rafael Herrera wrote:
> > While installing the latest 0.9.1 on a 715/75 machine over a serial
> > line, the installation halted with this error message:
> >
> >  Extracting
> >  /var/cache/apt/archives/tar_1.13.19-1_hppa.deb...          EXT2-fs
> > error (device sd(8,3)): ext2_write_inode: unable t9
> >
> > it looks truncated. I can't provide more error messages. Are there other
> > virtual consoles under the installed? if so, how do you switch to them?
> > I'm using minicom on an X terminal.
> 
> Try again, and when you get to the point of installing base, scroll
> down the menu to 'execute a shell'.  Then mount the CD, something
> like
> 
> mkdir /tmp/cd
> mount /dev/scd0 /tmp/cd
> 
> (may already be mounted under /instmnt, do 'mount' to check)
> 
> Then run debootstrap manually:
> 
> debootstrap sid /target file:/tmp/cd

This one completed without errors, I continued the installation and
booted from the newly installed disk. Unfortunately, the file /etc/fstab
was not created and the boot failed and apparently tha machine was
halted, because the minicom indicator showed 'offline'.

In any case, I got the new palinux-0.9.2.iso image. This one booted and
I proceeded to install. I got other errors, which I'll post next.

Rafael

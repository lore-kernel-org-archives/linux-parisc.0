Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE4AB482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Jun 2001 05:55:27 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3F128B00C; Tue, 19 Jun 2001 12:56:37 +0100 (BST)
Date: Tue, 19 Jun 2001 12:56:37 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "E . Pavletic" <Enzo.Pavletic@guest.arnes.si>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palinux-0.9-32serial.iso install problems on a 753/99
Message-ID: <20010619125637.G9877@linuxcare.com>
References: <20010619112643.A853@gorica.go.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010619112643.A853@gorica.go.net>; from Enzo.Pavletic@guest.arnes.si on Tue, Jun 19, 2001 at 11:26:43AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 19, 2001 at 11:26:43AM +0200, E . Pavletic wrote:
> Hi,
> 
> I'm trying to install the palinux-0.9-32serial.iso image from cdrom on my
> 735, but I run into troubles when the process reaches the point of the
> installation of the base system: it hangs. If I try to run the command
> "debootstrap sid /target file:/instmnt/debian" manually, I receive the
> following messages:
> 
> ..
> I: Retrieving file:/instmnt/debian/dists/unstable/main/binary-hppa/base/util-linux_2.11b-5_hppa.deb
> I: Retrieving file:/instmnt/debian/dists/unstable/main/binary-hppa/base/whiptail_0.50.17-6_hppa.deb
> I: Extracting required packages
> tar: ./usr/share/doc/libperl5.6: Cannot create symlink to 'perl-base':
> Input/output error
> tar: Error exit delayed from previous errors
> 
> Can anyone help me?
> enzo

We expect 735 to have problems with the release 0.9 ISO, because of
problems with glibc 2.2.1.  I havn't seen this particular problem
reported before though.  Not something silly like out of disk space
or disk errors, is it?  Can you create files/links in /target from
the shell, once this error happens?

Richard

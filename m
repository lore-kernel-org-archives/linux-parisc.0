Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id DCF52482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 08:12:26 -0600 (MDT)
Date: Tue, 5 Jun 2001 09:14:05 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
In-Reply-To: <20010605145156.J25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106050904490.22868-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Jun 2001, Richard Hirst wrote:

> So with the nfsroot you have the D310 booting, but with the 0.9 ISO
> it stops after serial driver initialisation.

No, if I boot off the cd, I get IPL errors. When I netboot the kernel off
the cd, it stopped at serial init. I don't think it actually stopped, I
think it no longer printed but still booted.

> What kernel are you using with the nfsroot?

linux-20010603.tar.gz from the ftp site, built by me with the xc from the
ftp site.

> What parameters is it booted with?

./palo/palo -f /dev/null \
-b iplboot \
-k /home/djweis/HP/linux/vmlinux \
 \
-c "0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=192.168.1.10
console=ttyB" \
	-s lifimage

If I set the console back to ttyS0 it stops printing after the serial
init, but if I leave it at ttyB I can see where it gets to the point of
not having an initial console. The serial driver doesn't seem to be
working, I telnet in and run echo hello > /dev/ttyS0 and it doesn't show
up on the machine running minicom. I have two serial ports on the back,
plus the UPS monitoring port, but only one serial port is
probed/acknowledged.

dave

-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison

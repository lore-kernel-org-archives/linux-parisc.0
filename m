Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA04714
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 17:32:43 -0700
Received: from dot.at (IDENT:plattner@dot-tc01-058.dot.at [212.9.128.98])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id BAA06196
	for <parisc-linux@thepuffingroup.com>; Sat, 27 Jan 2001 01:45:04 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A721814.B357DEEA@dot.at>
Date: Sat, 27 Jan 2001 01:36:36 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] My 9000/720 boots, but problems with `ldconfig'
List-ID: <linux-parisc.vger.kernel.org>

Hello HP specialists !

The help with the TRAP-18 was successful. I added this to 15/26/etc and
suddenly the system boot from my new built root, but there is a problem
with the /etc/ld.so.cache.

So I used the CD image, installed on my NFS server and ... SUCCESS !
The system boots up !
I have problems with the RTC chip, setting the time with hwclock.
First it needs /dev/rtc, so I compiled this in and added the /dev entry.
But the ioctl reading the time fails. I have to study the NVRAM/RTC chip
type and the implementation of rtc.c.

But as mentioned above I have problems with creating a own
	/etc/ld.so.cache
I tried it with the ldconfig of my host machines (intel-linux, 
sparc-linux) with the `-r' option. My root file system was mounted on
`/mnt/disk0'. So I tried
	ldconfig -r /mnt/disk0
The machine boots with a error not finding libc.6.so.
I tried further to use ldconfig of the CD image on the running linux,
where I have mounted my self created root file system (from the 
cross tool chain) and did again `ldconfig -r /mnt' but it of course
wants to access the file relative to the cross tool chain tree
(/usr/parisc/hppa-linux/etc/ld.so.cache) which was not accessable
from the target machine.

How must I handle this, if I build a root file system from the 
scratch. The glibc source package creates the initial root tree
with the --prefix=$DEST/hppa-linux. This is the initial root of
all files executable for the HP target. And I can further build and
install software there. What is the step (especially concering the
ldconig stuff) to make a "vaild" root from that tree ?

Thanks for the help so far, I am happy to have the 720 up.

Are there news with the E55 devices. 
Again, what is "SPIFI" ?

With friendly regards

	Christoph

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at

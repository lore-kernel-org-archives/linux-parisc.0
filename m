Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA28722
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 09:04:03 -0700
Received: from localhost (bz@localhost)
	by mail.zabbadoz.net (8.11.0/8.11.0) with ESMTP id eAJG6Cr67939
	for <parisc-linux@thepuffingroup.com>; Sun, 19 Nov 2000 17:06:12 +0100 (CET)
Date: Sun, 19 Nov 2000 17:06:11 +0100 (CET)
From: "Bjoern A. Zeeb" <bzeeb+hplinux@zabbadoz.net>
cc: parisc linux mailing list <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] serial console ?
In-Reply-To: <Pine.BSF.4.30.0011191034280.74407-100000@noc.zabbadoz.net>
Message-ID: <Pine.BSF.4.30.0011191656290.74407-100000@noc.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 19 Nov 2000, Bjoern A. Zeeb wrote:

> I just started booting into a 715-100 using palinux-0.5.iso.
>
> I did read multiple times that I need serial console. So I plugged in
> serial cable I an normally using for x86 to x86 serial console on my
> linux router but I did not get anything on both serial ports :-(

Hi,

sorted out everything. serial cable was quite ok, but using cu I was
never able to reach IPL. Using minicom and everything was fine.

Had a great success afterwards:

	installed from CD (palinux-0.5.iso)
	Everthing worked at once out of the box :-)
	openssh was enabled on default :-))

	only one bad touch: please do not enable portmapper on default.
	there are too much exploits out there these days.


Short:	Great great great work !!!


-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/

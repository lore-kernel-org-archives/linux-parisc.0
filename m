Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mr14.vic-remote.bigpond.net.au (mr14.vic-remote.bigpond.net.au [24.192.1.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B6EC4A19
	for <parisc-linux@parisc-linux.org>; Sat,  3 Feb 2001 18:30:42 -0700 (MST)
From: penfold@customware.com.au
Message-Id: <200102040130.MAA30086@customware.com.au>
Subject: Re: [parisc-linux] Source of this version of rbootd-2.0-2
To: matthew@wil.cx (Matthew Wilcox)
Date: Sun, 4 Feb 2001 12:30:34 +1100 (EST)
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20010203172429.A12985@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 03, 2001 05:24:29 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> i'm running debian potato, and i have Version: 0.4a6-3.  i didn't need
> to do this.

just quick check to make sure I didnt have something which I had manually
done, it seems the .rpm itself differs.


[penfold@artemis penfold]$ rpm -ql libpcap
/usr/doc/libpcap-0.4
/usr/doc/libpcap-0.4/CHANGES
/usr/doc/libpcap-0.4/README
/usr/include/pcap
/usr/include/pcap/net
/usr/include/pcap/net/bpf.h
/usr/include/pcap/pcap-namedb.h
/usr/include/pcap/pcap.h
/usr/lib/libpcap.a
/usr/man/man3/pcap.3
[penfold@artemis penfold]$ cat /etc/issue.net

Red Hat Linux release 6.1 (Cartman)
Kernel 2.2.18 on an alpha
[penfold@artemis penfold]$

I also chaeck a RH 6.2 /libpcap-0.4-19.alpha and it is the same as my 6.1.

standards are great... there are so many to choose from!

Damian
penfold@customware.com.au

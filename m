Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA29852
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 17:00:33 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (Postfix) with ESMTP id 7658A194D
	for <parisc-linux@thepuffingroup.com>; Mon, 22 Nov 1999 19:02:17 -0500 (EST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id QAA03909 for parisc-linux@thepuffingroup.com; Mon, 22 Nov 1999 16:04:15 -0800 (PST)
Date: Mon, 22 Nov 1999 16:04:15 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199911230004.QAA03909@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] Cannot load IPL, error detected
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I'm trying to boot via bootp and am getting the following error:

Main Menu: Enter command > bo alt
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 0060b0-dd9d80
System IP Address 15.16.124.10
Server IP Address 15.16.123.90

Boot IO Dependent Code (IODC) revision 2

Cannot find ENTRY_TEST.

Failed I/O operation with 
ENTRY_IO 
Status = -3

00000031 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
0000000E 00000002 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00430320 00000000 00000000 00000000 00000000 00000000 


Error Reading IPL

and then back to the command prompt.
This failed on both the A180 and 715/100.
715 reports "Cannot load IPL, error detected" instead.

Can I assume bootp found the right entry since it knew the IP addresses?
If so, then only the contents of Image aren't right.

What's changed?
I don't know if something my local copy of CVS is wrong or if something
in the CVS tree changed.

I've done:
	o cvs -z9 update -d
	o mv /linux/linux /linux/grundler/linux
		(so other folks using this build host know what's mine.
		this might be screwing me up)
	o find/rm all *.o and *.flags
	o make oldconfig/dep/Image
	o updated /etc/bootptab to reflect change in path name.
	o tried to boot - bootp server is same machine I build on.

(Sample /etc/bootptab entry:
ggg715:\
	hn:\
	sm=255.255.248.0:\
	vm=rfc1048:\
	ht=ether:\
	ha=0800095F7A88:\
	ip=15.16.124.10:\
	bf=/linux/grundler/linux/arch/parisc/boot/Image
)


thanks,
grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.alcatel.be (alc119.alcatel.be [195.207.101.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 899D0482F
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 05:01:19 -0600 (MDT)
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117C9EF@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'Grant Grundler'" <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] bad loopback error msg
Date: Thu, 11 Oct 2001 13:00:36 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Got exactly the same on 712/100 (STI).
After I did: "ifconfig lo down" those messages did clobber my screen again
Perhaps a overkill, but it works..

Hans

	-----Original Message-----
	From:	Grant Grundler [SMTP:grundler@puffin.external.hp.com]
	Sent:	Tuesday, October 09, 2001 2:20 AM
	To:	parisc-linux@lists.parisc-linux.org
	Subject:	[parisc-linux] bad loopback error msg

	Hi,

	Helped someone install 0.9.2 on a B180 (serial console) and
following
	the instructions, basically got it up and running.  He needed some
help
	with setting up apt (pointing to HP internal mirror).

	But I couldn't figure out what was causing the following error msg
	to get printed on the console every minute or so:

	    ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
	    skb: pf=2 (unowned) dev=lo len=328
	    PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000
T=16

	Any ideas?

	This B180 is up-to-date but still running 2.4.0-32 vmlinux
	(original kernels from 0.9.2 I think).

	grant


	_______________________________________________
	parisc-linux mailing list
	parisc-linux@lists.parisc-linux.org
	http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

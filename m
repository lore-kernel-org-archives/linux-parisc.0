Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.alcatel.be (alc119.alcatel.be [195.207.101.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C9B64832
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 12:29:52 -0600 (MDT)
Received: from nlntadn.ats.nld.alcatel.nl (localhost [127.0.0.1])
	by relay1.alcatel.be (8.10.1/8.10.1) with ESMTP id f988H5Z15726
	for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Oct 2001 10:17:14 +0200 (MET DST)
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117C9E6@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "Parisc-Linux (E-Mail)" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 8 Oct 2001 10:17:01 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] FW: SKB errors
List-ID: <linux-parisc.vger.kernel.org>

Hi All,

Yesterday I received a (old but unused) 712/100 and tried to install the
latest cd (0.9.2)

All went reasonably well but after some time I got a very annoying lot of
error messages:

ip_local_deliver: bad loopback SKB PRE_ROUTING LOCAL_IN
SKB: pf=2 (unowned) dev=lo len=328
Proto=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

These three lines appear every minute or so.

So I have a couple of questions:
1)	What's going on? it seems that the device driver for the loopback
interface has a problem with its (linked-list) buffers

2)	How to get rid of it? switching consoles is no use: they haunt me
everywhere ;-)
At this moment, I do a "ifconfig lo down" but  I guess its not a proper
thing to do...


Kind regards, Hans Witvliet

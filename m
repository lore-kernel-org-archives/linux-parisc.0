Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id AEA8F484B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 18:23:21 -0600 (MDT)
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id SAA01264
	for parisc-linux@lists.parisc-linux.org; Mon, 8 Oct 2001 18:20:15 -0600
Date: Mon, 8 Oct 2001 18:20:15 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Message-Id: <200110090020.SAA01264@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] bad loopback error msg
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Helped someone install 0.9.2 on a B180 (serial console) and following
the instructions, basically got it up and running.  He needed some help
with setting up apt (pointing to HP internal mirror).

But I couldn't figure out what was causing the following error msg
to get printed on the console every minute or so:

    ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
    skb: pf=2 (unowned) dev=lo len=328
    PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

Any ideas?

This B180 is up-to-date but still running 2.4.0-32 vmlinux
(original kernels from 0.9.2 I think).

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67733482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 12:57:08 -0600 (MDT)
Message-Id: <200110111853.MAA29934@puffin.external.hp.com>
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] FW: SKB errors 
In-Reply-To: Message from "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
   of "Tue, 09 Oct 2001 07:53:07 +0200." <1A8904C3797ED411AC2E0008C7E6F88117C9E8@nlntmail2b.ats.nld.alcatel.nl>
Date: Thu, 11 Oct 2001 12:53:49 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Witvliet, Hans" wrote:
> All went reasonably well but after some time I got a very annoying lot of
> error messages:
> 
> ip_local_deliver: bad loopback SKB PRE_ROUTING LOCAL_IN
> SKB: pf=2 (unowned) dev=lo len=328
> Proto=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

I just asked the same questions last week.
See the archives at lists.parisc-linux.org.
Short answer is get a newer kernel from the
puffin.external.hp.com ftp site (pub/parisc/binaries/kernel, iirc)

grant

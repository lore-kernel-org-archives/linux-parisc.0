Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D47F482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Jul 2001 11:27:39 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id E3916B00C; Mon,  9 Jul 2001 18:26:32 +0100 (BST)
Date: Mon, 9 Jul 2001 18:26:32 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>
Cc: puffin@esiee.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palinux 0.9.1
Message-ID: <20010709182632.N23509@linuxcare.com>
References: <OF5EDA36D9.81945ED8-ONC1256A7F.00596A33@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <OF5EDA36D9.81945ED8-ONC1256A7F.00596A33@LocalDomain>; from jso@europay.com on Wed, Jul 04, 2001 at 06:44:02PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 04, 2001 at 06:44:02PM +0200, Joël Soete wrote:
> Hi all,
> 
> Very nice on 712 model.
> Just a small problem after the configuration of the inet interface:
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
> skb: pf=2 (unowned) dev=l0 len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> 
> This message is repeated severall times?

This is a problem with dhcp-client 2.x.  It installs /etc/init.d
scripts which start dhclient on boot.  It should not be started on
boot, as it is now invoked via /etc/network/inferfaces and ifup/ifdown.
I have just done some tests with dhcp-client 3.0beta2RC10-1, which
cures the problem.

Richard

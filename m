Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63E06482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 05:09:07 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 49038B00C; Fri,  6 Jul 2001 12:08:18 +0100 (BST)
Date: Fri, 6 Jul 2001 12:08:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>
Cc: puffin@esiee.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palinux 0.9.1
Message-ID: <20010706120817.Q23509@linuxcare.com>
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

Don't know what causes that.

> But on the B180, I met the same problem as I met with the kernel
> vmlinux-20010629 (from puffin also with your vmlinux-712+sound+mouse):
> all seems to work fine but the keyboard does not answer (and no serial
> consol yet available) also it is impossible to contine the install?

I'm just installing a B180 using the 0.9.1 ISO, using the graphical
console.  I have a keyboard and mouse connected, and it is working
fine.  I'll try a serial console install next.

Richard

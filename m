Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D32D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Jul 2001 10:51:07 -0600 (MDT)
To: puffin@esiee.net
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OF5EDA36D9.81945ED8-ONC1256A7F.00596A33@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Wed, 4 Jul 2001 18:44:02 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] palinux 0.9.1
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

Very nice on 712 model.
Just a small problem after the configuration of the inet interface:
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
skb: pf=2 (unowned) dev=l0 len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

This message is repeated severall times?

Elsewhere the install finished well! (congratulation it is really a big
step).

But on the B180, I met the same problem as I met with the kernel
vmlinux-20010629 (from puffin also with your vmlinux-712+sound+mouse):
all seems to work fine but the keyboard does not answer (and no serial
consol yet available) also it is impossible to contine the install?

(Sorry I just tested vmlinux-20010629 in the beginning of afternnon and not
have time to report it before your realease)

Thanks in advance for help,
     Joel



**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23873482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 02:06:12 -0700 (MST)
Date: Mon, 4 Feb 2002 10:06:02 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Sten <sten@blinkenlights.nl>
Cc: <linux-kernel@vger.kernel.org>,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.44-Blink.0202040829140.19625-100000@deepthought.blinkenlights.nl>
Message-ID: <Pine.NEB.4.33.0202041002120.2571-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: IPv6 Sparc64
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Sten,

> I have been trying to get ipv6 to work
> on sparc64/kernel 2.4 but it looks like it
> is broken somewhere in the kernel.
> I was wondering if this was a known problem.

> [root@towel ip]# ping6 ::1
> PING ::1(::1) from ::1 : 56 data bytes

It's the same on PARISC. However, on PARISC, although ping6 doesn't work,
telnet etc do work, as well as pinging the PARISC box from an Intel or
Alpha machine.

For now, i assume there might be an endianess issue in net/ipv6/raw.c
somewhere... Has anyone tested IPv6 on m68k?

Cheers,
Jochen

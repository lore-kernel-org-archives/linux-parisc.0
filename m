Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6584482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Jan 2002 12:17:20 -0700 (MST)
Received: from www2.scram.de (www2.scram.de [195.226.127.84])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id g0SJHC027691
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Jan 2002 20:17:12 +0100 (CET)
Date: Mon, 28 Jan 2002 20:17:12 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.NEB.4.33.0201282014540.13593-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] IPv6
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

Hi there,

> revision 1.251
> date: 2002/01/22 05:09:00;  author: grundler;  state: Exp;  lines: +1 -1
> 2.4.17-pa13
> replace BUG() in csum_ipv6_magic() with both PA2.0 and PA1.1 __asm__.
> I modeled the asm after the generic csum_ipv6_magic().
> This code is *NOT* tested since I have no clue about IPV6.

and unfortunately, it doesn't work. This is what i get when i ping my 720
from an Intel box:

ICMPv6 checksum failed [3ffe:0400:0470:0004:0000:0000:0000:0001 >
ff02:0000:0000:0000:0000:0001:ff00:0002]
NET: 4 messages suppressed.

I'll try to have a look...

Cheers,
Jochen

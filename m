Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDE9F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 23:29:41 -0600 (MDT)
Received: from localhost (sonny@localhost)
	by lefou.zayda.com (8.9.3/8.9.3) with ESMTP id FAA26330
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 05:08:12 GMT
Date: Sat, 13 Oct 2001 05:08:12 +0000 (UTC)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0110130227590.13555-100000@lefou.zayda.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] unaligned access with iptables limit support
List-ID: <linux-parisc.vger.kernel.org>

I am trying to set up my b132l as a firewall.  So I compiled up iptables
as kernel modules and tried running my favorite firewall script.  It uses
limit support to keep my logs from overflowing.  At any rate when I try to
enter a rule using limits like so:

iptables -t filter -A LDROP -p tcp -m limit --limit 2/s -j LOG --log-level
info --lo g-prefix "TCP Dropped "

I get this on the console:

iptables(428): unaligned access to 0x4020d0cf at ip=0x401fc767
iptables(428): unaligned access to 0x4020d0d3 at ip=0x401fc76f

The module ipt_limit.o does not get loaded by the kernel autoloader.  Is
supsect the bug is with the iptables program.  I downloaded the source for
the latest version and in attempting to compile it got a linker error.

ld -shared -o extensions/libipt_limit.so extensions/libipt_limit_sh.o
ld: BFD internal error, aborting at ../../bfd/elf32-hppa.c line 939 in
hppa_build_one_stub

ld: Please report this bug.

make: *** [extensions/libipt_limit.so] Error 1

The debian version is 1.2.2 and the downloaded source is 1.2.3.  Has
anyone seen anything like this?

Thanks,
Sonny

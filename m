Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22550482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 23:36:03 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ezqbiaaa for parisc-linux@lists.parisc-linux.org; Fri, 12 Oct 2001 22:31:27 -0700
Date: Fri, 12 Oct 2001 22:35:20 -0700
From: Randolph Chung <randolph@tausq.org>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned access with iptables limit support
Message-ID: <20011012223520.M653@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.33.0110130227590.13555-100000@lefou.zayda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0110130227590.13555-100000@lefou.zayda.com>
List-ID: <linux-parisc.vger.kernel.org>

> iptables -t filter -A LDROP -p tcp -m limit --limit 2/s -j LOG --log-level
> info --lo g-prefix "TCP Dropped "
> 
> I get this on the console:
> 
> iptables(428): unaligned access to 0x4020d0cf at ip=0x401fc767
> iptables(428): unaligned access to 0x4020d0d3 at ip=0x401fc76f

yes, this is a bug in iptables.

> ld -shared -o extensions/libipt_limit.so extensions/libipt_limit_sh.o
> ld: BFD internal error, aborting at ../../bfd/elf32-hppa.c line 939 in
> hppa_build_one_stub
> 
> ld: Please report this bug.
> 
> make: *** [extensions/libipt_limit.so] Error 1
> 
> The debian version is 1.2.2 and the downloaded source is 1.2.3.  Has
> anyone seen anything like this?

it needs to link with gcc instead of with ld.

feel free to file a bug. you can point them to build logs at:
http://buildd.debian.org/fetch.php?&pkg=iptables&ver=1.2.3-2&arch=hppa&stamp=1001284133&file=log&as=raw

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

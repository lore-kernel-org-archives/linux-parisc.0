Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2AF29482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 13:07:53 -0600 (MDT)
Received: from ppp29.scram.de (ppp29.scram.de [195.226.127.222])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id f9PJ7nT18294
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 21:07:49 +0200 (CEST)
Date: Thu, 25 Oct 2001 21:06:08 +0200 (CEST)
From: Jochen Friedrich <jochen+parisc-linux@scram.de>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0110252102160.1877-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] IPv6 on PA-RISC up and running :-)
List-ID: <linux-parisc.vger.kernel.org>

Hi,

With a short patch (disabling a not-working checksum method and using a 
portable C version instead), i got IPv6 
up and running on my 720:

[root@alpha root]# ping6 3ffe:400:470:4:a00:9ff:fe17:ca3d
PING 3ffe:400:470:4:a00:9ff:fe17:ca3d(3ffe:400:470:4:a00:9ff:fe17:ca3d) from 3ffe:400:470:4::1 : 56 data bytes
64 bytes from 3ffe:400:470:4:a00:9ff:fe17:ca3d: icmp_seq=0 hops=64 time=2.391 msec
64 bytes from 3ffe:400:470:4:a00:9ff:fe17:ca3d: icmp_seq=1 hops=64 time=780 usec

Cheers,
Jochen

--- /usr/src/linux/include/asm-parisc/checksum.h.old    Thu Oct 25 
21:00:58 2001+++ /usr/src/linux/include/asm-parisc/checksum.h        Thu 
Oct 25 21:00:46 2001@@ -143,6 +143,7 @@
         return csum_fold (csum_partial(buf, len, 0));
 }

+#if 0
 #define _HAVE_ARCH_IPV6_CSUM
 static __inline__ unsigned short int csum_ipv6_magic(struct in6_addr *saddr,
                                                     struct in6_addr *daddr,
@@ -153,6 +154,7 @@
        BUG();
        return csum_fold(sum);
 }
+#endif

 /*
  *     Copy and checksum to user

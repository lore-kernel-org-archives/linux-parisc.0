Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F4274837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 09:48:53 -0600 (MDT)
Date: Thu, 17 Jul 2003 08:52:03 -0700
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org,
	Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
Message-ID: <20030717155203.GO30257@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030717001528.GA20610@systemhalted> <3F0BEA8300002113@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F0BEA8300002113@ocpmta1.freegates.net>
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

> Freeing unused kernel memory: 508k freed
> Adding 250872k swap on /dev/sda2.  Priority:-1 extents:1
> 
> Here it hangs. (just in case, i tried a telnet but no success)
> 
> I so do a toc.
> 
> Unfortunately the IAOQ = 0x00000000000172b8  is not a relevant value?

looks like a userspace address....

can you boot the kernel with init=/bin/sh and see what happens? can you
disable your swap partition (comment it out of /etc/fstab) and see what
happens?

thx
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

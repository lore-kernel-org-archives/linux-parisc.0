Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 347264843
	for <parisc-linux@lists.parisc-linux.org>; Sun,  7 Sep 2003 00:07:25 -0600 (MDT)
Date: Sat, 6 Sep 2003 23:11:35 -0700
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] Re: 2.6.0-test4-pa12 __fls()
Message-ID: <20030907061135.GH10510@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <3F5A4023.9070909@tiscali.be> <3F5A60B9.3050103@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F5A60B9.3050103@tiscali.be>
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

> btw: is somebody knows how to compile with _hppa64-gcc_ shuch trivial loop
> #include <stdio.h>
> 
> main()
> {
> 	unsigned long long i;
> 
> 	for (i=0; i<0xffffffffffffffffUL; i++) {
> 		printf ("i = %#010x (%ll)\n", i);
> 	}
> }
> 
> (afair the problem if the call to printf() )

we don't have 64-bit glibc/userspace yet, so you can't do this.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5326E484E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Oct 2002 15:18:00 -0600 (MDT)
Date: Sat, 26 Oct 2002 14:18:22 -0700
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <joel.soete@freebel.net>
Cc: jsoe0708@tiscali.be, Stefan Pfetzing <dreamind@dreamind.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
Message-ID: <20021026211822.GJ22052@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3DB5776100000C32@ocpmta8.be.tiscali.com> <3DBAD364.9060301@freebel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DBAD364.9060301@freebel.net>
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

In reference to a message from Joel Soete, dated Oct 26:
> i386 declare: "extern void __get_user_bad(void);"
> ...
> but not define elsewhere? (is it there so that the build of the kernel 
> failed if that case was requested to run properly?)

yes.

> PS: afaik on i386 only put_user_u64 is define why not pending get_user?

on first glance i haven't found any code that uses get_user with 64-bit
quantities. if you have a specific need for this, please let me know.

in the mean time, i've checked in support for put_user with 64-bit
values. This is in 2.4.19-pa24

Let me know if this works for you. i've tested it only lightly.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AF494829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 18:27:34 -0700 (MST)
Date: Sat, 8 Feb 2003 16:49:42 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
Message-ID: <20030209004942.GQ11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca>
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

> I think the volatile provides the barrier in my suggested version.

volatile would prevent reordering accesses to a particular spinlock, 
but does it ensure that code that happens after the spinlock will not
be reordered to happen before the spin-unlock?

for example, if we had:

volatile spinlock l1, l2;

lock(l1)
do something
unlock(l1)

lock(l2)
do something else
unlock(l2)

will gcc ever move the lock(l2) before the unlock(l1)? 

(for reference, see this thread:
http://lists.debian.org/debian-gcc/2002/debian-gcc-200210/msg00058.html)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

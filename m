Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD99D4842
	for <parisc-linux@parisc-linux.org>; Thu, 27 Feb 2003 10:17:23 -0700 (MST)
Message-Id: <200302271717.h1RHHJM1021638@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: jsoe0708@tiscali.be (Joel Soete)
Date: Thu, 27 Feb 2003 12:17:18 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <3E5BA29100000DEB@ocpmta3.freegates.net> from "Joel Soete" at Feb 27, 2003 05:00:17 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> I remove the cast so that in asm-parisc/spinclok_t.h
> ...
> #ifndef CONFIG_DEBUG_SPINLOCK
> #define SPIN_LOCK_UNLOCKED { 1 }
> ...
> #else
> 
> #define SPIN_LOCK_UNLOCKED { 1, 0L, 0L }

You probably don't need the 0's.  When there a fewer initializers in a brace
enclosed list than there are elements or members of an aggregate, they are
implicitly initialized the same as objects that have static storage duration.

> but it breacks many code else where fork.c, raid1.c, raid5.c,...
> where it is easy to recast.

Glibc linuxthreads defines two initializers in the pthread code, one
using compound literals and the other using standard initializer lists.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

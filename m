Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58D534860
	for <parisc-linux@parisc-linux.org>; Sun, 27 Apr 2003 15:04:56 -0600 (MDT)
Date: Sun, 27 Apr 2003 13:12:19 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alexander Gabert <pappy@nikita.ath.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] -fPIC position independent code on parisc
Message-ID: <20030427201219.GE25257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030427200418.GA30929@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030427200418.GA30929@nikita.ath.cx>
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

> but what exactly is position independent code?

it's exactly what it says, it will work no matter at what position
the code is loaded.

e.g.:

non-PIC
>     18          ldil LR'.LC0,%r19
>     19          ldo RR'.LC0(%r19),%r26
>     20          bl printf,%r2

This loads the address of .LC0 (your string) relative to a fixed address
into r26 (arg0). The address is resolved statically at link time, so
if the code is moved to a different starting address, the address will 
be wrong.

PIC:
>     21          addil LT'.LC0,%r19
>     22          ldw RT'.LC0(%r1),%r1
>     23          copy %r1,%r26
>     24          bl printf,%r2

This calculates the offset of .LC0 relative to the linkage table pointer
(r19) by creating a GOT entry. The linkage table pointer is assigned 
value at runtime based on where the dynamic loader loads the code into 
memory, so the load will always point to the the right place wherever 
it is loaded. 

When you have a shared library, different programs that are linked
against the library may load it at different offsets, so the code must 
be position independent for it to work.

HTH
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 027624829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 22:27:57 -0700 (MST)
Date: Mon, 11 Nov 2002 21:31:24 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20021112053124.GA8261@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021111211713.GD9704@systemhalted> <200211112133.gABLXg3j003013@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211112133.gABLXg3j003013@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] simple testcase for binutils visibility problem
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

> > The fix is non-obvious to me. I have no idea where to begin here.
> > Any hints? :)
> 
> It isn't obvious to me either other than the problem is probably in
> elf32-hppa.c.  I would look at the testsuite results for ld, pick
> a simple test that fails and try to figure out what is going wrong.

here's a trivial test case in case anyone wants to track this down :-)

======= undef.s ==========
        .protected protected
        .hidden hidden
        .internal internal
==========================

assemble with 'as -o undef.o undef.s' and run 'readelf -s undef.o'

on pa, you get:
Symbol table '.symtab' contains 4 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND
     1: 00000000     0 SECTION LOCAL  DEFAULT    1
     2: 00000000     0 SECTION LOCAL  DEFAULT    2
     3: 00000000     0 SECTION LOCAL  DEFAULT    3

on ia32/ia64, i get this more reasonable output:

Symbol table '.symtab' contains 7 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
     0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND
     1: 0000000000000000     0 SECTION LOCAL  DEFAULT    1
     2: 0000000000000000     0 SECTION LOCAL  DEFAULT    2
     3: 0000000000000000     0 SECTION LOCAL  DEFAULT    3
     4: 0000000000000000     0 NOTYPE  GLOBAL PROTECTED  UND protected
     5: 0000000000000000     0 NOTYPE  GLOBAL HIDDEN  UND hidden
     6: 0000000000000000     0 NOTYPE  GLOBAL INTERNAL  UND internal

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

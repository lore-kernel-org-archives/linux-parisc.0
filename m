Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E0BD482A
	for <parisc-linux@parisc-linux.org>; Sat, 26 May 2001 22:08:23 -0600 (MDT)
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by deimos.frii.net (8.11.3/8.11.3) with ESMTP id f4R48IC97669
	for <parisc-linux@parisc-linux.org>; Sat, 26 May 2001 22:08:18 -0600 (MDT)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA30507
	for <parisc-linux@parisc-linux.org>; Sat, 26 May 2001 22:08:09 -0600
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m153rqb-001VltC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Sat, 26 May 2001 22:08:09 -0600 (MDT)
Message-Id: <m153rqb-001VltC@bame.riverrock.org>
From: bame@debian.org
Reply-To: bame@debian.org
Errors-To: bame@debian.org
To: parisc-linux@parisc-linux.org
Date: Sat, 26 May 2001 22:08:09 -0600
Sender: bame@riverrock.org
Subject: [parisc-linux] some information on apt woes
List-ID: <linux-parisc.vger.kernel.org>

Summary:
    Latest versions of apt don't compile with g++3.0 even on x86.

    Upstream CVS apt has bugs which might or might not be related to
    my changes to compile with g++3.0.  Upstream CVS apt doesn't even
    compile (for me) using older compilers on x86.

    One current parisc apt failure mode of both 0.4.0 and 0.5.3 appears
    to be a kernel VM problem though that doesn't make sense since the
    variable to make 0.4.0 fail is to update to glibc 2.2.3 from 2.2.1
    unless it's just the right change to the memory map to tweek some bug.

    Many thanks to tausq (Randolph Chung) for providing a patch with
    many of the changes required to make apt compile with g++3.0

    If someone with a clue about VM would take a look I'd appreaciate it
    because I'm really burnt out on apt right now.

VM Problem?
    Reproduce by removing /var/cache/apt/*.bin then running apt-get update.
    apt-get updates which don't download new packages file seem to work.

    The test generates a type 6 fault trying to fetch an instruction from
    an apt-specific shared library from which code has been happily
    executing up to this point.  The failure has the hallmarks (IIR is
    0x43ffff80) of fetching from an unmapped page.  Gdb disassembly of
    this area immediately after the fault shows garbage.

    The fault appears to happen shortly
    after the pkgcache.bin file, in which apt builds a memory-mapped
    database, is munmap-ped.  As we've seen, apt functions correctly
    even with this defect which is consistent with the apt database
    being updated properly in spite of the fault.

apt 0.5.3 + parisc problem:
    Like 0.4.0, apt 0.5.3 (hacked to compile with g++3.0 and working
    ok on x86) faults in the above test case.  However apt-get installs
    also fail, by segfaulting prior to doing their work.  Through layers
    of C++ code it appears that a bad data value is being read from the
    (memory-mapped) database.  That value is used to construct a
    pointer which is invalid leading to a type=15 fault.

    I can't find the bad data value in the database file from which
    it must be coming, leading me to conclude I either haven't yet
    found the root cause (quite possible -- it has taken hours to
    grok and trace the layers of C++) or that the database is corrupt due to
    premature death of the apt-get update.  I'm guessing the former.

Generic apt 0.5.3 problem:
    'apt-cache dump' built with my changes crashes on both x86 and
    parisc (the 0.5.3 x86 official debian package works fine).  This
    could indicate some subtle defect with the conversion to g++3.0
    most of which deals with strings.  Apt seems to use C++ strings
    extensively, but is always poking around inside their guts, so
    it would be easy to do something stupid there I think.  It's also
    possible that the g++3.0 is unconvering an existing defect.


    	-P

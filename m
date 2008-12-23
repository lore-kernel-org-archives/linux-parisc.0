From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Tue, 23 Dec 2008 06:36:47 GMT
Message-ID: <200812230636.mBN6alsB020758@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 378fe7c4cc619b561409206605c723c05358edac
Author: Kyle McMartin <kyle@treachery.i.cabal.ca>
Date:   Mon Dec 22 21:59:01 2008 -0500

    parisc: disable UP-optimized flush_tlb_mm
    
    flush_tlb_mm's "optimized" uniprocessor case of allocating a new
    context for userspace is exposing a race where we can suddely return
    to a syscall with the protection id and space id out of sync, trapping
    on the next userspace access.
    
    Debugged-by: James Bottomley <James.Bottomley@HansenPartnership.com>
    Tested-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


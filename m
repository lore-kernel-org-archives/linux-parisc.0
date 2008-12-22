From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Mon, 22 Dec 2008 17:32:07 GMT
Message-ID: <200812221732.mBMHW7iI007863@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 5939320fddfc4c6ada0550c4b20f6e81191c64b9
Author: Kyle McMartin <kyle@treachery.i.cabal.ca>
Date:   Mon Dec 22 12:29:02 2008 -0500

    parisc: factor out sid to protid conversion
    
    Create a new __space_to_prot inline to convert the space id (mmu context)
    to a protection id. Sadly it doesn't look like the #ifdef can be eliminated
    since relying on the compiler to not truncate a bit on
    	return (ctx >> SPACEID_SHIFT) << 1;
    seems a little dodgy.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


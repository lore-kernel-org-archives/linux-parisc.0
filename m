From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Thu, 2 Jul 2009 17:12:38 GMT
Message-ID: <200907021712.n62HCcNL001333@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 0517fbf0368b173814ca6c2a260abbb83754d09d
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Thu Jul 2 13:10:29 2009 -0400

    parisc: use generic atomic64 on 32-bit
    
    Somewhat redundant since our atomic_t uses hashed-locks on 32-bit
    anyway... Maybe we can clean those up to be generic too someday.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


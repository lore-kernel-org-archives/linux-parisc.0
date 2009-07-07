From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/tracehook
Date: Tue, 7 Jul 2009 06:45:41 GMT
Message-ID: <200907070645.n676jfRv021773@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 8dcd3644bb70c18f5194c936232b2b703998ceeb
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jul 7 02:43:20 2009 -0400

    parisc: ptrace {GET,SET}REGS and compat
    
    Not for public consumption, testing with gdb seems to work, but strace
    using GETREGS seems broken.
    
    Not-signed-off-under-any-condition-by: Kyle McMartin <kyle@mcmartin.ca>


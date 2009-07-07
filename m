From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/tracehook
Date: Tue, 7 Jul 2009 17:29:33 GMT
Message-ID: <200907071729.n67HTXHV018041@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit cfbeb2a4f72dd93e714ad1c578336c30f7f887a9
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Tue Jul 7 13:27:42 2009 -0400

    parisc: unify compat PTRACE_{GET|SET}REGS paths
    
    Just call arch_ptrace for all of them and add some helpers to
    check TIF_32BIT.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


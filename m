From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/tracehook
Date: Mon, 6 Jul 2009 21:30:43 GMT
Message-ID: <200907062130.n66LUhGb022678@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 1bfad82af3452a5ba38fddae5b8bdd0689bffbb2
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Jul 6 17:28:53 2009 -0400

    parisc: first pass of new-style ptrace for parisc
    
    This is going to be super nasty to gdb if we ever try to wire up
    PTRACE_(GET|SET){,FP}REGS since the format is different between
    coredump and pt_regs.
    
    Hopefully this maintains the coredump ABI. Let's test and see.
    (This commit will get squashed later, once I fix the build several
    times over I suspect.)
    
    Definitely-not-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


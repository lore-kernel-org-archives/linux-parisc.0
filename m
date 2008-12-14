From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Sun, 14 Dec 2008 02:57:39 GMT
Message-ID: <200812140257.mBE2vds9017600@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 14e01f8241387e4c236148bfaca77e3e546ad94d
Author: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date:   Sun Dec 14 11:44:37 2008 +0900

    parisc: remove dead BIO_VMERGE_BOUNDARY and BIO_VMERGE_MAX_SIZE definitions
    
    The block layer dropped the virtual merge feature
    (b8b3e16cfe6435d961f6aaebcfd52a1ff2a988c5). BIO_VMERGE_BOUNDARY and
    BIO_VMERGE_MAX_SIZE definitions are meaningless now.
    
    Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
    Acked-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


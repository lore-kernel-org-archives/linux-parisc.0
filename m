From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Thu, 2 Apr 2009 00:13:53 GMT
Message-ID: <200904020013.n320DrDU010176@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 1ab2eaa2c16c2467bbd94514ec6c1fe5129546c7
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Fri Mar 20 14:55:50 2009 +0000

    parisc: led: remove proc_dir_entry::owner
    
    proc_dir_entry::owner was removed in 0702c1c1a4
    (proc 2/2: remove struct proc_dir_entry::owner)
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 47e669ce10901dc92960096653d6b22990b5188f
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Sun Mar 22 03:58:40 2009 +0000

    parisc: fix macro expansion in atomic.h
    
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


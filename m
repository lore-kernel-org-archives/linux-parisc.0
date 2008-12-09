From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Tue, 9 Dec 2008 22:16:27 GMT
Message-ID: <200812092216.mB9MGRn9020970@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 5782dc68d2899f30a531261e7288a40cc46821f7
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Thu Dec 4 10:12:41 2008 +1030

    parisc: remove gratuitous cpu_online_map declaration.
    
    This is defined in linux/cpumask.h (included in this file already),
    and this will break when the definition changes (in a following patch).
    
    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] The parisc SMP boot problem
Date: Sun, 18 Feb 2007 11:44:13 -0600
Message-ID: <1171820653.3423.22.camel__39132.812122307$1416624298$gmane$org@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <parisc-linux@lists.parisc-linux.org>,
 Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

After a bit more of an analysis of our changesets (I concluded it must
have been something we introduced).  This is the source of the SMP boot
hang on 2.6.20-rcX:

commit 01a9fa750904beed08814364fcbd7039eca8ec71
Author: Randolph <tausq@debian.org>
Date:   Mon Dec 11 16:07:51 2006 -0800

    Optimize TLB flush on SMP systems
    
    Signed-off-by: Randolph Chung <tausq@debian.org>

As predicted, the reason it passed all the tests at the time it was
introduced is that because of the piggin bug, we were only scheduling on
a single CPU, and so the SMP piece of this wasn't truly tested.

Reverting this patch allows ioz to boot correctly.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <hugh@veritas.com>
Received: from MTVMIME02.enterprise.veritas.com (bay-bridge.veritas.com
	[143.127.3.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99C9D482A
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 07:41:37 -0600 (MDT)
Received: from peculier ([10.10.188.58]) (895 bytes) by megami.veritas.com
	via sendmail with P:esmtp/R:smart_host/T:smtp
	(sender: <hugh@veritas.com>) id <m1BBZmg-0000fqC@megami.veritas.com>
	for
	<linux-kernel@vger.kernel.org>; Thu, 8 Apr 2004 06:41:34 -0700 (PDT)
	(Smail-3.2.0.101 1997-Dec-17 #15 built 2001-Aug-30)
Date: Thu, 8 Apr 2004 14:41:34 +0100 (BST)
From: Hugh Dickins <hugh@veritas.com>
To: Andrea Arcangeli <andrea@suse.de>
Message-ID: <Pine.LNX.4.44.0404081422380.7010-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Subject: [parisc-linux] rmap: parisc __flush_dcache_page
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Something to notice about that parisc __flush_dcache_page I sent you:
there's no locking around searching the tree for vmas; there was never
any locking around searching the list for vmas.  arm is similar, but
at least has no CONFIG_SMP, just a preemption issue.  Any ideas?

Thanks,
Hugh

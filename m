From: Hugh Dickins <hugh@veritas.com>
Subject: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 14:41:34 +0100 (BST)
Message-ID: <Pine.LNX.4.44.0404081422380.7010-100000__39248.3834563338$1416623343$gmane$org@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
To: Andrea Arcangeli <andrea@suse.de>
Return-Path: <hugh@veritas.com>
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

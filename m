Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C8D4482A
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 07:52:57 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i38Dqoa16259; Thu, 8 Apr 2004 09:52:50 -0400
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
From: James Bottomley <James.Bottomley@steeleye.com>
To: Hugh Dickins <hugh@veritas.com>
In-Reply-To: <Pine.LNX.4.44.0404081422380.7010-100000@localhost.localdomain>
References: <Pine.LNX.4.44.0404081422380.7010-100000@localhost.localdomain>
Content-Type: text/plain
Date: 08 Apr 2004 08:52:50 -0500
Message-Id: <1081432370.2105.77.camel@mulgrave>
Mime-Version: 1.0
Cc: Andrea Arcangeli <andrea@suse.de>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 2004-04-08 at 08:41, Hugh Dickins wrote:
> Something to notice about that parisc __flush_dcache_page I sent you:
> there's no locking around searching the tree for vmas; there was never
> any locking around searching the list for vmas.  arm is similar, but
> at least has no CONFIG_SMP, just a preemption issue.  Any ideas?

I don't think you sent it to the parisc list?

I'm afraid we've just been pretty heavily updating flush_dcache_page
recently to fill a number of holes in the implementation.

As far as list traversal goes...we don't require the list to freeze:
acidentally flushing dead vmas would be harmless and added ones wouldn't
need flushing, so all we need would probably be a safe traversal and a
reference to prevent the vma being deallocated.

James

From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: 08 Apr 2004 08:52:50 -0500
Message-ID: <1081432370.2105.77.camel__27367.8819569342$1416623343$gmane$org@mulgrave>
References: <Pine.LNX.4.44.0404081422380.7010-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrea Arcangeli <andrea@suse.de>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: Hugh Dickins <hugh@veritas.com>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <Pine.LNX.4.44.0404081422380.7010-100000@localhost.localdomain>
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

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CBABE482B
	for <parisc-linux@parisc-linux.org>; Wed, 31 Oct 2001 11:51:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15z0SG-0007kh-00; Wed, 31 Oct 2001 18:51:12 +0000
Date: Wed, 31 Oct 2001 18:51:12 +0000
From: Matthew Wilcox <willy@debian.org>
To: "CARSON,KEVIN (HP-Canada,ex1)" <kevin_carson@hp.com>
Cc: 'Matthew Wilcox' <willy@debian.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] PA-RISC Linux VM
Message-ID: <20011031185112.D5120@parcelfarce.linux.theplanet.co.uk>
References: <B9957F974955D411829400D0B74FF27A04BF7ABB@xtor01.canada.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <B9957F974955D411829400D0B74FF27A04BF7ABB@xtor01.canada.hp.com>; from kevin_carson@hp.com on Wed, Oct 31, 2001 at 01:29:14PM -0500
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Oct 31, 2001 at 01:29:14PM -0500, CARSON,KEVIN (HP-Canada,ex1) wrote:
> The recent article in Byte
> (http://www.byte.com/documents/s=1436/byt20011024s0002/1029_moshe.html)
> makes me curious; is the current pa-risc Linux port using a Rik van Viel VM
> or Andrea Arcangeli VM or some pa-risc port specific design?
> 
> Is there possibly a large changeover looming dependent upon what shakes out
> in the Linus tree?

We're sticking with 2.4.9 until we see a Linus kernel that's a little
more stable.  That's from slightly before Linus introduced Andrea's VM.

i just posted a small patch we need to linux-mm
http://mail.nl.linux.org/linux-mm/2001-10/msg00098.html
which is the equivalent of the only major vm change that we have
in our tree.  There's a couple of minor ones:

diff -u -p -r1.1.1.5 -r1.8
--- mm/shmem.c  2001/08/15 16:33:42     1.1.1.5
+++ mm/shmem.c  2001/10/01 10:19:21     1.8
@@ -377,6 +377,7 @@ repeat:
                if (!page)
                        return ERR_PTR(-ENOMEM);
                clear_highpage(page);
+               flush_dcache_page(page);
                inode->i_blocks += BLOCKS_PER_PAGE;
                add_to_page_cache (page, mapping, idx);
        }
diff -u -p -r1.1.1.13 -r1.15
--- mm/vmscan.c 2001/08/16 22:10:13     1.1.1.13
+++ mm/vmscan.c 2001/09/06 09:44:13     1.15
@@ -120,6 +120,7 @@ static void try_to_swap_out(struct mm_st
         * any IO - it's already up-to-date on disk.
         */
        if (PageSwapCache(page)) {
+               flush_cache_page(vma, address);
                entry.val = page->index;
                if (pte_dirty(pte))
                        set_page_dirty(page);

I don't anticipate either of these changes being major merge problems.

-- 
Revolutions do not require corporate support.

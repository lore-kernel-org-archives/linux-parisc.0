Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49E014829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 14:53:12 -0700 (MST)
Date: Sun, 09 Mar 2003 13:31:28 -0800 (PST)
Message-Id: <20030309.133128.52483581.davem@redhat.com>
To: jsm@udlkern.fc.hp.com
Cc: parisc-linux@lists.parisc-linux.org
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <200303090351.UAA17796@udlkern.fc.hp.com>
References: <200303090351.UAA17796@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Subject: [parisc-linux] Re: RFC: mmap patch
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

   From: John Marvin <jsm@udlkern.fc.hp.com>
   Date: Sat, 8 Mar 2003 20:51:55 -0700 (MST)

   The tlb trick for clear_user_page is already implemented. The code for
   copy_user_page is there, but turned off due to an issue mentioned in my
   last email. I believe the failure case was not a frequent path, and there
   are ways of working around that problem.
   
Fix it by adding a thread flag, "TIF_NEED_ICACHE_FLUSH" or whatever,
and at the end of copy_user_page() if this bit is set you flush the
page from the destination instruction cache.

The flag is set in do_parisc_fault() if the fault is for a write
and:

	((vma->vm_flags & VM_EXEC) != 0 &&
	 vma->vm_file != NULL)

See the TIF_BLKCOMMIT logic in arch/sparc64/mm/fault.c

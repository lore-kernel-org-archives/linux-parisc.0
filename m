Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8220D4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 20:51:56 -0700 (MST)
Date: Sat, 8 Mar 2003 20:51:55 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200303090351.UAA17796@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: davem@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Sat, Mar 08, 2003 at 03:00:23PM -0800, David S. Miller wrote:
> ...
> Since about Nov 2002 we have been working on better {copy,clear}_user_page()
> implementations quietly inside HP.  Unfortunately some, uhm, "issues" are
> taking a long time to resolve before the routines can be published.
> Once those issues are resolved, I think your trick with temporary
> TLB entries can get implemented.
>
The tlb trick for clear_user_page is already implemented. The code for
copy_user_page is there, but turned off due to an issue mentioned in my
last email. I believe the failure case was not a frequent path, and there
are ways of working around that problem.

The address that the copying is done through (e,g. the tlb trick) is
independent of the algorithm used to actually do the copying.

John

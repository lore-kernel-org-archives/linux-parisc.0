Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABEC64829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 16:32:35 -0700 (MST)
Date: Sat, 8 Mar 2003 15:31:41 -0800
From: Randolph Chung <tausq@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, grundler@dsl2.external.hp.com,
	jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030308233141.GC11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030308172439.GA10161@dsl2.external.hp.com> <20030308.110459.35972945.davem@redhat.com> <20030308224503.L3865@parcelfarce.linux.theplanet.co.uk> <20030308.150023.97153009.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030308.150023.97153009.davem@redhat.com>
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

> You need merely 9MB of address space (2 * 4MB) if you implement
> my {copy,clear}_user_page() dynamic mapping hack, that will be
> tons more cheaper than any kmap based scheme and also be nicer
> on the TLB as there will be zero TLB changes occurring around
> the copy/clear.

i hope i'm not missing something obvious, but from what i understand
from this discussion, {copy,user}_user_page helps with the initial
syncing up of new mappings that are created for a process... but how
does this deal with syncing up changes afterwards? for that we still
need the flush_dcache_page to walk the user mappings right?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

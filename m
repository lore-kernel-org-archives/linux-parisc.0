Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8164A4873
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 09:51:00 -0700 (MST)
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on 2.5 kernel??
From: Ryan Bradetich <rbradetich@uswest.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030317163206.GE28607@parcelfarce.linux.theplanet.co.uk>
References: <1047917954.14507.15.camel@beavis.ybsoft.com>
	 <20030317163206.GE28607@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Message-Id: <1047919859.14507.21.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 17 Mar 2003 09:50:59 -0700
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

Good call willy!


> Hmm.  Back in 2.4, we had an RGH_HACK in fs/binfmt_elf.c which (iirc)
> was introduced to stop this error.  I'm not sure we ever tracked down the
> problem this was solving, but we thought it'd gone away with recent glibc.
> 
> I guess not.  I'm reluctant to bring the RGH_HACK forwards... but if
> someone did, it might help track down where this problem really is.

#undef the RGH_FIX in fs/binfmt_elf.c produces the same behaviour
on 2.4 as well.

Hopefully this will give someone a hint on the real problem.

Thanks!

- Ryan

-- 
Ryan Bradetich <rbradetich@uswest.net>

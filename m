Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4351F485A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 16:48:43 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16kw0U-0000Bh-00; Tue, 12 Mar 2002 23:48:38 +0000
Date: Tue, 12 Mar 2002 23:48:38 +0000
From: Matthew Wilcox <willy@debian.org>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error.
Message-ID: <20020312234838.K30538@parcelfarce.linux.theplanet.co.uk>
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com> <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk> <3C8E8520.EC6877E3@cup.hp.com> <20020312225858.A979E38556@carmen.fc.hp.com> <3C8E8A6F.2AD5761C@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C8E8A6F.2AD5761C@cup.hp.com>; from gururaj@cup.hp.com on Tue, Mar 12, 2002 at 03:08:31PM -0800
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

On Tue, Mar 12, 2002 at 03:08:31PM -0800, Gururaj Ananthateerta wrote:
> I did that, but the kernel panic during  boot and the following was the
> message
> on the screen.

> VFS: Mounted root (ext2 filesystem) readonly.
> NOT FREEING INITMEM (488k)
> INIT: version 2.84 booting

So, the kernel runs fine, until it starts executing userspace.  Here's
what we _think_ is going on:

The kernel has its own mappings for pages so it can take advantage of
16MB pages.  These are not coherent with the pages that are mapped into
user space.  By (ab)using the kmap() functionality, this problem can be
solved and may even result in a performance increase for all machines.
No real time to work on this...

-- 
Revolutions do not require corporate support.

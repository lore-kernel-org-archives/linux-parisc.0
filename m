Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDD4B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 21:12:15 -0700 (MST)
Date: Wed, 26 Mar 2003 23:12:40 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030327041240.GB18299@systemhalted>
References: <1048737294.8659.55.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1048737294.8659.55.camel@beavis.ybsoft.com>
Subject: [parisc-linux] Re: FWD: [PATCH] glibc fix for /lib/ld.so.1 (with attachments this time)
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

Ryan,

> Finally tracked down the glibc problem (with help from tausq and others
> :)).  I have attached the changelog entry, and the dpatch.  I am
> assuming you will push it upstream Carlos?

Looks good. It looks like the only real way to solve this since ia64 and
powerpc64 have similar entry.h macro's.
 
> This is why the ENTRY_POINT macro is uglier than really necessary.
 
Not any uglier than the ia64 and powerpc64 macro's that do similar
things ;)

Thank you very much for working on this! :)

c.

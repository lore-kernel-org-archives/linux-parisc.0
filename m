Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8044482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 16:25:54 -0600 (MDT)
Date: Mon, 03 Sep 2001 15:24:43 -0700 (PDT)
Message-Id: <20010903.152443.59467554.davem@redhat.com>
To: Ulrich.Weigand@de.ibm.com
Cc: Richard.Zidlicky@stud.informatik.uni-erlangen.de,
	thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <OF9A995335.07A81CF5-ONC1256ABC.00422A7B@de.ibm.com>
References: <OF9A995335.07A81CF5-ONC1256ABC.00422A7B@de.ibm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Subject: [parisc-linux] Re: [SOLVED + PATCH]: documented Oops running big-endian reiserfs
 on parisc architecture
List-ID: <linux-parisc.vger.kernel.org>

   From: "Ulrich Weigand" <Ulrich.Weigand@de.ibm.com>
   Date: Mon, 3 Sep 2001 14:08:43 +0200
   
   >From what I recall when we were looking into reiserfs on S/390,
   the core problem was that reiserfs tried to do *atomic* operations
   on non-aligned words.  This isn't supported by the hardware on
   S/390 (normal non-aligned accesses just work).
   
   I don't really see how this can be fixed in a trap handler; how
   would the handler guarantee atomicity?

Oh thats different!  That won't even work %100 correctly on x86.  On
x86 it will "execute", but it won't be atomic.

Why the F*CK does it need to do this?  It sounds like sloppy
programming to me.

Later,
David S. Miller
davem@redhat.com

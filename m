Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2C28482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 07:14:17 -0700 (MST)
Date: Thu, 20 Mar 2003 09:14:08 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on 2.5 kernel??
Message-ID: <20030320141408.GB25896@systemhalted>
References: <1047917954.14507.15.camel@beavis.ybsoft.com> <20030317163206.GE28607@parcelfarce.linux.theplanet.co.uk> <1047919859.14507.21.camel@beavis.ybsoft.com> <1047972053.19011.14.camel@beavis.ybsoft.com> <1048148150.19036.11.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1048148150.19036.11.camel@beavis.ybsoft.com>
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

> 	user_entry: 41001fb4
> 	ENTRY_POINT: 41027082

Intereting...
 
> Since they are different, the if statement fails... My belief
> is they should be the same when /lib/ld.so.1 is called because
> of the following comment inside this if statement:

I wouldn't trust code comments.
 
> to me there looks like two things that could be wrong:
> 
> 1.  The exec->e_entry needs to be fixed in the kernel, so it matches
>     the _start of the library.
> 
> 2.  The ENTRY_POINT needs to be changed in glibc for parisc-linux.
> 
> I am planning to pursue option 1 unless someone thinks option 2 is the
> correct option to pursue.

Would you be willing to ask this question on
libc-alpha@sources.redhat.com? If not, I could push the question out
there and see what the official solution should be and why.

I'm interested to know why this broke? :)

c.

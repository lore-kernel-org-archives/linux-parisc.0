Return-Path: <lamont@mmjgroup.com>
Received: from mmjgroup.com (mmjgroup.com [192.34.35.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id B254648BE
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 18:16:47 -0700 (MST)
Date: Tue, 16 Dec 2003 18:16:43 -0700
From: LaMont Jones <lamont@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Question about cache flushing and fork
Message-ID: <20031217011643.GH25535@mmjgroup.com>
References: <1071621405.2080.160.camel@mulgrave>
	<200312170057.hBH0vG4I002151@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200312170057.hBH0vG4I002151@hiauly1.hia.nrc.ca>
Cc: James Bottomley <James.Bottomley@steeleye.com>, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Dec 16, 2003 at 07:57:16PM -0500, John David Anglin wrote:
> > If we think the cache line is *smaller* than it actually is, all this
> > does is issue more flushes than necessary to the cache lines, I don't
> > understand how it results in an observable failure.
> In the particular case at hand, I noticed that calls to nested functions
> were broken on hppa64-hpux11.11.  Nested calls in GCC are done with a stack
> trampoline.  The 64-bit trampoline was in fact 72 bytes long.  GCC
> was using a line length of 32.  Because the trampoline has 16 byte alignment,
> it was possible to hit an alignment situation were the stack code didn't
> get flushed.

OK.  Note also that the sp is supposed to always be 64-byte aligned...

> After I made the GCC change, I noticed the trampoline-1.c test failed
> on a C200 but not on the A500 that I did the original fix on.  It appears
> the C200 has line length of 32 bytes.  As the C200 contains a PA 2.0
> processor, the above comment would appear incorrect.  Probably, trying
> to run a kernel built with CONFIG_PA20 defined on a C200 would fail
> because the line length specified above is *larger* than the actual
> line length.

I expect you are correct here - again, no hard knowledge of that processor
on my part.

Assuming a 32-byte cache line on a 64-byte-cache-line machine should not
cause any issues (other than performance issues, that is..)

lamont

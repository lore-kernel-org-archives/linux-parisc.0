Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2DD194875
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 17:37:16 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBH0b6a12314; Tue, 16 Dec 2003 19:37:07 -0500
Subject: Re: [parisc-linux] Question about cache flushing and fork
From: James Bottomley <James.Bottomley@steeleye.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200312160506.hBG56wnD015891@hiauly1.hia.nrc.ca>
References: <200312160506.hBG56wnD015891@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 16 Dec 2003 19:36:44 -0500
Message-Id: <1071621405.2080.160.camel@mulgrave>
Mime-Version: 1.0
Cc: randolph@tausq.org, PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I have a different cache question.  GCC uses a stack trampoline
> to call nested functions.  This trampoline is on the stack and
> has to be flushed before being used.  A few weeks ago a trampoline
> testcase was added.  This testcase failed under hppa64-hpux.  It
> turned out that the code assumed that the PA 2.0 cache line was
> 32 bytes (it was apparently derived from the original PA 1.1 code).

Could you elaborate on the context for this?  It was my understanding
that to flush an area for execution, you simply loop over the area
striding by the cache line width, issuing fdc; fic. (at least, that's
how we do it in the kernel).

If we think the cache line is *smaller* than it actually is, all this
does is issue more flushes than necessary to the cache lines, I don't
understand how it results in an observable failure.

James

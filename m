Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60B914829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 20:13:49 -0700 (MST)
Date: Sun, 12 Jan 2003 19:11:09 -0800
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Luigi Gangitano <luigi@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Issues with seteuid()?
Message-ID: <20030113031109.GI1177@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <1042386569.3329.4.camel@luigi> <20030113030635.I26554@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030113030635.I26554@parcelfarce.linux.theplanet.co.uk>
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

> I wonder how it can be a problem at all.  The kernel implements only
> sys_setresuid() and i would imagine that glibc implements both
> seteuid() and setresuid() in terms of this system call.
> 
> Perhaps someone who's willing to touch glibc would care to comment?

seteuid() works fine in simple tests. i don't think it's seteuid...
something else is broken. can someone provide a simple test case for the
segfault?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

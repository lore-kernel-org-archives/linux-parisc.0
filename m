Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C3964847
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 10:49:53 -0600 (MDT)
Date: Wed, 16 Jul 2003 09:53:28 -0700
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.6.0-test1-pa1 64bits failled to compile
Message-ID: <20030716165328.GK30257@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <3F0C24F800000FBF@ocpmta8.freegates.net> <20030716163754.GL23808@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030716163754.GL23808@parcelfarce.linux.theplanet.co.uk>
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

In reference to a message from Matthew Wilcox, dated Jul 16:
> On Wed, Jul 16, 2003 at 06:35:44PM +0200, Joel Soete wrote:
> > This today cvs update failled to compile on my N4000-55 with this very short
> > message:
> > 
> >   LD      init/built-in.o
> >   LD      .tmp_vmlinux1
> > make: *** [.tmp_vmlinux1] Error 139
> > palx4000:/usr/src/linux-2.6.0-test1-pa1# 
> 
> that's make segfaulting.  139 is 128 + 11 == signal 11 == segfault.

and the workaround for this for now is to disable CONFIG_KALLSYMS. I
sent Dave a patch to review to fix this problem last night. let's see
how that goes.

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81CEA482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 05:55:31 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17DOWg-000299-00; Thu, 30 May 2002 12:55:30 +0100
Date: Thu, 30 May 2002 12:55:30 +0100
From: Matthew Wilcox <willy@debian.org>
To: marc <marc@centraltx.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Java and SSH
Message-ID: <20020530125530.X10366@parcelfarce.linux.theplanet.co.uk>
References: <200205300023.AA908198370@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200205300023.AA908198370@mail.centraltx.com>; from marc@centraltx.com on Thu, May 30, 2002 at 12:23:49AM -0500
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

On Thu, May 30, 2002 at 12:23:49AM -0500, marc  wrote:
> seki:/etc/apt# apt-get install kaffe
> Reading Package Lists... Done
> Building Dependency Tree... Done
> Package kaffe has no available version, but exists in the database.
> This typically means that the package was mentioned in a dependency and
> never uploaded, has been obsoleted or is not available with the contents
> of sources.list
> E: Package kaffe has no installation candidate

looks like no-one's managed to get kaffe built on hppa.  gcj doesn't seem
to be available for hppa either.  In fact, kaffe is only available for
alpha, arm, i386, m68k, powerpc, sparc (ie hppa, ia64, mips, mipsel &
s390 haven't managed to get it working yet).  gcj seems to be available
on everything but hppa, mips & mipsel.  I don't know how much effort is
involved in making these things work.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32A2D4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 20:06:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Xuvr-00017L-00; Mon, 13 Jan 2003 03:06:35 +0000
Date: Mon, 13 Jan 2003 03:06:35 +0000
From: Matthew Wilcox <willy@debian.org>
To: Luigi Gangitano <luigi@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Issues with seteuid()?
Message-ID: <20030113030635.I26554@parcelfarce.linux.theplanet.co.uk>
References: <1042386569.3329.4.camel@luigi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1042386569.3329.4.camel@luigi>; from luigi@debian.org on Sun, Jan 12, 2003 at 04:49:29PM +0100
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

On Sun, Jan 12, 2003 at 04:49:29PM +0100, Luigi Gangitano wrote:
> I'm the Debian package maintainer for Squid (HTTP Proxy). I received the
> forwarded bug report describing issues in seteuid() on palinux. While
> using seteuid(), forked processes terminate with SEGV.
> 
> Is it a known problem?

I wonder how it can be a problem at all.  The kernel implements only
sys_setresuid() and i would imagine that glibc implements both
seteuid() and setresuid() in terms of this system call.

Perhaps someone who's willing to touch glibc would care to comment?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

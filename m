Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0A2848C4
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 11:53:46 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8SHreq22071;
	Sun, 28 Sep 2003 13:53:40 -0400
Subject: Re: [parisc-linux] pthread attributes and stack positions (gcc
	related?)
From: James Bottomley <James.Bottomley@steeleye.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Randolph Chung <tausq@debian.org>
In-Reply-To: <20030928174226.GA3040@systemhalted>
References: <20030928174226.GA3040@systemhalted>
Content-Type: text/plain
Date: 28 Sep 2003 12:53:38 -0500
Message-Id: <1064771620.10778.5.camel@mulgrave>
Mime-Version: 1.0
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

On Sun, 2003-09-28 at 12:42, Carlos O'Donell wrote:
> The variable is definately on the process stack. The thread's stack 
> address seems to be inside the libraries 'writable' space and the stack 
> size is wrong (or uninitialized). Perhaps I should just be looking for 
> arch-dependant init code that we might be missing.

This, I believe to be correct: there's only one real stack (i.e. the
thing on x86 that grows down from top of memory) and only one thread can
have it.  The rest of the thread stacks are mmapped at fixed sizes with
a guard area to prevent them growing too far.  mmapped memory comes out
of the same pool that shared library memory comes from, so you should
correctly see the mappings interleave (depending on the load and thread
start order).

James

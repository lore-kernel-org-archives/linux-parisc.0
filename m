Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 056AB4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Sep 2003 09:13:59 -0600 (MDT)
Date: Mon, 29 Sep 2003 11:10:38 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] pthread attributes and stack positions (gcc related?)
Message-ID: <20030929151038.GC15180@systemhalted>
References: <20030928174226.GA3040@systemhalted> <1064771620.10778.5.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1064771620.10778.5.camel@mulgrave>
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

On Sun, Sep 28, 2003 at 12:53:38PM -0500, James Bottomley wrote:
> On Sun, 2003-09-28 at 12:42, Carlos O'Donell wrote:
> > The variable is definately on the process stack. The thread's stack 
> > address seems to be inside the libraries 'writable' space and the stack 
> > size is wrong (or uninitialized). Perhaps I should just be looking for 
> > arch-dependant init code that we might be missing.
> 
> This, I believe to be correct: there's only one real stack (i.e. the
> thing on x86 that grows down from top of memory) and only one thread can
> have it.  The rest of the thread stacks are mmapped at fixed sizes with
> a guard area to prevent them growing too far.  mmapped memory comes out
> of the same pool that shared library memory comes from, so you should
> correctly see the mappings interleave (depending on the load and thread
> start order).

I agree, it seems though that after "fork" the values returned by 
"pthread_getattr_np (pthread_self (), &a);" are bogus. While if you call
pthread_create(...) and then the previous line from within the newly
created thread the values are initialized properly. A mistake might
exist with symbol versioning by which we are not calling libpthread's
overloaded thread manager "fork()" and continuing on with the normal syscall.

I think this seems to be a question of expected behaviour. I'll pass
this onto the libc-alpha list.

c.

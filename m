Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 501F0491D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Oct 2003 10:44:30 -0600 (MDT)
Date: Wed, 15 Oct 2003 12:40:47 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jakub Jelinek <jakub@redhat.com>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031015164047.GA31385@systemhalted>
References: <20031012213734.GJ23999@systemhalted> <20031015053431.GE12344@sunsite.ms.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031015053431.GE12344@sunsite.ms.mff.cuni.cz>
Subject: [parisc-linux] Re: [PATCH] _STACK_GROWS_UP fixes.
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

On Wed, Oct 15, 2003 at 07:34:31AM +0200, Jakub Jelinek wrote:
> On Sun, Oct 12, 2003 at 05:37:34PM -0400, Carlos O'Donell wrote:
> > 2003-10-06  Carlos O'Donell <carlos@baldric.uwo.ca>
> > 
> > 	* pthread.c (__pthread_self_stack): _STACK_GROWS_UP case added.
> > 	(__pthread_find_self): Likewise.
> > 	* manager.c (thread_segment): _STACK_GROWS_UP case added.
> 
> You need to look at linuxthreads/attr.c (__pthread_attr_getstack) too
> (the recent code which parses /proc/self/maps and finds stack VMA in there).

That should hopefully explain the regression in tst-attr1, I hadn't
tracked it down yet, but I knew that some other STACK_GROWS_UP problems
might exist.

Thanks Jakub.

c.

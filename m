Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sunsite.ms.mff.cuni.cz (sunsite.ms.mff.cuni.cz [195.113.19.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id C29FB48AC
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Oct 2003 01:37:49 -0600 (MDT)
Date: Wed, 15 Oct 2003 07:34:31 +0200
From: Jakub Jelinek <jakub@redhat.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031015053431.GE12344@sunsite.ms.mff.cuni.cz>
Reply-To: Jakub Jelinek <jakub@redhat.com>
References: <20031012213734.GJ23999@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031012213734.GJ23999@systemhalted>
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

On Sun, Oct 12, 2003 at 05:37:34PM -0400, Carlos O'Donell wrote:
> 2003-10-06  Carlos O'Donell <carlos@baldric.uwo.ca>
> 
> 	* pthread.c (__pthread_self_stack): _STACK_GROWS_UP case added.
> 	(__pthread_find_self): Likewise.
> 	* manager.c (thread_segment): _STACK_GROWS_UP case added.

You need to look at linuxthreads/attr.c (__pthread_attr_getstack) too
(the recent code which parses /proc/self/maps and finds stack VMA in there).

	Jakub

From: Jakub Jelinek <jakub@redhat.com>
Subject: [parisc-linux] Re: [PATCH] _STACK_GROWS_UP fixes.
Date: Wed, 15 Oct 2003 07:34:31 +0200
Message-ID: <20031015053431.GE12344__12675.1989046626$1416622876$gmane$org@sunsite.ms.mff.cuni.cz>
References: <20031012213734.GJ23999@systemhalted>
Reply-To: Jakub Jelinek <jakub@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031012213734.GJ23999@systemhalted>
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

From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [PATCH] oldsemaphore fixup for hppa (4/3?)
Date: Sun, 12 Oct 2003 17:35:37 -0400
Message-ID: <20031012213537.GI23999__18713.9636058875$1416622868$gmane$org@systemhalted>
References: <20031010210438.GI6454@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031010210438.GI6454@systemhalted>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Oct 10, 2003 at 05:04:38PM -0400, Carlos O'Donell wrote:
> 
> libc-alpha,
> 
> Wrote up the changelogs, reviewed them, and then forgot I had a small
> patch to commit for oldsemaphore. This goes in with the first patch 1/3
> that defines the generic libc changes required for linuxthreads to work
> on HPPA.
> 
> Cheers,
> Carlos
> ===
> 
> 2003-10-10  Carlos O'Donell  <carlos@baldric.uwo.ca>
> 
> 	* linuxthreads/oldsemaphore.c:	sem_spinlock in struct old_sem_t 
> 	is an __atomic_lock_t.

Patch has been moved into (1/3, Round 2).

c.

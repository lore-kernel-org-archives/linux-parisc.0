From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] glibc hppa - get/set/make/swap/context() & non-atomic ops
Date: Tue, 27 Aug 2002 11:14:53 -0400
Message-ID: <20020827151453.GA6100__178.692295640026$1416621652$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-glibc@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

PA'ers,

Comments or thoughts about the following issues would be appreciated.

These items are taken from my collection of TODO notes for glibc,
and were recently added by comments from Helge and Willy.

- Implement make/swap/set/get/context() calls in glibc
        = Don't know what's needed... can probably learn
        = about the calls from other arches.
        - Doesn't look like it will be that hard.
        - Helge brought the issue up since SAPDB relies
        - on this to work properly (www.sapdb.org)
	- With mcontext working properly... these calls
	- _should_ work :}
	* Didn't know these were broken or missing.

- Make atomic ops atomic
        = Need to implement exhcange_and_add/atomic_add
        = and compare_and_swap.
        - I have no idea how hard this will be.
        - PA has a single atomic operation called ldcw
        - Which is 'load and zero' ... we currently use
        - this to implement locking primities.
        * Are we going to have to use spinlocks to
        * handle the atomic operations?
	* I see 11 uses of generic/atomicity.h that need
	* to be fixed.

Cheers,
Carlos.

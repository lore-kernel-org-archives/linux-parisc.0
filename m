From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [Preliminary] HPPA Patches for glibc 2.3.2
Date: Sun, 23 Mar 2003 22:10:32 -0500
Message-ID: <20030324031032.GA27086__49944.8300143287$1416622320$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
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

Hackers,

The following is the set of preliminary patches allows HPPA to build a
semi-functional 32-bit GLibc (against upstream CVS head as of today).

http://www.baldric.uwo.ca/~carlos/glibc-2.3.2-patches.tar.gz

I'm almost certain that I _don't_ have the sysdep-cancel code correctly
implemented, but I'll have another go when I get some more free time.

Please do not commit this to the CVS, this is purely experimental for
anyone who wants to try building upstream source + patches for HPPA. I
can think of atleast 2 people who might, so I'm providing these patches
as a snapshot of my current work.

Comments on sysdep-cancel.h changes are more than welcome since it has
to be wrong because the tst-cancel* failures are blatent (and my PA
assembly prolly has a bug).

Cheers,
Carlos.

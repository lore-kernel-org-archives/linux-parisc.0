From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Function descriptors fall behind Sysdep-cancel, Less failures, and ABI files for Roland.
Date: Tue, 25 Mar 2003 19:50:41 -0500
Message-ID: <20030326005041.GB30578__30582.3596347638$1416622330$gmane$org@systemhalted>
References: <1048493134.8777.22.camel@beavis.ybsoft.com> <jeptohumcp.fsf@sykes.suse.de> <20030324184447.GA26572@uswest.net> <20030325081207.B18730@lucon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org,
	Ryan Bradetich <rbrad@uswest.net>, Randolph Chung <tausq@debian.org>
To: "H. J. Lu" <hjl@lucon.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030325081207.B18730@lucon.org>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I posted a patch a long time ago to unify function descriptor handling
> such that ia64 and pa-risc don't have to reinvent the wheel.

Your patch is definately the correct way to go. When I initially
recommended that Ryan take the issue to the list I didn't realize it was
a function descriptor issue.  

Unfortunately it falls behind the following changes:
	- Sysdep-cancel support.
	- Building glibc without severe testsuite failures
	- Handing Roland the ABI files for HPPA.

After this I plan to follow up on the required function descriptor 
changes, all along the lines of the current ia64/ppc64 implementation.

Current HPPA glibc status:
- New LinuxThreads that doesn't require explicit alignment of locks.
- 2.3.2 builds, various failures.
- Fixing sysdep-cancel support.

I should start sending the patches back here soon.

c.

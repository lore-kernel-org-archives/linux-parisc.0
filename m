From: Grant Grundler <iod00d@hp.com>
Subject: [parisc-linux] Re: [patch 2.6.11-rc3-bk4] Correctly dereference
	ia64_mca_data
Date: Wed, 9 Feb 2005 23:13:04 -0800
Message-ID: <20050210071304.GB26047@esmail.cup.hp.com>
References: <B8E391BBE9FE384DAA4C5C003888BE6F02E2BD9D@scsmsx401.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <B8E391BBE9FE384DAA4C5C003888BE6F02E2BD9D@scsmsx401.amr.corp.intel.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Feb 09, 2005 at 04:18:16PM -0800, Luck, Tony wrote:
> >Likely yes.
> >That's one of two errors I see on parisc-linux when a register
> >is corrupted (segfaults are the symptom). And unfortunately
> >the context switching has a corner case the tickles that bug
> >on a regular basis. :^(
> 
> I wrote a test program that loads up random values into registers
> (just r1-r31, a bunch of stacked registers, and f2-f127 for now)
> and then checks that all the registers haven't changed value a
> few thousand times, before reloading with a new set of random
> values.

Does anyone have an interest in writing such a program for parisc?

The above comes from the ia64-linux mailing list.

We can run multiple instances on one cpu to test
the basic context switching is working right.

If it fails consistently with the same register getting corrupted,
(gr26 is a suspect now), a code audit would be useful to confirm
that the particular register is always getting properly saved/restored
in a context switch.

If this test does NOT fail, then I'll suspect something with
our syscall/glibc interface is fishy.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

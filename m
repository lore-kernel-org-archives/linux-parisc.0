From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux]      Heads up, 2.6.7-pa0 FTBS with 64-bit toolchain
Date: Mon, 21 Jun 2004 12:36:21 -0400
Message-ID: <20040621163621.GG16360@baldric.uwo.ca>
References: <200406200029.i5K0T1re007012@hiauly1.hia.nrc.ca>
	<200406200114.i5K1ESYp007238@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200406200114.i5K1ESYp007238@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 19, 2004 at 09:14:28PM -0400, John David Anglin wrote:
> > I believe that I understand the cause of this bug and have started
> > testing a fix.
> 
> Enclosed is the patch that I am testing.  It seems to generated reasonable
> code for the testcase that Carlos submitted today.  As far as I can tell,
> the bug has been present in the FSF sources since the first support for
> the 64-bit port (3.0 branch).  Thus, I expect the bug is present in debian
> 3.0.4, just not triggered.  The bug is triggered by the loop optimizer.
> 
> I would be interested in hearing if this solves the kernel build problem.
> The patch is for 3.5.  It might need a bit of hacking to apply it to
> earlier branches.

I re-read the last email about "bugs getting fixed if you show that the
community has interest", so I simplified randolph's bug down to a simple
structure alignment issue with two structures :) I'm glad to see that
was of some help in clarifying the bug.

I also estatic that you fixed this bug, it means I can start compiling
64-bit kernels again.

Kudos to Matthias for the hppa64-linux-gcc debs :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

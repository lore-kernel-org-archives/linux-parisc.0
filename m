From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux]      Heads up, 2.6.7-pa0 FTBS with 64-bit toolchain
Date: Sun, 20 Jun 2004 12:24:46 +0200
Message-ID: <16597.26094.175650.225420@gargle.gargle.HOWL>
References: <200406200029.i5K0T1re007012@hiauly1.hia.nrc.ca>
	<200406200114.i5K1ESYp007238@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
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

John David Anglin writes:
> > > Kyle McMartin wrote:
> > > > On Fri, Jun 18, 2004 at 07:17:14PM -0600, Grant Grundler wrote:
> > > > 
> > > >>Should I be testing 64-bit kernels built with this toolchain
> > > >>or stick with my trusty gcc 3.0.4-hppa64 handmade debs?
> > > >>
> > > > 
> > > > There's a bug in hppa64 gcc sometime after 3.0.4 (it shows up in the
> > > > gcc-3.3-hppa64 and gcc-3.4-hppa64 debs) that causes builds to fail in
> > > > (at least) loop.c.
> > > > 
> > > > http://gcc.gnu.org/bugzilla/show_bug.cgi?id=14782 is the bug Randolph
> > > > filed.
> > 
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

updated packages at

http://people.debian.org/~doko/gcc-3.3/gcc-3.3-hppa64_3.3.4-1_hppa.deb
http://people.debian.org/~doko/gcc-3.4/gcc-3.4-hppa64_3.4.0-3_hppa.deb

install the latter using dpkg -i --force-depends
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux]      Heads up, 2.6.7-pa0 FTBS with 64-bit toolchain
Date: Sat, 19 Jun 2004 20:29:01 -0400 (EDT)
Message-ID: <200406200029.i5K0T1re007012@hiauly1.hia.nrc.ca>
References: <40D4C53E.5000309@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40D4C53E.5000309@tiscali.be> from "Joel Soete" at Jun 19,
	2004 10:59:10 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> regarding the pb of pointer comparison with gcc-3.3 and 3.4 64bits (sorry I didn't find back the gcc bug report reference) which 
> iirc jda re-qualified it in a binutils pb. (That why of my interest in binutils 2.15 :) to see if I can help.)

I don't know of any hppa64 bugs involving pointer comparison.  The cause
of the binutils bug is known:

<http://sources.redhat.com/ml/binutils/2004-06/msg00211.html>.

Until this is fixed, don't use cvs binutils from the trunk after
2004-05-11 17:08:32.

> Kyle McMartin wrote:
> > On Fri, Jun 18, 2004 at 07:17:14PM -0600, Grant Grundler wrote:
> > 
> >>Should I be testing 64-bit kernels built with this toolchain
> >>or stick with my trusty gcc 3.0.4-hppa64 handmade debs?
> >>
> > 
> > There's a bug in hppa64 gcc sometime after 3.0.4 (it shows up in the
> > gcc-3.3-hppa64 and gcc-3.4-hppa64 debs) that causes builds to fail in
> > (at least) loop.c.
> > 
> > http://gcc.gnu.org/bugzilla/show_bug.cgi?id=14782 is the bug Randolph
> > filed.

I believe that I understand the cause of this bug and have started
testing a fix.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] c3k panics
Date: Sun, 29 May 2005 19:39:54 -0400 (EDT)
Message-ID: <200505292339.j4TNdtYu026757@hiauly1.hia.nrc.ca>
References: <20050529220827.GF749@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050529220827.GF749@baldric.uwo.ca> from "Carlos O'Donell" at
	May 29, 2005 06:08:28 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, May 28, 2005 at 09:50:38PM -0400, John David Anglin wrote:
> > > I can panic my c3750 very consistently running the binutils testsuite
> > > (cvs source as of 20050526).  I've tried many of the default kernels
> > > to see if I could isolate when the problem was introduced.  The last
> > > kernel that seems unaffected is 2.6.8.1-pa11.  The problem is present
> > > in 2.6.12-rc5-pa0 and 2.6.11-pa4.
> > 
> > Hmmm, just noticed that as-new may be using all of the machines memory
> > and swap space.
> 
> Neither of these situations should kill the kernel.
> Why doesn't OOM kill the process?

I agree but we don't get any error messages, so it's hard to tell.

I can avoid the problem with ulimit -v.  However, this doesn't fix
all the stability problems.  I've had two kernel hangs since.  r2
is pointing to the return of the call to getname near the beginning
of sys_rmdir.  The IIA Offset addresses in the TOC dump point into
the fault_vector_20 jump table.  One was here:

	b,l <intr_save>,r0
==>	ldi 9, r8

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

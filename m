From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 24 Mar 2005 12:35:09 -0500 (EST)
Message-ID: <200503241735.j2OHZ9q0008488@hiauly1.hia.nrc.ca>
References: <20050324165947.GA29361@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050324165947.GA29361@colo.lackof.org> from "Grant Grundler" at
	Mar 24, 2005 09:59:47 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Mar 24, 2005 at 11:19:28AM -0500, John David Anglin wrote:
> ...
> > From a PA standpoint, GCC 4 is ready for serious testing.  All testsuite
> > bugs have been squashed in C and C++.
> 
> Is there a .deb or tarball available I can drop on a bunch of machines?

There is a recent build in /home/dave/opt/gnu/gcc/gcc-4.0.0 on gsyprf11.
Unfortunately, it was built using --with-as= and --with-ld=, so it isn't
very portable.  I could do a build with the system's as and ld that
would be more portable.  I'm not setup to generate a .deb that would
be system installable.

You are welcome to try the version in /home/dave/opt/gnu/gcc/gcc-4.0.0.
It's easily turned into a tarball.

> I'd be happy to test for kernel builds.

That would provide useful.  In the past, there usually have been new
features or deprecated features that have caused problems.  4.0 has a
new option, -mfixed_range=, that was introduced so that a small range
of fp registers could be used for the xmpyu multiplication insn.  It
might be useful to experiment with this option to see if it useful.
This was borrowed from ia64.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

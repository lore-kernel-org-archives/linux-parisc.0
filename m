From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 24 Mar 2005 14:23:17 -0700
Message-ID: <20050324212317.GB29361@colo.lackof.org>
References: <20050324165947.GA29361@colo.lackof.org>
	<200503241735.j2OHZ9q0008488@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503241735.j2OHZ9q0008488@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Mar 24, 2005 at 12:35:09PM -0500, John David Anglin wrote:
> > On Thu, Mar 24, 2005 at 11:19:28AM -0500, John David Anglin wrote:
> > ...
> > > From a PA standpoint, GCC 4 is ready for serious testing.  All testsuite
> > > bugs have been squashed in C and C++.
> > 
> > Is there a .deb or tarball available I can drop on a bunch of machines?
> 
> There is a recent build in /home/dave/opt/gnu/gcc/gcc-4.0.0 on gsyprf11.

Randolph Chung pointed to another gcc-4.0 build on gsyprf7.
That's fine for me...but several other people would probably want to
try this out on other machines.  And I like to make use of distcc.
gcc-4.0 must be in the same place on several machines for distcc to work.

> Unfortunately, it was built using --with-as= and --with-ld=, so it isn't
> very portable.  I could do a build with the system's as and ld that
> would be more portable.  I'm not setup to generate a .deb that would
> be system installable.

A tarball will do for now. Let someone good at debian packaging
worry about that bit.
My preference is the tarball use directory names/places like
existing gcc-3.x versions do:

grundler@gsyprf11:~$ ls /usr/bin/*3.4
/usr/bin/cpp-3.4*     /usr/bin/hppa-linux-cpp-3.4@
/usr/bin/g++-3.4*     /usr/bin/hppa-linux-g++-3.4@
/usr/bin/gcc-3.4*     /usr/bin/hppa-linux-gcc-3.4@
/usr/bin/gccbug-3.4*  /usr/bin/hppa64-linux-cpp-3.4*
/usr/bin/gcov-3.4*    /usr/bin/hppa64-linux-gcc-3.4*

grundler@gsyprf11:~$ ls /usr/lib/gcc*/hppa*-linux/
/usr/lib/gcc-lib/hppa-linux/:
3.0.4/  3.3.5/

/usr/lib/gcc-lib/hppa64-linux/:
3.0.4/  3.3.3/  3.3.5/

/usr/lib/gcc/hppa-linux/:
3.4.4/

/usr/lib/gcc/hppa64-linux/:
3.4.4/

My assumption is a gcc-4.0 tarball won't clobber any existing files.
So if that's not possible with the above locations, /opt/gnu
would be fine too.


> You are welcome to try the version in /home/dave/opt/gnu/gcc/gcc-4.0.0.

Ok - I will over the next couple of days.

> It's easily turned into a tarball.

BTW, you can host the tarball on http://gsyprf11.e.h.c/~dave/.
Just "mkdir ~/public_html" and start dropping stuff in there.
Alternate URL is http://iou.parisc-linux.org/~dave/

Please advertise where/when a suitable one is available.

> > I'd be happy to test for kernel builds.
> 
> That would provide useful.  In the past, there usually have been new
> features or deprecated features that have caused problems.

ok

> 4.0 has a
> new option, -mfixed_range=, that was introduced so that a small range
> of fp registers could be used for the xmpyu multiplication insn.  It
> might be useful to experiment with this option to see if it useful.

I don't know enough about ABI to understand the issues here.
AFAIK, we currently are using FP registers because that's
the way multiplication is implemented in the integer math libs
we inherited.

> This was borrowed from ia64.

*nod*. I expect hppa can benefit for the same reasons: hppa has
quite a few FP regs and some things FP can just do alot faster.
I just don't know what "some things" consists of.

thanks,
grant

> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

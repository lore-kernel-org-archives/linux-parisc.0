From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Comments?
Date: Tue, 8 Mar 2005 12:47:16 -0500
Message-ID: <20050308174715.GU23803@baldric.uwo.ca>
References: <20050305194652.GG23803@baldric.uwo.ca>
	<200503052033.j25KXK8x007561@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503052033.j25KXK8x007561@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 05, 2005 at 03:33:20PM -0500, John David Anglin wrote:
> > > I think we have somehow broken __cffc.  I did a binutils build
> > > yesterday and various ld tests are now failing.  These are tests
> > > that compare function pointers.
> > 
> > I didn't feed anything new into debian-glibc. All my patches have always
> > strived to keep __cffc working, if I messup the function pointer
> > comparison I get a slew of glibc testsuite failures which I always
> > patchup by making sure __cffc works :)
> 
> I haven't touched fptr.c either, although there is a change in GCC
> 4.0 with respect to canonicalization.  I'm using the debian glibc,
> 2.3.2.ds1-20, on the system on which I noticed this problem.

I'm heavily leaning towards the addition/transition to OPD's for even
the 32-bit code. I wrote a document somewhere about handling that
transition transparently from the point of view of binutils/glibc.

I don't quite understand how to transition the use of __cffc in gcc over
to some sort of "simple compare."

I'll rustle up that document at some point. Right now I'm finding time
to finish testing the LA patches for glibc and move on to binutils
again.

As for the stdc++ failures, I'm not sure yet what causes them. Perhaps
I'll kick off a build.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

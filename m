From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sat, 20 Jun 2009 12:02:54 -0400 (EDT)
Message-ID: <20090620160255.440F24EF8@hiauly1.hia.nrc.ca>
References: <20090620143347.GA20249@roeckx.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: luk@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: kurt@roeckx.be (Kurt Roeckx)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620143347.GA20249@roeckx.be> from "Kurt Roeckx" at Jun 20, 2009 04:33:47 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Jun 19, 2009 at 05:15:26PM +0200, Kurt Roeckx wrote:
> > So it's my understanding that the porters have no idea about the
> > problems.  So I will start to mail you about problems as soon
> > as I see them and they look like porting issues specific
> > to hppa.
> 
> netgen fails to built with an internal compiler error since
> atleast April 2008.  Logs are at:
> https://buildd.debian.org/build.cgi?pkg=netgen;ver=4.4-15;arch=hppa
> https://buildd.debian.org/build.cgi?pkg=netgen;arch=hppa

g++ -c -I. -I../libsrc/interface -Iinclude -O2 -I/usr/include/GL -I/usr/include/tcl8.4 -I/usr/include/tk8.4 -I/usr/X11R6/include  -DLINUX -DOPENGL -DNGSOLVE basiclinalg/cholesky.cpp basiclinalg/calcinverse.cpp basiclinalg/vecmat.cpp basiclinalg/bandmatrix.cpp basiclinalg/eigensystem.cpp linalg/basevector.cpp linalg/vvector.cpp linalg/basematrix.cpp linalg/sparsematrix.cpp linalg/special_matrix.cpp linalg/cg.cpp linalg/chebyshev.cpp linalg/eigen.cpp linalg/order.cpp linalg/sparsecholesky.cpp linalg/pardisoinverse.cpp linalg/superluinverse.cpp linalg/jacobi.cpp linalg/blockjacobi.cpp linalg/commutingAMG.cpp ngstd/exception.cpp ngstd/table.cpp ngstd/bitarray.cpp ngstd/flags.cpp ngstd/symboltable.cpp ngstd/blockalloc.cpp ngstd/evalfunc.cpp ngstd/templates.cpp ngstd/localheap.cpp
linalg/basematrix.cpp: In member function 'void ngla::S_BaseMatrix<std::complex<double> >::_ZTv0_n72_NK4ngla12S_BaseMatrixISt7complexIdEE12MultTransAddES2_RKNS_10BaseVectorERS4_(ngbla::Complex, const ngla::BaseVector&, ngla::BaseVector&) const':
linalg/basematrix.cpp:208: internal compiler error: in expand_expr_addr_expr_1, at expr.c:6830
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions.

When an internal compiler error occurs as above, a GCC bug report with
the following information should be filed:

1) failing compiler command,
2) details of the compiler (gcc -v), and
3) the preprocessed source for the failing command.

You can CC me on hppa bugs (danglin at gcc dot gnu dot org).

It takes less than five minutes to generate the above information and
file a bug report.  The preprocessed source is really important as it
is very difficult for others to duplicate the problem otherwise.

In this case, it appears the following assert is triggered.

          /* If the DECL isn't in memory, then the DECL wasn't properly
	     marked TREE_ADDRESSABLE, which will be either a front-end
	     or a tree optimizer bug.  */
	  gcc_assert (MEM_P (result));

There's a fairly high probability that this is a generic bug.

If the bug is a compiler regression, then fixes will applied to all active
branches when available.  Thus, it is useful to know if an earlier compiler
version was able to successfully compile the file.

As things stand, I file more than 90% of hppa compiler bugs based on what
I see in my testing.  However, I'm not trying to build and maintain 10,000
packages.  So, hopefully, the debian build team can help a bit more with
problem reporting.

I recognize that not all bugs are easy to classify.  However, internal
compiler errors are always compiler bugs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

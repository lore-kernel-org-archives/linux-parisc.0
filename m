From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Sat, 13 Aug 2005 13:46:52 -0400 (EDT)
Message-ID: <200508131746.j7DHkqNo009063@hiauly1.hia.nrc.ca>
References: <1123940428.5037.2.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1123940428.5037.2.camel@mulgrave> from "James Bottomley" at Aug
	13, 2005 08:40:28 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, 2005-08-12 at 23:02 -0600, Grant Grundler wrote:
> > I expect this is the difference...I need to use the same g++ version.
> > Does someone want to hack a small test program that consumes
> > stack space until it bombs out becuase of the ulimit?
> 
> Here's a test program that does this:
> But the results are as expected (on 2.6.13-rc6-pa1):

It doesn't trigger the fault on my c3k with 2.6.13-rc3-pa1 either.

However,

cc1plus -O2 -ftemplate-depth-20000 inline4.C

consistently crashes my c3k.  There must be something more than
just running out of stack space.  Strangely, the system doesn't
crash when cc1plus is run under gdb.

dave@hiauly6:~/gnu/gcc-4.0/objdir/gcc$ ./cc1plus --version
GNU C++ version 4.1.0 20050813 (experimental) (hppa-linux)
        compiled by GNU C version 4.1.0 20050813 (experimental).
GGC heuristics: --param ggc-min-expand=30 --param ggc-min-heapsize=4096

Another TOC gave the following:

r2	0x1010c260	search_exception_tables+0x34
IIA	0x1020c76c	search_extable+0x10

I've seen this once before.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

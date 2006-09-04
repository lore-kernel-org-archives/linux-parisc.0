From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 4 Sep 2006 15:12:31 -0400 (EDT)
Message-ID: <200609041912.k84JCVWn027155@hiauly1.hia.nrc.ca>
References: <1157390636.3513.21.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1157390636.3513.21.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Sep 4, 2006 12:23:56 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, 2006-09-04 at 12:57 -0400, John David Anglin wrote:
> > There needs to be a check to ensure that the code has enough time
> > to set cr16 with the new compare time before the counter passes this
> > value.  If it misses, the counter will wrap.  This probably doesn't
> > need to be a full half tick if it's desireable to avoid negative
> > offsets.
> 
> Exactly!

The loop in the last timer patch that I sent, as compiled for a 32-bit 
c3k kernel, is four instructions.  Using a 500 us half tick time and
assuming a slow 50 MHz cpu, I estimate we should be able to handle
latencies up to about 6 seconds.  The maximum latency time for faster
cpus are proportionately longer.  That should be enough to handle most
circumstances except for an uninitialized tick value.  Another loop
could be added with a larger decrement if we need to handle larger
latencies.

I'd hoped that improving the handling of timer interrupts might
fix the behavior of expect, but it doesn't.  If I run the binutils
ld testsuite under load, it usually hangs at the end of the test:

dave     28731 28706  4 14:56 pts/1    00:00:25 expect -- /usr/share/dejagnu/runtest.exp --tool ld --srcdir /home/dave/gnu/binutils-2.16.91/src/ld/testsuite CC=gcc -L/home/dave/gnu/binutils-2.16.91/objdir/./ld CFLAGS=-g -O2 CXX=c++ -L/home/dave/gnu/binutils-2.16.91/objdir/./ld CXXFLAGS=-g -O2 CC_FOR_HOST=gcc CFLAGS_FOR_HOST=-g -O2 OFILES=ldgram.o ldlex.o lexsup.o ldlang.o mri.o ldctor.o ldmain.o ldwrite.o ldexp.o  ldemul.o ldver.o ldmisc.o ldfile.o ldcref.o ehppalinux.o  BFDLIB=../bfd/.libs/libbfd.a LIBIBERTY=../libiberty/libiberty.a  LIBS=
dave     28751 28731  0 14:56 pts/1    00:00:00 [expect] <defunct>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 26 Jul 2005 13:01:35 -0400
Message-ID: <20050726170109.GQ30182@systemhalted.org>
References: <1122036994.10454.131.camel@thor.tres.org>
	<20050725000919.GA18659@colo.lackof.org>
	<1122272788.10644.71.camel@thor.tres.org>
	<20050726132402.GA32722@colo.lackof.org>
	<1122385036.10644.146.camel@thor.tres.org>
	<20050726141837.GB6663@parcelfarce.linux.theplanet.co.uk>
	<42E647E8.3000505@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Tres Melton <tres@mindspring.com>,
 parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42E647E8.3000505@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 26, 2005 at 10:25:44PM +0800, Randolph Chung wrote:
> >User space should not "know" what HZ the kernel is using.  Instead, all
> >interfaces should be properly reported in terms of whatever HZ userspace
> >used to assume (100 on i386, other values on other platforms).  I don't
> >know what interface gprof is using, but it needs to be fixed.
> 
> I thought gprof uses a SIGPROF timer using the setitimer interface. Why 
> is it HZ dependent?

Even though you get a signal you have to calculate the elapsed time.
The profiling codes prefers "times" to "getrusage" to "clock."

Unfortunately to interpret "times" information you need to multiply by
ticks_to_msec.

IMO any interface exporting/using ticks is broken. Accurate time can 
be provided through other interfaces. Userspace should never see ticks,
only converted time.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

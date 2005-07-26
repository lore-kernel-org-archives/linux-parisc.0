From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 26 Jul 2005 14:08:53 -0400
Message-ID: <20050726180851.GB9703@systemhalted.org>
References: <1122036994.10454.131.camel@thor.tres.org>
	<20050725000919.GA18659@colo.lackof.org>
	<1122272788.10644.71.camel@thor.tres.org>
	<20050726132402.GA32722@colo.lackof.org>
	<1122385036.10644.146.camel@thor.tres.org>
	<20050726141837.GB6663@parcelfarce.linux.theplanet.co.uk>
	<42E647E8.3000505@tausq.org>
	<20050726170109.GQ30182@systemhalted.org>
	<20050726170949.GB2221@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Tres Melton <tres@mindspring.com>,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050726170949.GB2221@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 26, 2005 at 06:09:49PM +0100, Matthew Wilcox wrote:
> > IMO any interface exporting/using ticks is broken. Accurate time can 
> > be provided through other interfaces. Userspace should never see ticks,
> > only converted time.
> 
> userspace should see converted ticks.  ie divide by 10 if CONFIG_HZ is 1000
> since PA userspace expects to see 100Hz.

I meant "ideologicall" broken. Yes, converting ticks to an expected
value preserves userspace compatibility.

gprof may want to stop using times() when a more suitable interface
becomes available.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

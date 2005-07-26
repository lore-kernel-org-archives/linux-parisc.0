From: Tres Melton <tres@mindspring.com>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 26 Jul 2005 09:26:01 -0600
Message-ID: <1122391561.10644.155.camel@thor.tres.org>
References: <1122036994.10454.131.camel@thor.tres.org>
	<20050725000919.GA18659@colo.lackof.org>
	<1122272788.10644.71.camel@thor.tres.org>
	<20050726132402.GA32722@colo.lackof.org>
	<1122385036.10644.146.camel@thor.tres.org>
	<20050726141837.GB6663@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050726141837.GB6663@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2005-07-26 at 15:18 +0100, Matthew Wilcox wrote:
> On Tue, Jul 26, 2005 at 07:37:16AM -0600, Tres Melton wrote:
> > I'm advocating a way for user space to *know* what the kernel is
> > running.  It is this thinking crap that is messing things up.
> 
> User space should not "know" what HZ the kernel is using.  Instead, all
> interfaces should be properly reported in terms of whatever HZ userspace
> used to assume (100 on i386, other values on other platforms).  I don't
> know what interface gprof is using, but it needs to be fixed.

I disagree as do others but many agree with you.  The issue will soon be
brought to the LKML so you can discuss it there later this week.  It is
not gprof that is messing up it is gcc/glibc.  When a program is
compiled with the "-pg" options it emits a gmon.out file when run and
that file has bad data that gprof is trusting.

> Otherwise we stand no chance of going to a dynamic HZ in the future.

When you say, dynamic tick are you referring to things like speed step
and power now things or just changing the kernel's internal frequency on
the fly?

-- 
Tres

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

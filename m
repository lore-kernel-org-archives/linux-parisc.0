From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] waitid is badly emulated with waitpid (cannot reap
	child and a couple of other things)
Date: Fri, 24 Sep 2004 09:14:56 -0400
Message-ID: <20040924131455.GT27033@baldric.uwo.ca>
References: <20040924000646.GZ22642@tausq.org>
	<20040924035552.GS27033@baldric.uwo.ca>
	<20040924130602.GA16153@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040924130602.GA16153@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 24, 2004 at 02:06:02PM +0100, Matthew Wilcox wrote:
> On Thu, Sep 23, 2004 at 11:55:53PM -0400, Carlos O'Donell wrote:
> > I see waitid regressions in the glibc testsuite. I'm not sure if this
> > had anything to do with these hanging processes. I haven't looked too
> > deeply.
> 
> Possibly it's because we haven't hooked up sys_waitid yet?

It's supposed to fall back and emulate sys_waitid with a couple other
syscalls. Who knows if this emulation is working correctly.

The emualted waitid() cannot handle all the proper modes apparently,
which means things like reaping children is not possible since waitpid()
is used.

I think we definately want to have sys_waitid() connected soon.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] uninline in bitops.c as ia64 or sparc64?
Date: Thu, 12 Aug 2004 08:59:28 -0500
Message-ID: <200408120859.28306.mszick@goquest.com>
References: <40FB89640000B461@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40FB89640000B461@ocpmta2.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed August 11 2004 06:58, Joel Soete wrote:
> 
> Hello *,
> 
> > Subject: Re: [parisc-linux] uninline in bitops.c as ia64 or sparc64?
> > 
> > 
> > On Tue August 10 2004 09:51, John David Anglin wrote:
> > > > On Mon, Aug 09, 2004 at 09:54:08AM -0500, Michael S. Zick wrote:
> > > > > generic_ffz is defined as integer - is 'integer' the same size
> > > > > cpu32 and cpu64?  If not, that routine needs a size-conditional
> > > > > test for the other 32 bits on cpu64.
> > > > 
> > > > Integers are the same size. The 64-bit boxes are LP64.
> > > 
> > > To be more specific, the 'int' types are the same size.  The 'long'
> > > types are different.
> > > 
> Here is the smal test case I tested:
- - - - - - 
> 
> I compile it with James 64bit lib with hppa64-linux-gcc (3.0.4) and run
> it on a b2k (64bit cpu) with 2.6.8-rc2-pa7 64bit.
> That's a long test (reason of delay) but it works fine.
> 
> I also test the 32bit binaries (compile with gcc-3.3.4) runing on the b2k
> with same kernel and it also works fine.
> 
> Please note that I have to abuse the original ffs() code with ULffs() and
> an unsigned long (64bit long for hppa64-gcc) as parameter (the original
> was an integer of 32bit long for 64bit and 32bit gcc).
> 
> hth,
>     Joel
Thanks for the testing and the help Joel.
So I would like the m-l to consider that patch sent
earlier be upgraded from "suggested" to "submitted".

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux] clear user page test]
Date: Wed, 12 Jan 2005 07:52:07 -0600
Message-ID: <200501120752.07206.mszick@wolfbutter.com>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<200412311535.28359.mszick@wolfbutter.com>
	<20041231225447.GC23592@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041231225447.GC23592@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri December 31 2004 16:54, Grant Grundler wrote:
> On Fri, Dec 31, 2004 at 03:35:28PM -0600, Michael S. Zick wrote:
> > I tried the 'patch that works' route with a similar suggestion for sched.c
> > Based on that experience...
> 
> ah good. You learned something. :^)
> 
> > What I proposed was:
> > The memory page free pool be defined as a 'virtual device' with
> > a two part driver.
> ...
> > In this virtual free pool device, the kernel is the 'client' and the
> > daemon is the 'host' (which only happens to be part of the kernel).
> > Only the 'client' code is in the user's execution path.
> 
> This sounds neat and "clean". But things could get very ugly
> when one needs to "steal" zero'd pages for other uses.
> 
> > Should be interesting to consider.
> 
> Yes, Agreed.
> 
Design seems to be drifting in that general direction.

See: change log on 2.6.11-rc1

More details at:
<http://seclists.org/lists/linux-kernel/2005/Jan/0888.html>

Mike (with Joel's help).
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux] clear user page test]
Date: Fri, 31 Dec 2004 17:56:46 -0600
Message-ID: <200412311756.46417.mszick@wolfbutter.com>
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
Sometimes.

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
Better the discussion first - code optionally later.

> 
> > I wouldn't expect the idea to be adopted any quicker than my
> > description (and patch that works) that the scheduler should be
> > a virtual device with a two part driver.
> 
> I don't know what happened to your scheduler idea specifically (or
> how it was presented), but making something a driver means
> giving up something else. Been there done that.
> 
Overly radical at the time of presentation compared with 
other 'work in progress'.

Managing the free page pool (only) as a virtual device would lead
to much-oh (scientific term ;) glue code.  Not much of an improvement
over current practice.
Managing over-all memory resources as a virtual device is the answer;
but that is hardly a 'patch'.

Even so, glue code would be required unless the resource of 
cpu-cycles was also managed as a virtual device.

Now the topic is definitely out of the 'patch' scope, providing both
virtual devices would need to be a kernel branch devoted to the
project.

That in turn would require that a whole lot of people 'get on board'
with the ideas behind the design change.

The only practical means to accomplish that brings us full circle
back to the observation above: "Discussion First".

Mike
(PS: None of this is academic, just a clean re-write of code
written in the past for proprietary operating systems.)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

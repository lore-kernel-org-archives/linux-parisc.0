From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux] clear user page test]
Date: Fri, 31 Dec 2004 15:35:28 -0600
Message-ID: <200412311535.28359.mszick@wolfbutter.com>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<200412311426.13425.mszick@wolfbutter.com>
	<20041231205622.GA24116@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041231205622.GA24116@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri December 31 2004 14:56, Grant Grundler wrote:
> 
> I read the conditions and thought "neat".
> I don't pretend to understand all of them or what they mean.
> But instead of trying to explain them, could you send me a patch that works?
> Maybe something that has a chance of going back upstream to linus?
> 
I tried the 'patch that works' route with a similar suggestion for sched.c
Based on that experience...

I suspect that perhaps pictures (diagrams? flow charts? dependency
graphs?) might stand a better chance of conveying what I can't explain
in English.  I'll put that (drawing pictures) on my todo list.

Let me attempt an abstract in words:

The *nix philosophy is two part drivers.

The 'top part' can be viewed as a 'client' that makes requests on 
behalf of the hardware.
The 'bottom part' can be viewed as a 'host' that services 'client'
requests.

Nothing new there.

What I proposed was:
The memory page free pool be defined as a 'virtual device' with
a two part driver.

The 'top part' is executed by the 'client' (kernel).
The 'bottom part' is executed by the 'host' (kernel daemon).

The only thing different than usual here is that a real hardware
device is (in most cases) the 'client' and the kernel is the 'host'.

In this virtual free pool device, the kernel is the 'client' and the
daemon is the 'host' (which only happens to be part of the kernel).
Only the 'client' code is in the user's execution path.

Should be interesting to consider.

I wouldn't expect the idea to be adopted any quicker than my
description (and patch that works) that the scheduler should be
a virtual device with a two part driver.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

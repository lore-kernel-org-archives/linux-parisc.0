From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Thu, 17 Feb 2005 19:00:37 -0600
Message-ID: <200502171900.37179.mszick@wolfbutter.com>
References: <42075CE800004656@mail-6-bnl.tiscali.it>
	<200502170653.52415.mszick@wolfbutter.com>
	<20050217210915.GB1081@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050217210915.GB1081@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu February 17 2005 15:09, Grant Grundler wrote:
> On Thu, Feb 17, 2005 at 06:53:52AM -0600, Michael S. Zick wrote:
> > A suggestion...
> > 
> > I am tracking a timing and/or race condition(s) with x86-udev.
> > Debian doesn't use it yet, they still have a hard disk based /dev.
> 
> OK. I'll try that tonight.
> 
Grant,
One of my problems was the video card driver - Manufacturers
driver has problems, X.org driver does not.  Tossing the vendor's
driver fixed that.

Still having network driver problems, haven't narrowed down all
the possible causes.

The hardware, software, and kernel are as similar as possible
with the exceptions:

works:
kernel 2.6.8, gcc 3.3.4, single processor, hard-disk /dev
problems:
kernel 2.6.x, gcc 3.3.5, dual processor, udev /dev

My guess is that the udev code is not 100% smp ready.
But it could actually be anything, including cockpit error.

Time to sneaker net (by cd-rom) code from one box
to the other.  Will advise.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Thu, 17 Feb 2005 23:23:12 -0700
Message-ID: <20050218062312.GA11968@colo.lackof.org>
References: <42075CE800004656@mail-6-bnl.tiscali.it>
	<200502170653.52415.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@wolfbutter.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200502170653.52415.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Feb 17, 2005 at 06:53:52AM -0600, Michael S. Zick wrote:
> I am tracking a timing and/or race condition(s) with x86-udev.
> Debian doesn't use it yet, they still have a hard disk based /dev.
> But it is not a compile time option.
> If you have a 2.6.+ kernel, you have it.
> 
> Try turning it off with the command line option: 'noudev'

I thought this helped at first.  (2.6.11-rc4-pa1)
Could run spew+"make -j4" over xfs without crashing the box (panic).

Then I rebooted with a freshly built kernel (and "noudev")
and right away when I start spew on the XFS file system I get:

Kernel Fault: Code=26 regs=00000000fd0b0de0 (Addr=00000000000000c8)
...
 IAOQ[0]: xfs_btree_init_cursor+0x70/0x1b8 [xfs]
 IAOQ[1]: xfs_btree_init_cursor+0x8c/0x1b8 [xfs]
 RP(r2): xfs_btree_init_cursor+0x58/0x1b8 [xfs]

The system panics with and without the xfs patches Joel pointed me at.

The only difference in the .config was sym2 driver IOMAPPED.
I had it enabled (using IO Port space) and now disable it
since I really want MMIO space. I'm very skeptical this is
related to the problem.


> If your compile time options include devfs, try turning it 
> off also.  Use the command line option: 'nodevfs'

I don't use devfs. Willy won't let me. :^P

> In my case, for kernels 2.6.8, 2.6.9, 2.6.10 and 2.6.11 -
> If I boot from slow devices (cdrom, zip disk) everything is
> fine, If I boot from fast devices (hard disk) - something isn't
> getting setup the same.

Is there a difference in the how the devices are used?
ie. serialized vs. multiple IOs in flight at the same time?

I didn't start hitting problems until I lauched a second job
on the same file system.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

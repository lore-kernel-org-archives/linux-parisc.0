From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Fri, 18 Feb 2005 10:28:26 +0100
Message-ID: <20050218092835.0E74E3658E2@mail.esiee.fr>
References: <20050218062312.GA11968@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: "Michael S.Zick" <mszick@wolfbutter.com>,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050218062312.GA11968@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

-------------------
> On Thu, Feb 17, 2005 at 06:53:52AM -0600, Michael S. Zick wrote:
> > I am tracking a timing and/or race condition(s) with x86-udev.
> > Debian doesn't use it yet, they still have a hard disk based /dev.
> > But it is not a compile time option.
> > If you have a 2.6.+ kernel, you have it.
> >=20
> > Try turning it off with the command line option: 'noudev'
>=20
> I thought this helped at first.  (2.6.11-rc4-pa1)
> Could run spew+"make -j4" over xfs without crashing the box (panic).
>=20
> Then I rebooted with a freshly built kernel (and "noudev")
> and right away when I start spew on the XFS file system I get:

=20
> The only difference in the .config was sym2 driver IOMAPPED.
> I had it enabled (using IO Port space) and now disable it
> since I really want MMIO space. I'm very skeptical this is
> related to the problem.

Hmmm.
Back in the early days of 2.5, i recall issues with SYM2 in MMIO mode,
so that it only worked in PIO mode (I think i had posted something on
this m-l about that). At that time i was using ext3 for that matter.

OTOH, XFS relies a lot on memory and cache quality. I don't know how
MMIO would interfere with that, but I suspect that if enabling MMIO
has the side effect of messing with that somehow, it's very likely XFS
won't like it at all. Just a random thought though.
=20
> > If your compile time options include devfs, try turning it=20
> > off also.  Use the command line option: 'nodevfs'
>=20
> I don't use devfs. Willy won't let me. :^P

well, devfs is 3v1l and deprecated, so you'd better not use it :)

> > In my case, for kernels 2.6.8, 2.6.9, 2.6.10 and 2.6.11 -
> > If I boot from slow devices (cdrom, zip disk) everything is
> > fine, If I boot from fast devices (hard disk) - something isn't
> > getting setup the same.
>=20
> Is there a difference in the how the devices are used?
> ie. serialized vs. multiple IOs in flight at the same time?
>=20
> I didn't start hitting problems until I lauched a second job
> on the same file system.

Come to think of it, I wonder how the XFS bug you're pointing at can
be related to the bug Joel and I reported with ext3:
http://lists.parisc-linux.org/pipermail/parisc-linux/2005-February/025
867.html

Maybe one would like to try XFS on a non-SYM2 box and see what
happens? That way we might have a clue whether sym2's at fault or
something else...

My 2 cents in the morning ;)

Thibaut VARENE
PA/Linux ESIEE Team
http://www.pateam.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

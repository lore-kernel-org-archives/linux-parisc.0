From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped
 address
Date: Sun, 22 Feb 2015 11:42:50 -0800
Message-ID: <1424634170.2146.119.camel@HansenPartnership.com>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
			 <5313A12E.7010307@gmx.de>
			 <20140401182627.GA3285@drone.musicnaut.iki.fi> <533B0A57.2060700@gmx.de>
			 <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com>
			 <533C7C9A.5080703@gmx.de> <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl>
			 <533DB961.9010607@gmx.de> <BLU0-SMTP7204937E7AF88D8736354E976C0@phx.gbl>
			 <533DC3E8.5010701@gmx.de>
			 <CAE2sS1iY6H3fnEJDHr6oPGywwGYmM_2gt2r_p+DUz+v0Rf2szg@mail.gmail.com>
			 <BLU436-SMTP15952414B35EC498F0793B1972B0@phx.gbl>
			 <BLU437-SMTP9274AAFB2636BF93781F02972B0@phx.gbl>
			 <1424560158.2146.22.camel@HansenPartnership.com>
	 <54E9141B.4050009@gmx.de>
			 <1424563046.2146.41.camel@HansenPartnership.com>
			 <BLU436-SMTP737CEAAA0E7C3EAEFB9DB097280@phx.gbl>
			 <1424625475.2146.88.camel@HansenPartnership.com>
			 <BLU437-SMTP61AF76DB80DF7F81524FCC97280@phx.gbl>
		 <1424627938.2146.103.camel@HansenPartnership.com> <54EA1ADC.60701@gmx.de>
	 <1424632396.2146.116.camel@HansenPartnership.com> <54EA2B1B.10406@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave.anglin@bell.net>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <54EA2B1B.10406@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2015-02-22 at 20:16 +0100, Helge Deller wrote:
> On 22.02.2015 20:13, James Bottomley wrote:
> > On Sun, 2015-02-22 at 19:07 +0100, Helge Deller wrote:
> >>>>>> SHMLBA is 4096 /* (1 << PGSHIFT) */ on hpux.
> >>>>>>
> >>>>>> The following is in <asm-generic/shmparam.h>:
> >>>>>> #define SHMLBA PAGE_SIZE	 /* attach addr a multiple of this */
> >>>>>>
> >>>>>> Shared mappings are handled with
> >>>>>> asm/shmparam.h:#define SHM_COLOUR 0x00400000	/* shared mappings colouring */
> >>>>>
> >>>>> So how is the sys-v ipc problem fixed?  There the user is told to select
> >>>>> an address which is a multiple of SHMLBA.  Programs that do this today
> >>>>> will start to break on writeable mappings if we set SHMLBA to PAGE_SIZE
> >>>>> because the colour will be wrong.
> >>>>
> >>>>
> >>>> The code returns -EINVAL.  See arch_get_unmapped_area.
> >>>
> >>> But that's not a solution.  Let me try to illustrate: I have an existing
> >>> application, it uses sys-v ipc and selects a shmat address based on the
> >>> multiple of SHMLBA for a writeable mapping.  Today it works.
> >>
> >> It will work as well with SHMBLA=4096, if you just use SHM_RND too
> >> (and most applications do have SHM_RND).
> >> man shmat says:
> >>    * If shmaddr isn't NULL and SHM_RND is specified in shmflg, the attach occurs at the address equal to shmaddr rounded down to the nearest multiple of SHMLBA.
> >> * Otherwise, shmaddr must be a page-aligned address at which the attach occurs.
> >>
> >> So, even here shmaddr is mentioned to be page-aligned (4k), not
> >> SHMLBA-aligned (4M in your case).
> >
> > I think that part is x86.  All the other VI architectures impose their
> > VI colour constrainst in SHMLBA.  We're the odd one out because we have
> > a huge stride (everyone else is small multiples of pages).
> >
> > But agree if no applications are affected, we can make the ABI change.
> >
> >>> Tomorrow
> >>> when you make this change, it fails with -EINVAL.  That's breaking an
> >>> existing application because chances are the app will just report the
> >>> failure and exit.
> >>
> >> Tomorrow?  This change is *already* implemented in eglibc since a year or
> >> so and I don't see any applications which break because of SHMBLA=4096...
> >
> > Is eglibc a big enough sample to make the claim that no applications
> > will be broken?
> 
> Try yourself:
> https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
> Just install debian 8.0 (aka unstable for hppa). KDE, Xfce, libreoffice,
> and a all others packages just work out of the box.

I know, I do, but that's sort of expected: most modern linux apps use
mmap.  It's the older stuff that uses sys-v ipc, but perhaps for us this
doesn't matter.

James




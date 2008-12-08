From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 00:50:01 -0700
Message-ID: <20081208075001.GB28779@colo.lackof.org>
References: <119aab440811250533y1a09a396i318dfc057ad0d659@mail.gmail.com> <20081208045003.4CF644E99@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208045003.4CF644E99@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Dec 07, 2008 at 11:50:02PM -0500, John David Anglin wrote:
> > Given your earlier comments it would seen the segfault is not
> > reproducible and happens often and randomly?
> 
> I gave 2.6.28-rc7-git5 a try this evening.  Hit the same error.
> While its occurence may be random, the identical fault occurred
> multiple times in a short period of testing.

I routinely get a segfault the first time I attempt to compile linux-2.6
kernel after reboot.  If I "find linux-2.6 | xargs cksum", the kernel
builds fine.

> I see this bit of code in _dl_fixup:
> 
> 0x401ed464 <_dl_fixup+172>:	mfctl tr3,r21
> 0x401ed468 <_dl_fixup+176>:	ldw -3e0(r21),ret0
> 0x401ed46c <_dl_fixup+180>:	cmpib,<> 0,ret0,0x401ed628 <_dl_fixup+624>
> 
> and
> 
> 0x401ed5fc <_dl_fixup+580>:	ldi 1,r24
> 0x401ed600 <_dl_fixup+584>:	ldi 0,r23
> 0x401ed604 <_dl_fixup+588>:	mfctl tr3,r26
> 0x401ed608 <_dl_fixup+592>:	copy r24,r25
> 0x401ed60c <_dl_fixup+596>:	ldo -3dc(r26),r26
> 0x401ed610 <_dl_fixup+600>:	copy r19,r4
> 0x401ed614 <_dl_fixup+604>:	be,l 100(sr2,r0),sr0,r31
> 0x401ed618 <_dl_fixup+608>:	ldi d2,r20
> 
> So, the code is using the thread register (cr27).  Not sure what syscall
> this is.  However, the problem might be TLS releated.

I have no idea if TLS makes a difference to kernel builds.

thanks,
grant

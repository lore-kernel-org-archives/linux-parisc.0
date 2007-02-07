From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] glibc nptl failure baseline update.
Date: Wed, 7 Feb 2007 10:01:50 +0100
Message-ID: <20070207100150.f5f58807.gmsoft__43489.6421539181$1416624276$gmane$org@gentoo.org>
References: <119aab440702051913m1edfb6ecg535c80d2301c9c11@mail.gmail.com>
	<20070206224246.3000a76c.gmsoft@gentoo.org>
	<119aab440702061358s5c0ee062l65eaff50429ada47@mail.gmail.com>
	<20070206232619.214a9180.gmsoft@gentoo.org>
	<119aab440702061446t57b9ea24lb1eb6d8e9cb04f0e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702061446t57b9ea24lb1eb6d8e9cb04f0e@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 6 Feb 2007 17:46:43 -0500
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> > > Watch out there is a compiler bug I ran into with vfprintf. I have a
> > > patch to disable delayed branch reorganization when compiling
> > > vfprintf.c from stdio.
> >
> > Where is this patch ? :)
> 
> It is part of this patch:
> http://www.parisc-linux.org/~carlos/libc-head-2007-02-05.diff
> -CFLAGS-vfprintf.c = -Wno-uninitialized
> +CFLAGS-vfprintf.c = -Wno-uninitialized -fno-delayed-branch

Ok then it was applied already.

> 
> > I used this binutils :
> > GNU ld version 2.17.50.0.9 20070103
> > I'll try a newer version but got not much hope.
> 
> I didn't say it's fixed in a newer binutils. I meant to say that we
> likely need to fix binutils :-)

I somehow expected that :)

> > So far so good, python and openldap test suite wich failed in odd ways wrt thread stuff now works fine :)
> > This is still only in a chroot, we'll put that in portage soon for testing.
> 
> Excellent! What kernel are you using?

Linux hake 2.6.19.2 #2 Thu Feb 1 19:58:15 EST 2007 parisc PA8600 (PCX-W+) GNU/Linux


Let me know if you have some patch/update for glibc which needs testing.


Cheers,
  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

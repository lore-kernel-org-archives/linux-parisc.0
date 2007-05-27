From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3 ?
Date: Sun, 27 May 2007 23:56:36 +0200
Message-ID: <7d01f9f00705271456i676bcee3j7296bda036e017d0__45750.5624312491$1416624374$gmane$org@mail.gmail.com>
References: <200705271438.57394.deller@gmx.de>
	 <20070527201829.GF28455@fattire.cabal.ca>
	 <200705272241.46503.deller@gmx.de> <200705272258.44572.deller@gmx.de>
	 <20070527211143.GG28455@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: "Helge Deller" <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-Path: <varenet@gmail.com>
In-Reply-To: <20070527211143.GG28455@fattire.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>

On 5/27/07, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Sun, May 27, 2007 at 10:58:44PM +0200, Helge Deller wrote:
> > diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> > index 0dd3847..f9f2b39 100644
> > --- a/arch/parisc/kernel/process.c
> > +++ b/arch/parisc/kernel/process.c
> > @@ -385,6 +385,8 @@ get_wchan(struct task_struct *p)
> >          * These bracket the sleeping functions..
> >          */
> >
> > +return 0; /* XXX */
> > +
>
>
> Try without CONFIG_KALLSYMS, I think somehow Alexey's patch to simply
> kallsyms may have broken things for us.

Building with CONFIG_KALLSYMS disabled gives a bootable kernel.

> ffb45122766db220d0bf3d01848d575fbbcb6430 is the commit id.

Digging that out

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/

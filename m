From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3 ?
Date: Sun, 27 May 2007 16:23:47 -0600
Message-ID: <20070527222347.GA711__9288.49297711185$1416624375$gmane$org@colo.lackof.org>
References: <200705271438.57394.deller@gmx.de> <20070527201829.GF28455@fattire.cabal.ca> <200705272241.46503.deller@gmx.de> <200705272258.44572.deller@gmx.de> <20070527211143.GG28455@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <grundler@lackof.org>
In-Reply-To: <20070527211143.GG28455@fattire.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 27, 2007 at 05:11:43PM -0400, Kyle McMartin wrote:
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
> 
> ffb45122766db220d0bf3d01848d575fbbcb6430 is the commit id.

I don't see anything wrong with this patch.
It all looks pretty obvious to me.

I'm more inclined to believe something else changed in kallsyms_lookup()
code path.

thanks,
grant

> 
> Cheers,
> 	Kyle
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

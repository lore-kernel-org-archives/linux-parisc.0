Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id RAA13435
	for <hppa-linux@sod.res.cmu.edu>; Sun, 28 Mar 1999 17:53:01 -0500
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199903282252.RAA22833@lucifier.dial-up.user.akula.net>
Subject: Re: [hppa-linux] Qn on PA-RISC Page tables and TLB
In-Reply-To: <Pine.LNX.3.96.990328122620.118A-100000@quark.ix.netcom.com> from Kumar at "Mar 28, 99 12:37:05 pm"
To: hppa-linux@thepuffingroup.com
Date: Sun, 28 Mar 1999 17:52:49 -0500 (EST)
Cc: hppa-linux@thepuffingroup.com
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Kumar:
> 
> On Thu, 25 Mar 1999, Craig Hada wrote:
> > > 
> > 
> > In the absense of a harware TLB walker, the page directory format can be
> > structured by software to fit its needs. However, the TLB miss handler
> > must reformat the bits to fit the format of the TLB insert instructions.
> > To get maximum performace from the system, the TLB miss handlers must be
> > made very efficient. The format of the page directory entry in the PA-RISC 
> > Arch 1.1 book minimizes the work of the TLB miss handlers by aligning the
> > fields to match the format of the TLB insert instructions.
> > > 	
> > > 
> Is it necessary that the virtual to physical mappings in TLB be inserted
> only in a tlb miss fault. Can I insert  entries in the anticipation that
> there will be a fault soon, for example when I first enable 
> virtual mode ? If not, there is a potential chicken and egg problem
> because I will get a TLB miss fault as soon as I turn virtual mode on and
> TLB miss fault handler has to run in virtual mode with translations
> on.....and there aint any tranlations yet inserted ...you get the pitcure
usually kernel (and tlb miss handler) get block-mapped w/ block tlb,
so the whole kernel text+data get mapped once w/ one big tlb entry,
and won't get no tlb misses for it no more.
so, the chicken gonna be ok.

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)

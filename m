Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id PAA10510
	for <hppa-linux@sod.res.cmu.edu>; Sun, 28 Mar 1999 15:36:23 -0500
Received: (from smap@localhost)
          by dfw-ix4.ix.netcom.com (8.8.4/8.8.4)
	  id OAA02034 for <hppa-linux@thepuffingroup.com>; Sun, 28 Mar 1999 14:35:32 -0600 (CST)
Date: Sun, 28 Mar 1999 12:37:05 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Qn on PA-RISC Page tables and TLB 
In-Reply-To: <199903252031.MAA27090@psalpha2.cup.hp.com>
Message-ID: <Pine.LNX.3.96.990328122620.118A-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Thu, 25 Mar 1999, Craig Hada wrote:
> > 
> 
> In the absense of a harware TLB walker, the page directory format can be
> structured by software to fit its needs. However, the TLB miss handler
> must reformat the bits to fit the format of the TLB insert instructions.
> To get maximum performace from the system, the TLB miss handlers must be
> made very efficient. The format of the page directory entry in the PA-RISC 
> Arch 1.1 book minimizes the work of the TLB miss handlers by aligning the
> fields to match the format of the TLB insert instructions.
> > 	
> > 
Is it necessary that the virtual to physical mappings in TLB be inserted
only in a tlb miss fault. Can I insert  entries in the anticipation that
there will be a fault soon, for example when I first enable 
virtual mode ? If not, there is a potential chicken and egg problem
because I will get a TLB miss fault as soon as I turn virtual mode on and
TLB miss fault handler has to run in virtual mode with translations
on.....and there aint any tranlations yet inserted ...you get the pitcure

							-pkd

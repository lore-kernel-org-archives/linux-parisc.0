Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id LAA28977
	for <parisc-linux@sod.res.cmu.edu>; Mon, 29 Mar 1999 11:07:10 -0500
Received: from psalpha2.cup.hp.com (psalpha2.cup.hp.com [15.13.189.229])
	by hpcsos.col.hp.com (Postfix) with ESMTP for <hppa-linux@thepuffingroup.com>
	id 57045F791; Mon, 29 Mar 1999 09:05:18 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by psalpha2.cup.hp.com (8.8.6 (PHNE_16852)/8.8.6) with SMTP id IAA09728
	for <hppa-linux@thepuffingroup.com>; Mon, 29 Mar 1999 08:01:20 -0800 (PST)
Message-Id: <199903291601.IAA09728@psalpha2.cup.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Qn on PA-RISC Page tables and TLB 
In-reply-to: Your message of "Sun, 28 Mar 1999 12:37:05 PST."
             <Pine.LNX.3.96.990328122620.118A-100000@quark.ix.netcom.com>
Date: Mon, 29 Mar 1999 08:01:20 -0800
From: Craig Hada <chada@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


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
> 
> 							-pkd
> 
> 
Under HP-UX, the TLB miss handler runs in real mode (data and code translation
disabled) so there is no need to have a virtual translation for the code 
representing the TLB miss handler or the page directory (both are equivalently
mapped). If a translation is not found in the page directory, then you enter
virtual mode to handle the page fault.

You can speculatively insert entries into the TLB but you also may be
replacing entries that are soon to be used. Since the TLB replacement 
algorithm is not documented, you are probably better off just inserting
the missed upon translation.

-Craig 

> 
> -------------------------------------------------------------------------
> To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

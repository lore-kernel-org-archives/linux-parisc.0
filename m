Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id PAA27555
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 15:31:48 -0500
Received: from psalpha2.cup.hp.com (psalpha2.cup.hp.com [15.13.189.229])
	by atlrel1.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id PAA19106
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 15:31:28 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by psalpha2.cup.hp.com (8.8.6 (PHNE_16852)/8.8.6) with SMTP id MAA27090
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 12:31:37 -0800 (PST)
Message-Id: <199903252031.MAA27090@psalpha2.cup.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Qn on PA-RISC Page tables and TLB 
In-reply-to: Your message of "Wed, 24 Mar 1999 23:10:36 PST."
             <Pine.LNX.3.96.990324225944.502B-100000@quark.ix.netcom.com>
Date: Thu, 25 Mar 1999 12:31:37 -0800
From: Craig Hada <chada@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> 
> 
> PA-RISC Arch 1.1 book says:
> On page 3-14:
> 
> 	Exact form of these tables is s/w convention. 
> 
> Q.	If the format is software convention, does that mean
> 	the fields within TLB slots are not defined by Hardware ?
> 	Though  the book does seem to indicate what fields are needed
> 	in a pdir entry. Without knowing exact positions of various
> 	fields how would TLB entries be updated from pdir entries in
> 	memory ?
> 

In the absense of a harware TLB walker, the page directory format can be
structured by software to fit its needs. However, the TLB miss handler
must reformat the bits to fit the format of the TLB insert instructions.
To get maximum performace from the system, the TLB miss handlers must be
made very efficient. The format of the page directory entry in the PA-RISC 
Arch 1.1 book minimizes the work of the TLB miss handlers by aligning the
fields to match the format of the TLB insert instructions.

In order to enable the hardware TLB walker, the format of the page directory
must match the format from PA-RISC Arch 1.1 book. In addition, the memory
for the page directory must be equivalently mapped, power of two size aligned
(ie a page directory 1 MB in size must start on a 1 MB boundary), and 
contiguous. 

> 	Other interesting point to note is that PA-RISC does not
> 	define how many entries in the table etc. Very much unlike
> 	x86.
> 
> -pkd

The number of entries in the page directory are a function of the amount of 
memory and the amount of memory mapped I/O in the box. Since the hash
function is not perfect, the size of page directory can be tuned to meet
the system requirements.

-Craig
> 	
> 
> 
> 
> 
> -------------------------------------------------------------------------
> To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA09022
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 13:47:54 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id A706E432
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 13:50:50 -0700 (MST)
Message-Id: <200012192050.MAA15865@milano.cup.hp.com>
To: debackex@esiee.fr, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] STI Rom address location 
In-reply-to: Your message of "Thu, 14 Dec 2000 03:05:38 PST."
             <200012141005.DAA10850@udlkern.fc.hp.com>
Date: Tue, 19 Dec 2000 12:49:45 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
...
> > btw, all info I've found about PDC_SYSTEM_MAP was in pdc.pdf, just
> > telling about the existence of such a procedure in chapter 2.2, but
> > there's no more info about it (while ALL other procedures are explained
> > in this book). This is just to get explained about the
> > pdc_system_map_find_mods params.
> 
> I don't have any documentation for PDC_SYSTEM_MAP either. I just used
> the HP-UX source for reference.

PDC_SYSTEM_MAP is Hversion specific. I do know it's documented in the
various firmware ERS's. I'm not aware those have been published yet.
Strike one. :^(

[ However, I see no reason why HP wouldn't allow firmware ERS's 
  for "legacy" platforms to be published. Cost/time to review/santize
  might be the only reason. And while a few of the ERS's are not very good
  (ie incomplete), still better than nothing. ]

It seems HP published key parts of the "I/O Architecture Control Document":
	http://devresource.hp.com/devresource/Docs/DocLib_Refs.html#archrefs

as "Part 2: Processor Dependent Code Procedures" (PDC.pdf). And those are
probably on parisc-linux Documentation website as well.
But as Xavier noted above, while mentioned, PDC_SYSTEM_MAP is not actually
documented in the PDC.pdf. :^(  Strike two.

PDC_SYSTEM_MAP is documented on page 467 (of 646) in the ioacd_v096.pdf.
I'll ask the owners of ioacd if "common" Hversion PDC calls could
be published as well. This might take a while though. :^(
I hope they were not intentionally excluded for some sane reason.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BB434A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 12:18:21 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13610
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 12:14:13 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A78636B.18A9195B@dot.at>
Date: Wed, 31 Jan 2001 20:11:39 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
Cc: plaven@ozemail.com.au, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 800/G30, G50, E55 Support?
References: <200101311830.KAA29281@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

He, that's interesting:

See link:
	http://www.mkg.sfc.keio.ac.jp/support/FAQ/README

Here a copy and paste out of it:

2.2 MIPS

RT-Mach and 4.4BSD Lite server for MIPS-based Sony NEWS workstation
currently support the following devices.

        CPU:    R4400 (and compatibles).
        Devices:Built-in Serial (Zilog 85230 ESCC)
                Built-in SCSI (HP SPIFI)
                Built-in Ethernet (Sony SONIC)
                Video Board (NWB-1102)
                Keyboard
                Mouse

It seem as they support the SPIFI of HP !
I have not downloaded yet. I have to register and I want to read around
that stuff.
I also does not know, if this is a source snapshot.
But perhaps it can help .....

Cheers
	Christoph


Grant Grundler wrote:
> 
> Christoph Plattner wrote:
> > But there are some people who are interested in writing drivers
> > for these machines and I want to use my E55 (9000/856). I only
> > need the input (doucmentation, HP-UX sources, etc) to do such
> > work (especially for the 8-port serial multiplexer).
> ...
> > Where can I get the INFOS to do that ????
> 
> I've sent some HP internal URLs to someone in HP who expressed interested
> in getting SPIFI (NIO SCSI) docs published. I haven't heard back from him
> in a while.
> 
> Someone from HP who shares your interest can do either (or both)
> of the following two things:
> o write and publish an initial version of the code you need and provide
>   technical support when needed. This is what I did for ccio code.
>   (which is trivial compared to writing SPIFI chip support)
> o Enable someone else to write the code by: review the relevant
>   unpublished docs, fix references to IP not owned by HP, delete
>   people/project names, get an HP attorney to review and bless the result.
> 
> Any other takers inside HP?
> If so reply to me privately and I'll try to help locate the documents.
> 
> grant
> 
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at

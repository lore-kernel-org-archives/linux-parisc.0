Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33C834A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 11:31:15 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12649
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 11:27:07 -0700
Message-Id: <200101311830.KAA29281@milano.cup.hp.com>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: plaven@ozemail.com.au, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 800/G30, G50, E55 Support? 
In-reply-to: Your message of "Wed, 31 Jan 2001 19:14:10 PST."
             <3A7855F2.49FB7E36@dot.at>
Date: Wed, 31 Jan 2001 10:30:42 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Christoph Plattner wrote:
> But there are some people who are interested in writing drivers
> for these machines and I want to use my E55 (9000/856). I only
> need the input (doucmentation, HP-UX sources, etc) to do such
> work (especially for the 8-port serial multiplexer).
...
> Where can I get the INFOS to do that ????

I've sent some HP internal URLs to someone in HP who expressed interested
in getting SPIFI (NIO SCSI) docs published. I haven't heard back from him
in a while.

Someone from HP who shares your interest can do either (or both)
of the following two things:
o write and publish an initial version of the code you need and provide
  technical support when needed. This is what I did for ccio code.
  (which is trivial compared to writing SPIFI chip support)
o Enable someone else to write the code by: review the relevant
  unpublished docs, fix references to IP not owned by HP, delete
  people/project names, get an HP attorney to review and bless the result.

Any other takers inside HP?
If so reply to me privately and I'll try to help locate the documents.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253

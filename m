Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82D514DD3
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Apr 2004 00:10:30 -0600 (MDT)
Message-ID: <1152.192.168.1.54.1081318817.squirrel@www.puszczka.com>
In-Reply-To: <40739896.7010600@bluehash.de>
References: <40739896.7010600@bluehash.de>
Date: Wed, 7 Apr 2004 08:20:17 +0200 (CEST)
Subject: Re: [parisc-linux] EISA-Card in 715 /100
From: "Andy Walker" <ajwalker@broadpark.no>
To: =?iso-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Hello,
>
> my HP 715/100 has an extra graphics card (HCRX-24?). Now I have read
> that some 715s have an EISA-Slot instead of this graphics card. Can I
> replace my graphics card with an EISA-Card. And if yes, can I also use
> an ISA-card (e.g. an ISDN-Card)?
>
> T.i.a,
>     Ruediger

Hi Rüdiger,

As I understand it, EISA was provided on the 715s by an adapter card that
sat in the GSC slot. Seems reasonable as both are controlled by WAX. So if
you have a GSC card in the slot you presumably don't have the adapter.

In theory you can use ISA cards in EISA slots, but cars needing DMA will
not work.

-Andy

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA6C3482A
	for <parisc-linux@parisc-linux.org>; Thu, 20 Dec 2001 03:16:14 -0700 (MST)
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <1008842769.3c21b81172e7c@nyepost.start.no>
Date: Thu, 20 Dec 2001 11:06:09 +0100 (CET)
From: Andy Walker <squawker@start.no>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	Andy Walker <squawker@start.no>, parisc-linux@parisc-linux.org
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <1008594958.3c1df00ed9750@nyepost.start.no> <20011219113621.X1897@linuxcare.com> <1008771313.3c20a0f14484a@nyepost.start.no> <20011219165635.3E405482A@dsl2.external.hp.com> <001b01c188cb$cb1eda60$0201a8c0@andy> <squawker@start.no> <20011219204048.2140B482A@dsl2.external.hp.com> <20011219210329.E1897@linuxcare.com>
In-Reply-To: <20011219210329.E1897@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Quoting Richard Hirst <rhirst@linuxcare.com>:

> On Wed, Dec 19, 2001 at 01:40:48PM -0700, Grant Grundler wrote:
> > "Andy Walker" wrote:
> > > by the 53c8xx driver, it says differential on the external connector
> -
> > > there can't be any doubt, can there? This should all work
> together.
> > 
> > It sounds like it should all just work. Especially if HPUX works.
> > But HPUX sometimes cripples the bus speed or *wideth* based
> > on what PDC tells it. Perhaps you need to do the same. I really
> > don't expect any issues with bus speed on differential SCSIs.
> > Possibly a wide vs narrow bus issue (Chip thinks it's wide and the
> cabling
> > is narrow). We see that on C3k still and I started (but didn't
> finish)
> > the code to query PDC about Host SCSI ID, bus speed, and width.
> > 
> > > Anyway, I'll take an known good disk with me tomorrow and try that
> with
> > > a different internal cable. I'll also double check that everything
> is
> > > still working with HP-UX. More news as it breaks.........
> > 
> > Yeah - if HPUX boots/talks to the devices, they are basically ok.
> > It's a matter of getting the linux driver the right parameters then.
> 
> >From drivers/scsi/README.ncr53c8xx, you can force narrow by booting
> with
> 
> ncr53c8xx=wide:0
> 
> and disable tagged commands with
> 
> ncr53c8xx=wide:0,tags:0
> 
> and force async with
> 
> ncr53c8xx=wide:0,tags:0,sync:255
> 
> and disable dma burst with
> 
> ncr53c8xx=wide:0,tags:0,sync:255,busrt:0
> 
> and disable disconnect with
> 
> ncr53c8xx=wide:0,tags:0,sync:255,burst:0,disc:n
> 
> 
> Richard

Absolutely no luck at all :-( Different disk, different cable - same
results. Tried Richard's parameter settings - nothing helps. Tried
ncr53c8xx=safe:y, still no joy.

But if I hang an HPUX bootdisk on the card, I can boot happily from
it. Bah!

Do we know of anybody who has one of these cards working?

-Andy

------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/

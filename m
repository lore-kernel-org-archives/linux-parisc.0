From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: E Class and SCSI (53c700 driver)
Date: Thu, 2 Apr 2015 11:14:38 -0700
Message-ID: <CAP6odjgS6KHvB=CHybquCJ4T_hTw5awrF5hzXUENQzOb7Su7Gg@mail.gmail.com>
References: <5519CA2B.9060407@gmail.com>
	<551CF8D9.3020506@gmx.de>
	<1427965174.3559.110.camel@HansenPartnership.com>
	<BLU437-SMTP517D1501AE614C12AA19EC97F20@phx.gbl>
	<1427975884.3559.155.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave.anglin@bell.net>,
	Helge Deller <deller@gmx.de>,
	Dmitry the Zuryanovich <dreadbit@gmail.com>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1427975884.3559.155.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 2, 2015 at 4:58 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
...
> Well, what do you know: HP has a computer museum full of obsolete
> documentation.
>
> http://www.hpmuseum.net/collection_document.php

oh wow...

> If anyone can identify the programming specs for the HP-PB (or better
> still the actual SCSI card) we might be in business.

This doc will help a lot:
    3000-900_9000-800_OnlineDiagnosticsSubManual_VolIII_LAN-SCSI-MUX_09740-90034_324pages_Jul91.pdf

Look at Section 18 "SCSIPBA" - register descriptions starting on page
18-21. Register overview on 18-33 (page 216 of the PDF).

And I finally found the name of the SCSI chip in the above doc: SPIFI
(v3).  The "Fast-Wide HVD" NIO card uses SPIFI v4.

Knowing that name also helped find the Net BSD driver (again):
    http://lists.parisc-linux.org/pipermail/parisc-linux/2002-June/016557.html
    http://lists.parisc-linux.org/pipermail/parisc-linux/2002-June/016562.html
    http://lists.parisc-linux.org/pipermail/parisc-linux/2002-June/016563.html
    http://lists.parisc-linux.org/pipermail/parisc-linux/2002-June/016576.html

and looks like NetBSD "newsmips" did support SPIFI-3:
   http://netbsd.mirrors.treibsand.com/ports/newsmips/

cheers,
grant

ps. It's embarrassing I couldn't remember the name of the SCSI chip: I
worked on HPUX SPIFI-4 driver between 1994-1996.

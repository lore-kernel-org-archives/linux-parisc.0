Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90CD54850
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Jun 2002 15:18:11 -0600 (MDT)
Message-ID: <3D090C28.6681CB62@gmx.at>
Date: Thu, 13 Jun 2002 23:18:32 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI driver for E-class servers - SPIFI ?
References: <3D050639.B9F9695D@gmx.at> <20020610215312.29D2C483A@dsl2.external.hp.com> <3D053341.571CF331@gmx.at> <20020611213929.C75684854@dsl2.external.hp.com> <3D07BB3E.A896878A@gmx.at> <20020612230856.D16EE485D@dsl2.external.hp.com>  <3D0900EB.77E7CFAA@gmx.at> <20020613211133.A055C483D@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Hello,

Grant Grundler wrote:
> 
> Christoph Plattner wrote:
> > Hello Grant,
> >
> > MUX:
> > ----
> > So, what is then the status of the docu then. You (I think it was you),
> > said something about a non-disclosure agreement. Is this opportunity
> > still active ?
> 
> Yes - I've already asked the person who can do this and they agreed to.
> The issue was finding time to do it.  Please be patient with us since
> "business issues" are keeping us busy right now. It might take
> another month but hopefully not that long. We'll contact you off list
> when it's ready.

Oh, no problem, I will patient here. From an older email, I thougt, 
this process was cancelled, I thought you wrote, that you will to 
that (the driver). So I was interested in the status. So now I am
up-to-date, ok.

> 
> > SCSI:
> > -----
> > Are there plans to start developing the SCSI driver on base of this
> > NetBSD driver ?
> 
> Yes - I was pretty sure you or rbrad was going to port that. ;^)
> In any case, someone who cares will make this port happen.

Ok, I will look, if I can help here. I have some experience in ethernet
work (and a little bit serial), SCSI and block devices are new for me,
but I am interested in (month by month, new regions of the kernel can
be discovered ..., I like it ....)

> 
> > Common:
> > -------
> > Is there a need to handle the bus system in a special way, or are the
> > devices full accessable, interrupts assigned, etc..., or is there
> > special
> > work to do ?
> 
> The MMIO access makes the system bus transperent.
> Interrupts will require some small bit of work identical to
> what's be done for Zalon SCSI support.

Ok, that helps in starting driver development.

> 
> grant


Bye
Christoph P.


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

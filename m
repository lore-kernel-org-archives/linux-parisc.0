Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI driver for E-class servers - SPIFI ? 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Thu, 13 Jun 2002 22:30:35 +0200." <3D0900EB.77E7CFAA@gmx.at>
References: <3D050639.B9F9695D@gmx.at> <20020610215312.29D2C483A@dsl2.external.hp.com> <3D053341.571CF331@gmx.at> <20020611213929.C75684854@dsl2.external.hp.com> <3D07BB3E.A896878A@gmx.at> <20020612230856.D16EE485D@dsl2.external.hp.com>  <3D0900EB.77E7CFAA@gmx.at> 
Date: Thu, 13 Jun 2002 15:11:33 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020613211133.A055C483D@dsl2.external.hp.com>
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

Christoph Plattner wrote:
> Hello Grant,
> 
> MUX:
> ----
> So, what is then the status of the docu then. You (I think it was you),
> said something about a non-disclosure agreement. Is this opportunity
> still active ?

Yes - I've already asked the person who can do this and they agreed to.
The issue was finding time to do it.  Please be patient with us since
"business issues" are keeping us busy right now. It might take
another month but hopefully not that long. We'll contact you off list
when it's ready.

> SCSI:
> -----
> Are there plans to start developing the SCSI driver on base of this
> NetBSD driver ?

Yes - I was pretty sure you or rbrad was going to port that. ;^)
In any case, someone who cares will make this port happen.

> Common:
> -------
> Is there a need to handle the bus system in a special way, or are the
> devices full accessable, interrupts assigned, etc..., or is there
> special
> work to do ?

The MMIO access makes the system bus transperent.
Interrupts will require some small bit of work identical to
what's be done for Zalon SCSI support.

grant

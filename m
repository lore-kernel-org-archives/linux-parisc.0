Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI driver for E-class servers - SPIFI ? 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Mon, 10 Jun 2002 22:04:09 +0200." <3D050639.B9F9695D@gmx.at>
References: <3D050639.B9F9695D@gmx.at> 
Date: Mon, 10 Jun 2002 15:53:12 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020610215312.29D2C483A@dsl2.external.hp.com>
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
> Hello to all !
> 
> Is the HP E55 SCSI controller a HP SPIFI ?
> I found that on the mailing archive ...Is this correct ?

Yes. HP-PB SE SCSI uses SPIFI-3.
HP-PB FWD SCSI uses i860 + SPIFI-4.

> Does anyone know, if this driver can help use for the E55 or
> similar machines.
> 
> The driver is in the file:
>      ./syssrc/sys/arch/newsmips/apbus/spifi.c 
> and
>      ./syssrc/sys/arch/newsmips/apbus/spifireg.h

I need a URL. AFAIK, SPIFI if the only family of SCSI
chips made by HP.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI driver for E-class servers - SPIFI ? 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Tue, 11 Jun 2002 01:16:17 +0200." <3D053341.571CF331@gmx.at>
References: <3D050639.B9F9695D@gmx.at> <20020610215312.29D2C483A@dsl2.external.hp.com>  <3D053341.571CF331@gmx.at> 
Date: Tue, 11 Jun 2002 15:39:29 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020611213929.C75684854@dsl2.external.hp.com>
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
> http://cvsweb.netbsd.org/bsdweb.cgi/syssrc/sys/arch/newsmips/apbus/

This looks like it's the right driver for the HP-PB SE SCSI.
I noticed that SDTR isn't supported.
But it's a starting point.

grant

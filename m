Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE97F4836
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Jun 2002 15:20:55 -0600 (MDT)
Message-ID: <3D07BB3E.A896878A@gmx.at>
Date: Wed, 12 Jun 2002 23:21:02 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI driver for E-class servers - SPIFI ?
References: <3D050639.B9F9695D@gmx.at> <20020610215312.29D2C483A@dsl2.external.hp.com>  <3D053341.571CF331@gmx.at> <20020611213929.C75684854@dsl2.external.hp.com>
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

Sorry, that I am not so "deep" in the HP device knowledge, can you give
me sime hints !

HP-BP is this a HP bus system ?
Is this used in the E55 (or similar) ?
Is the "SE" SCSI that one in the E55 (what stands "SE" for) ?
What is SDTR ?

Sorry, but I am interested in that stuff, and I know, I can help after 
initial steps. Some weeks ago, I rewrote an ethernet driver of an
not-well known chip on an VAX termianl for VAX Linux. So after some
hacking days (or better nights), there will be real progress.

So I am interested in helping here. 

Sorry for this question again:
What is the status of the MUX. As far I can remember, you started to
write on this driver. Is this correct ?

Christoph



Grant Grundler wrote:
> 
> Christoph Plattner wrote:
> > http://cvsweb.netbsd.org/bsdweb.cgi/syssrc/sys/arch/newsmips/apbus/
> 
> This looks like it's the right driver for the HP-PB SE SCSI.
> I noticed that SDTR isn't supported.
> But it's a starting point.
> 
> grant

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8814482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jul 2003 16:49:03 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h6TMmxI29916;
	Tue, 29 Jul 2003 18:48:59 -0400
Subject: Re: [parisc-linux] eisa nic: intel 82556. Driver?
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Diego Francisco de Gastal Morales <Morales@tj.rs.gov.br>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030729213235.GF22989@dsl2.external.hp.com>
References: 
	<41001F95FE172B4593DE6F50CAAF2D581AA227@mailserver.tj.rs.gov.br>
	<20030729213235.GF22989@dsl2.external.hp.com>
Content-Type: text/plain
Date: 29 Jul 2003 18:48:58 -0400
Message-Id: <1059518940.2298.251.camel@mulgrave>
Mime-Version: 1.0
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

On Tue, 2003-07-29 at 17:32, Grant Grundler wrote:
> No EISA cards which require DMA will work (yet).

Actually, I believe at least the aha1740 will.  The problem is that very
few have been properly converted to using the API.  A lot have been
converted to use the EISA bus abstraction, but there's no incentive to
take them further.

Fortunately, since EISA cards were mainly designed to work in PIO mode
in I/O space, there are quite a few that will work if they've only been
converted to the new probing API.

> Wax (EISA bus controller) docs haven't been published and a non-coherent
> IOMMU (have I got that right, James?) needs to be programmed for DMA.

I'm not really sure what the wax IOMMU does.  I suspect its main use is
to help ISA like cards, but I don't know for sure. It currently looks
like Wax/Mongoose are simply bypassed, and the DMA goes straight through
the U2/Uturn.

James

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD3CE4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 13:30:29 -0700 (MST)
Date: Mon, 3 Feb 2003 20:30:25 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Bad Max <badmax@club-internet.fr>,
	"Martin K. Petersen" <mkp@mkp.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: B132L+ and PCI cards
In-Reply-To: <yam9164.719.146359312@mail.club-internet.fr>
Message-ID: <Pine.LNX.4.44.0302032024560.28090-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 3 Feb 2003, Bad Max wrote:

> The question is not about Linux recognizing the new gfx card or not, the
> question is that my S3-based-card lock my B132L+ at power up. So I can't
> get Linux booting because the B132L+ don't finish the initialize process.


On Mon, 3 Feb 2003, Martin K. Petersen wrote:

> It depends on your machine type and firmware version.  Older firmwares
> are extremely picky.
>
> In the first PCI-based PA-RISC machines there was a corruption bug in
> Dino (the GSC-PCI bus adapter), and the firmware would disallow any
> other PCI cards than HP graphics.  Newer Dinos fixed that problem and
> PDC allowed 3rd party SCSI/network cards to pass.


Sorry for the misundestanding.
I was not aware that THIS is really a PDC/hardware related issue.

Max

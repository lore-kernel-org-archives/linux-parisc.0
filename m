Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e004.dhcp212-198-142.noos.fr [212.198.142.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48EBE4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Oct 2002 07:56:22 -0600 (MDT)
Date: Sun, 13 Oct 2002 15:56:13 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Cc: grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] rp2470 hang...getting closer
Message-Id: <20021013155613.3825e5e7.varenet@esiee.fr>
In-Reply-To: <20021013044033.88A544829@dsl2.external.hp.com>
References: <20021013044033.88A544829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 12 Oct 2002 22:40:33 -0600 (MDT)
"Grant Grundler" <grundler@dsl2.external.hp.com> wrote:


> My A500-4X boots and has 4 built-in SCSI ports (1 53c896 and 1 53c876).
> The A500-6X which hangs has an additional add-on 53c896.
> I suspect the two extra SCSI ports make the difference.
I don't think this is the only reason:
see, we have an A500-5X (4 built-in SCSI ports, 1 875 and 1 896), which hangs from boots to boots when booting with SYM2 driver, and at each boot _when SYM2 debug options are set to max verboseness_.

I also remember we had some troubles with SYM2 on our J5k (2 ports: 896), though I have not checked this box with SYM2 since 2.4.18-pa21.

We're investigating on that problem and keep the m-l informed.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

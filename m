Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from witte.sonytel.be (mail2.sonytel.be [195.0.45.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id D78B2484B
	for <parisc-linux@parisc-linux.org>; Tue, 30 Sep 2003 02:21:28 -0600 (MDT)
Date: Tue, 30 Sep 2003 10:21:16 +0200 (MEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Rene Brothuhn <rene.br@web.de>,
	Roman Zippel <zippel@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC on APUS development <linux-apus-devel@lists.sourceforge.net>
In-Reply-To: <20030930022132.GU24824@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.GSO.4.21.0309301019390.7902-100000@vervain.sonytel.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: NCR53c720
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

On Tue, 30 Sep 2003, Matthew Wilcox wrote:
>  - Someone converts the zorro device to embed the struct device.

I'm working on this. I have code that works on UML using a fake list of Zorro
devices, but so far I haven't modified any Zorro driver code.

BTW, A4000T SCSI is builtin, not Zorro, so we need a platform device for that.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

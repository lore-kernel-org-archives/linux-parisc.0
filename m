Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 620964840
	for <parisc-linux@parisc-linux.org>; Tue, 30 Sep 2003 07:47:56 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8UDlCq10178;
	Tue, 30 Sep 2003 09:47:12 -0400
Subject: Re: [parisc-linux] Re: NCR53c720
From: James Bottomley <James.Bottomley@steeleye.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Rene Brothuhn <rene.br@web.de>, Roman Zippel <zippel@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC on APUS development <linux-apus-devel@lists.sourceforge.net>
In-Reply-To: <Pine.GSO.4.21.0309301019390.7902-100000@vervain.sonytel.be>
References: <Pine.GSO.4.21.0309301019390.7902-100000@vervain.sonytel.be>
Content-Type: text/plain
Date: 30 Sep 2003 08:47:11 -0500
Message-Id: <1064929633.2183.7.camel@mulgrave>
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

On Tue, 2003-09-30 at 03:21, Geert Uytterhoeven wrote:
> BTW, A4000T SCSI is builtin, not Zorro, so we need a platform device for that.

That depends on how you want it to work.  On parisc, the Lasi (SCSI and
other) devices are technically "platform" in that they're all ASIC'd
together and soldered on to the main board.  However, it was easier to
create a parisc_bus type and lump them all under it than to use a
platform device....however, we did this in the very early days of the
generic device, a platform device might be more appropriate now.

James

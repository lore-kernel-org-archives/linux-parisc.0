Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA13780
	for <parisc-linux@puffin.external.hp.com>; Thu, 8 Jul 1999 11:28:41 -0600
Reply-To: <hull@cup.hp.com>
From: "Jim Hull" <jim_hull@hp.com>
To: "Matthew Wilcox" <Matthew.Wilcox@genedata.com>,
        "Philipp Rumpf" <prumpf@suse.de>
Cc: "Hannu Martikka" <martikka@stybba.ntc.nokia.com>,
        <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] vmlinux in C360
Date: Thu, 8 Jul 1999 10:28:54 -0700
Message-ID: <000601bec967$5a2bd8b0$a64d000f@jh733131.cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-reply-to: <19990707180526.F386@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> I guess the bootloader needs to force the W bit to 0?  I note that on
> an interruption, the W bit is set to the value of the default width
> bit, but how to set the default width bit is implementation defined.
> Anyone care to hint at how to set the default width bit too?

You use PDC_PSW to set the default width and default endian bits.  See page 2-59
in:

	http://dtf.external.hp.com/dtf/swdev/pdf/pdc.pdf

 -- Jim

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA23368
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 18:23:47 -0700
Date: Thu, 11 Nov 1999 02:23:31 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: bkatz@agilent.com
Cc: parisc-linux@thepuffingroup.com
Message-ID: <19991111022331.W25252@mencheca.ch.genedata.com>
References: <199911101524.HAA02309@meow.sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911101524.HAA02309@meow.sr.hp.com>; from Bill Katz William" on Wed, Nov 10, 1999 at 07:24:00AM -0800
Subject: [parisc-linux] ASP
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 10, 1999 at 07:24:00AM -0800, Bill Katz William" wrote:
> |Do ASP add-in cards exist?  We could just refuse to support them until
> |we know more :-)
> 
> I've never heard of one, and I've also never heard of a slot that might
> support one.  SO, with 99.9% confidence, no they don't exist.

Excellent.

> If you have specific Scorpio/ASP questions, mail them to me, and I'll 
> look them up in the docs.

OK, here's one...

When I don't attempt to program anything, the ASP defaults to irq 3.
Is this changeable?  What other devices can cause interrupts on Scorpio-
class machines, that don't go through ASP?

The following devices _do_ go through ASP:

EISA, 8042, SCSI, FDDI, RS232, Centronics, Ethernet, Graphics (1 + 2), Audio.

which seems pretty comprehensive.  I'm wondering about slimming down our
interrupt architecture for older machines; it's a trifle over-engineered
for a machine which can't be expanded.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA18506
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 Nov 1999 17:50:02 -0700
Date: Wed, 10 Nov 1999 01:52:45 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status
Message-ID: <19991110015245.U25252@mencheca.ch.genedata.com>
References: <19991110004745.T25252@mencheca.ch.genedata.com> <19991110011409.A17550@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991110011409.A17550@mathe.stud.uni-erlangen.de>; from Philipp Rumpf on Wed, Nov 10, 1999 at 01:14:09AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 10, 1999 at 01:14:09AM +0100, Philipp Rumpf wrote:
> > My question is: how?  Mach hardcodes the address of ASP to 0xf0800000,
> > but there's nothing even close in the driver list.  I notice in the
> 
> > 2. Scorpio Jr Core BA (11) at 0xf082f000, versions 0xb, 0x0, 0x70, 0x0, 0x0
> > 3. Scorpio Jr Core SCSI (10) at 0xf0825000, versions 0xb, 0x0, 0x71, 0x0, 0x0
> > 4. Scorpio Jr Core LAN (802.3) (10) at 0xf0826000, versions 0xb, 0x0, 0x72, 0x0, 0x0
> > 5. Scorpio Jr Core HIL (10) at 0xf0821000, versions 0xb, 0x0, 0x73, 0x0, 0x0
> > 6. Scorpio Jr Core RS-232 (10) at 0xf0823000, versions 0xb, 0x0, 0x75, 0x0, 0x0
> > 7. Scorpio Jr Core RS-232 (10) at 0xf0822000, versions 0xb, 0x0, 0x75, 0x0, 0x0
> > 8. Scorpio Jr Core Centronics (10) at 0xf0824000, versions 0xb, 0x0, 0x74, 0x0, 0x0
> 
> I am sorry, but when all this devices are within a 1 MB offset of the HPA we're
> looking for (0xf0800000 + 1 M = 0xf0900000, I hope), doesn't that look very nice
> indeed ?  You are right that the interrupt management (which is at address
> 0xf0800000) is not specifically printed here, but I think we should be able
> to deduce it, shouldn't we ?

Ummmm.. how exactly were you intending on going about this?  In lasi.c,
in lasi_init_chip(), round the address down to the nearest megabyte?
(possibly with a check on the type of `lasi' we found?)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

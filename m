Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA19832
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 01:02:00 -0700
Date: Wed, 10 Nov 1999 04:13:48 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status
In-Reply-To: <19991110015245.U25252@mencheca.ch.genedata.com>
Message-ID: <Pine.LNX.4.10.9911100408150.11043-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Wed, 10 Nov 1999, Matthew Wilcox wrote:
> Ummmm.. how exactly were you intending on going about this?  In lasi.c,
> in lasi_init_chip(), round the address down to the nearest megabyte?
> (possibly with a check on the type of `lasi' we found?)

We should probably have asp_init_chip() which gets triggered only for ASP
components.  Then you can adjust thhpa and go on with initialization.

- Alex

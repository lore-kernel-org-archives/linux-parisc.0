Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA05346
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Nov 1999 11:46:44 -0700
Date: Sat, 13 Nov 1999 14:59:04 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 useful
In-Reply-To: <199911131834.NAA00219@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.10.9911131458240.3678-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Sat, 13 Nov 1999, John David Anglin wrote:
> > For the machines which have ASP, am I right in saying they have no other
> > sources of interrupts?  ie what I want to do is:
> 
> Under hpux 10.X, I was told that the NCR 710/720 controller devices are
> sources of interrupts.  They do this by writing to the processor.  Thus,
> it appears they bypass the ASP.

I think those are routed through ASP just like they are on Lasi.  

At some point we need to be concerned with Zalon interrupt handling too.

- Alex

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA04932
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Nov 1999 11:33:09 -0700
Message-Id: <199911131834.NAA00219@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 715 useful
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Sat, 13 Nov 1999 13:34:20 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991113192150.X25252@mencheca.ch.genedata.com> from "Matthew Wilcox" at Nov 13, 99 07:21:50 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> For the machines which have ASP, am I right in saying they have no other
> sources of interrupts?  ie what I want to do is:

Under hpux 10.X, I was told that the NCR 710/720 controller devices are
sources of interrupts.  They do this by writing to the processor.  Thus,
it appears they bypass the ASP.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

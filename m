Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA05235
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Nov 1999 11:45:49 -0700
Date: Sat, 13 Nov 1999 14:58:06 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 useful
In-Reply-To: <19991113192150.X25252@mencheca.ch.genedata.com>
Message-ID: <Pine.LNX.4.10.9911131454390.3678-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Sat, 13 Nov 1999, Matthew Wilcox wrote:
> For the machines which have ASP, am I right in saying they have no other
> sources of interrupts?  ie what I want to do is:

I'm interpretting this question as:

"For machines which have ASP, am I right in saying that no other IO
devices apart from ASP generate interrupts to the CPU?"

I think the answer to that question is no, because:
- they have GSC slots, so you could have a card mode lasi or dino device
- doesn't WAX have it's own interrupts?

However, you might be able to set it up so that you still get the
optimization if at runtime it's found that the ASP is the only detected
device.

Did I interpret your question properly?

- Alex

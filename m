Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14356
	for <parisc-linux@puffin.external.hp.com>; Mon, 17 Jan 2000 13:29:05 -0700
Date: Mon, 17 Jan 2000 14:27:38 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Minutes
Message-ID: <20000117142738.P11300@thepuffingroup.com>
References: <20000114172721.V11300@thepuffingroup.com> <200001150016.QAA16991@chrome.rose.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200001150016.QAA16991@chrome.rose.hp.com>; from Kirk Bresniker on Fri, Jan 14, 2000 at 04:16:42PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jan 14, 2000 at 04:16:42PM -0800, Kirk Bresniker wrote:
> FYI --
> 
> | 4. Martin has cleaned up the serial and console code.  He will commit his
> |    changes tomorrow after he's tested it.
> 
> In testing the 2.3 kernel on my D320/1 with an Access Port (AP) card as

Could you please:

cvs update
rm .config
make oldconfig
make dep
make clean
make Image

and tell me if that works?  I've changed the .config to something which
seems to not get confused on a D270.  We don't have a D320 in the hardware
database; would you mind adding yours?

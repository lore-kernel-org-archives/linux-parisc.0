Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA14698
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 07:36:41 -0600
Received: from user51-186.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.51.186)
  by mailserv2.iuinc.com with SMTP; 25 Aug 2000 13:36:37 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CB3F1B005; Fri, 25 Aug 2000 14:35:03 +0100 (BST)
Date: Fri, 25 Aug 2000 14:35:03 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Kernel and palo source broken
Message-ID: <20000825143503.C13420@linuxcare.com>
References: <20000825124049.B13420@linuxcare.com> <20000825074716.M29677@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000825074716.M29677@vodka.thepuffingroup.com>; from matthew@wil.cx on Fri, Aug 25, 2000 at 07:47:16AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 25, 2000 at 07:47:16AM -0400, Matthew Wilcox wrote:
> On Fri, Aug 25, 2000 at 12:40:49PM +0100, Richard Hirst wrote:
> > Kernel wouldn't build - mostly arch/parisc/kernel/signal.c problems,
> > needs to include linux/version.h, PF_PTRACED undefined...
> 
> i just added sc_sar to the struct sigcontext.  i'm sure dhd has the
> right fix and will commit it once he gets in... rebuilding now.
> Hmm.  Wonder why that version number test doesn't work... oh well,
> changing it to #if 1 gets it compiled for me.

Needs #include <linux/version.h>.  I think I still had PF_PTRACED
undefined after that.

Richard

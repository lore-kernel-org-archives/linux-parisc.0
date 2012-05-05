From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sat, 5 May 2012 11:58:51 +0100
Message-ID: <20120505115851.1fecbe50@pyramind.ukuu.org.uk>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 4 May 2012 22:58:32 -0400 (EDT)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Hi
> 
> This patch fixes compile failure on PA-RISC.
> 
> BTW. if the PA-RISC port is uncompilable for all 3.4-rc versions (and 
> contains two other bugs that prevent it from booting) ... does it mean 
> that I'm the only one who is using PA-RISC with recent kernel?


Probably - and if so would you please get the NO_IRQ define fixed because
it seems parisc also has no maintainer any more 8)

Alan

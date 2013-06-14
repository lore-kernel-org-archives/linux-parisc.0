From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Fri, 14 Jun 2013 10:38:34 +0200
Message-ID: <20130614083834.GB5391@alpha.franken.de>
References: <20130614071142.GB10443@p100.box>
 <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com>
 <20130614073827.GA18871@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matt Turner <mattst88@gmail.com>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130614073827.GA18871@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 14, 2013 at 09:38:27AM +0200, Helge Deller wrote:
> I did not tested X11 yet (still need to fully install the C8000 with our
> unstable) - but Thomas mentioned once that this is needed for X11.

the pci mmap thing is a must for X11 to even get the card detected. This
patch is needed for the FireGL X3 cards with 256MB video memory.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

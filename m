From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 0/7] Generic RTC class driver
Date: Thu, 2 Apr 2009 09:56:40 -0400
Message-ID: <20090402135640.GA14159@bombadil.infradead.org>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <alpine.LRH.2.00.0903111134270.1040@vixen.sonytel.be> <20090311154505.GB5448@bombadil.infradead.org> <alpine.LRH.2.00.0903111825040.1040@vixen.sonytel.be> <20090313042543.GA3907@bombadil.infradead.org> <alpine.LRH.2.00.0904021141080.30882@vixen.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Alessandro Zummo <alessandro.zummo@towertech.it>,
	linux-m68k@vger.kernel.org, rtc-linux@googlegroups.com,
	linux-parisc@vger.kernel.org,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Linux/PPC Development <linuxppc-dev@ozlabs.org>,
	Paul Mundt <lethal@linux-sh.org>,
	Dann Frazier <dannf@dannf.org>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.0904021141080.30882@vixen.sonytel.be>
List-ID: <linux-m68k.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 02, 2009 at 11:42:02AM +0200, Geert Uytterhoeven wrote:
> On Fri, 13 Mar 2009, Kyle McMartin wrote:
> > On Wed, Mar 11, 2009 at 06:26:12PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, 11 Mar 2009, Kyle McMartin wrote:
> > > > On Wed, Mar 11, 2009 at 11:36:02AM +0100, Geert Uytterhoeven wrote:
> > > > > Is it OK for you to take it through your PA-RISC tree?
> > > > > If yes, I can resend the patch series with the collected acks.
> > > > 
> > I've pulled it and pushed it back out, I'll submit it when the merge
> > window opens.
> 
> Apparently the first half went it through akpm. Will you take care of the
> remaining commits?
> 

Yup, I updated the rtc-parisc branch last night, I'll push it along to
Linus this morning.

Thanks again, Geert.

cheers, Kyle

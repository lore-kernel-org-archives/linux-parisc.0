From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when compiling
Date: Thu, 18 Dec 2008 10:28:40 -0500 (EST)
Message-ID: <20081218152841.E85E74F28@hiauly1.hia.nrc.ca>
References: <20081218131357.260160@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218131357.260160@gmx.net> from "Helge Deller" at Dec 18, 2008 02:13:57 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > On Wed, Dec 17, 2008 at 8:46 PM, Carlos O'Donell
> > > Can we avoid copying code from do_page_fault and just call
> > do_page_fault?
> ...
> > However! I think you should not duplicate code. Please split out this
> > "bit" of code into a function in mm/fault.c and call it from
> > handle_interruption.
> 
> Sure. This patch was just meant to be short and easy understandable for review of the problem itself and without other noise like splitting out a function...

>From the documentation, it appears to me that a protection id trap should
be treated differently from a data TLB miss/data page fault.  The latter can
potentially be fixed with TLB insertion.  I don't think a protection ID trap
can be fixed...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [stable] PA-RISC: compile error in include/net/dst.h
Date: Tue, 24 May 2011 15:06:14 -0400
Message-ID: <20110524190614.GA25820@hiauly1.hia.nrc.ca>
References: <2612811.b2htuyZy9x@donald.sf-tec.de> <20110522143222.GB14556@kroah.com> <2254093.9oQvKLogfV@donald.sf-tec.de> <2522442.xP32cQyJEX@donald.sf-tec.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2522442.xP32cQyJEX@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 24 May 2011, Rolf Eike Beer wrote:

> As 2.6.38.6 does if I use the correct .config. So it is an older issue which is 
> not related to recent changes but likely some general HPPA breakage. We'll 
> discuss the rest on linux-parisc.

If you believe this is a compiler error, I suggest using gcc 4.5.3 or
4.6.0.

All releases prior to 4.5.2 contain bugs in delay slot optimization
resulting in incorrect register liveness.  4.3 and 4.4 were seriously
broken at -O1, and neither could bootstrap gcc at -O1.  I just completed
backporting all the reorg fixes that I am aware of, but they aren't
included in any 4.3 or 4.4 release.

It's quite possible most gcc 4.3 and 4.4 releases are miscompiled
on targets with branch delay slots.  As a side, all the fixes that I
backported were to the generic code.

I have been using 4.5.3 and haven't seen your problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

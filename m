From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix intermittent panics on wide firmware boxes
Date: Sun, 3 Feb 2008 19:46:03 -0500 (EST)
Message-ID: <200802040046.m140k4Io019976@hiauly1.hia.nrc.ca>
References: <1202085416.3318.134.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1202085416.3318.134.camel@localhost.localdomain> from "James Bottomley" at Feb 3, 2008 06:36:56 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Should this be CONFIG_STI_CONSOLE?
> 
> No, they're used in drivers/video/console/sticore.c which has a
> CONFIG_FB_STI gating it.  Whether it should is another patch matter ....

The reason I asked is I tried to apply your change against
2.6.22.16 and ran into problems with undefined references from
drivers/video/console/sticore.c.  However, the build didn't work.
Lost console after the infamous search the FAQ message.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

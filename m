From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix intermittent panics on wide firmware boxes
Date: Sun, 3 Feb 2008 20:06:51 -0500 (EST)
Message-ID: <200802040106.m1416raZ020342@hiauly1.hia.nrc.ca>
References: <1202085416.3318.134.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1202085416.3318.134.camel@localhost.localdomain> from "James Bottomley" at Feb 3, 2008 06:36:56 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> No, they're used in drivers/video/console/sticore.c which has a
> CONFIG_FB_STI gating it.  Whether it should is another patch matter ....

Looking at the Makefile, I see

obj-$(CONFIG_STI_CONSOLE)         += sticon.o sticore.o font.o
and
obj-$(CONFIG_FB_STI)              += sticore.o font.o

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

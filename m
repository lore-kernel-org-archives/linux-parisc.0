From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] fix intermittent panics on wide firmware boxes
Date: Sun, 03 Feb 2008 18:36:56 -0600
Message-ID: <1202085416.3318.134.camel@localhost.localdomain>
References: <200802040009.m14099EL019300@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200802040009.m14099EL019300@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Sun, 2008-02-03 at 19:09 -0500, John David Anglin wrote:
> > +#ifdef CONFIG_FB_STI
> 
> Should this be CONFIG_STI_CONSOLE?

No, they're used in drivers/video/console/sticore.c which has a
CONFIG_FB_STI gating it.  Whether it should is another patch matter ....

James

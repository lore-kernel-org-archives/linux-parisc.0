From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix intermittent panics on wide firmware boxes
Date: Sun, 3 Feb 2008 19:09:08 -0500 (EST)
Message-ID: <200802040009.m14099EL019300@hiauly1.hia.nrc.ca>
References: <1201890241.3134.54.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1201890241.3134.54.camel@localhost.localdomain> from "James Bottomley" at Feb 1, 2008 12:24:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> +#ifdef CONFIG_FB_STI

Should this be CONFIG_STI_CONSOLE?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

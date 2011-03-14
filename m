From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sun, 13 Mar 2011 22:16:09 -0400 (EDT)
Message-ID: <20110314021609.B97294DF4@hiauly1.hia.nrc.ca>
References: <20110314015058.GE29986@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110314015058.GE29986@parisc-linux.org> from "Grant Grundler" at Mar 13, 2011 07:50:58 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The URL I provided in other reply:
>     http://www.cs.bham.ac.uk/research/projects/poplog/src/master/C.hppa/src/aarith.s
> 
> implemented 64-bit/32-bit math. Should be easy to integrate.

I'll take a look.  The milli64.S file we currently have in gcc only has
32-bit divI and divU routines.  It seems the URL has a routine with a 64-bit
dividend.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

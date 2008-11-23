From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sun, 23 Nov 2008 11:57:17 -0500 (EST)
Message-ID: <20081123165718.0D5A94DCB@hiauly1.hia.nrc.ca>
References: <20081123163616.7399D4DF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081123163616.7399D4DF8@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 23, 2008 11:36:15 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The error building rc6 was:
> 
>   ...
>   LD [M]  fs/exportfs/exportfs.o
> 
>   malloc: ../../../bash/lib/sh/stringvec.c:73: assertion botched

This just happened with rc6, so the bug isn't fixed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

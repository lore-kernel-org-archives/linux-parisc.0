From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: resource_size_t printk woes...
Date: Thu, 1 Jan 2009 12:14:41 -0500 (EST)
Message-ID: <20090101171442.5BF174EDA@hiauly1.hia.nrc.ca>
References: <495CBFCF.3010702@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495CBFCF.3010702@gmx.de> from "Helge Deller" at Jan 1, 2009 02:06:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

I just want to say that I like Kyle's approach.  There already exists
the 'R' modifier for %p.  This outputs a pair of resource_size_t values.
We just need a modifier to handle the printing of the start value in
a manner similar to that for the 'R' modifier.  So, I think this issue
needs another go around.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

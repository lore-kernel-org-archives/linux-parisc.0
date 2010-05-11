From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 11 May 2010 17:39:02 -0400 (EDT)
Message-ID: <20100511213903.8330A4E77@hiauly1.hia.nrc.ca>
References: <20100511163700.GA20368@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100511163700.GA20368@hiauly1.hia.nrc.ca> from "John David Anglin" at May 11, 2010 12:37:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On gsyprf11 (PA8700), James' kmap change doesn't fix minifail and we need
> the cache flush in ptep_set_wrprotect to fix minifail.  The kmap change
> causes general instability by itself.

I'm going to merge the two changes and see what happens.  With just
the flush in ptep_set_wrprotect, I'm seeing some segvs in sh on
gsyprf11.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Mon, 12 Apr 2010 17:41:17 -0400 (EDT)
Message-ID: <20100412214118.46D925160@hiauly1.hia.nrc.ca>
References: <4BC38A6A.3020404@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BC38A6A.3020404@gmx.de> from "Helge Deller" at Apr 12, 2010 11:02:34 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Maybe it will help your B2000.  However, let's just go one step at a time.
> 
> Sadly no luck :-(
> minifail still crashes...

I wonder if it would help to enable the kunmap_atomic support used
for the PA8800/PA8900 for the B2000.  It might be non equivalent aliasing
causes corruption.

Are you using standard 4K pages?

I assume that it's always the thread created by pthread_create that's causing
the segv.  What does the stack region for the thread look like when it drops
core?  Possibly, we have two separate issues.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

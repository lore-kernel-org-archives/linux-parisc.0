From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.4 slower than 3.3?
Date: Fri, 15 Apr 2005 17:24:27 -0400 (EDT)
Message-ID: <200504152124.j3FLORW4025854@hiauly1.hia.nrc.ca>
References: <20050415180446.GF26980@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050415180446.GF26980@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 15, 2005 02:04:47 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> My glibc build went from 50 minutes to 80+ minutes when I moved to gcc
> 3.4 from 3.3. Atleast this seems to be the only change.
> 
> Is 3.4. that much slower?

Possibly.  However, the generated code is likely faster on average.
Compilation times are very much dependent on the optimization passes run,
particularly the amount of inlining done, and the amount of memory
available.  I believe that the inlining limits are somewhat higher
than in 3.3.  I've seen at least one C++ case where inlining can
change compilation times from minutes to hours.

If someone wants to try, it probably would be useful to see how
performance compares on various benchmarks.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

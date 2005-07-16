From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 16:29:54 -0400 (EDT)
Message-ID: <200507162029.j6GKTsGE011108@hiauly1.hia.nrc.ca>
References: <20050716201356.GJ5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050716201356.GJ5314@systemhalted.org> from "Carlos O'Donell"
	at Jul 16, 2005 04:13:56 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Will this ever happen during inlining?
> 
> fstd chain -> memory
> operation 1
> 			fstd chain -> memory
> fldd chain -> regs
> 			operation 2
> 			fldd chain -> regs
> 
> Operation 2 could trap when expected that it couldn't because the fstd
> had cleared the traps.

I guess clobbering all the fp registers plus r0 will stop this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

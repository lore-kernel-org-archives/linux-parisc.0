From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 18:53:09 -0500 (EST)
Message-ID: <200411292353.iATNrAc4005771@hiauly1.hia.nrc.ca>
References: <20041127064710.GL9148@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041127064710.GL9148@tausq.org> from "Randolph Chung" at Nov 27,
	2004 01:47:10 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> to fix this we will probably need to introduce long branch stubs into 
> into the kernel module loader. anybody want to give this a shot?

Another option which is probably less work is to build your kernel
and modules with -mpa-risc-2-0.  This should give you 22-bit branches.

There is also -mlong-calls.  Not too well tested but in theory it
should always avoid the above problem.  It's much more expensive
than -mpa-risc-2-0.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

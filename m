From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Mon, 19 Feb 2007 23:49:49 -0500 (EST)
Message-ID: <200702200449.l1K4nn04019104__27377.883034251$1416624307$gmane$org@hiauly1.hia.nrc.ca>
References: <20070219182112.GA32148@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070219182112.GA32148@athena.road.mcmartin.ca> from "Kyle
	McMartin" at Feb 19, 2007 01:21:12 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Keep in mind James pointed out that while he fixed the primary source of
> corruption, there still might be second-order problems...

There's always bugs...

While this might be a kernel TLB management problem, there's no strong
evidence of that and I wouldn't automatically assign the problem to the
pa8800 bug black hole.  This could just as easily be a bug in the dynamic
loader.  The system now runs for weeks with only occasional problems in
UP mode.  Will see about SMP mode.

The memory corruption is very limited and appears to occur in the
initial phase of loading libc.  It's happened twice while the echo
command tried to generate a file list building libjava.  Tens of
thousands of other applications have been launched successfully.
Probably, a lot more applications would die if memory corruption
was rampant.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

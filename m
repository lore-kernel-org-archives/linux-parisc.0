From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] some other small bitops.h suggestion?
Date: Fri, 15 Apr 2005 17:41:22 -0400 (EDT)
Message-ID: <200504152141.j3FLfMXi025954@hiauly1.hia.nrc.ca>
References: <20050415192713.GA26321@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050415192713.GA26321@colo.lackof.org> from "Grant Grundler" at
	Apr 15, 2005 01:27:13 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> My take is "volatile" is just a way to tell gcc something about the
> code/data that it can't see. I'm not going to quibble with linus
> about whether data is volatile or code is volatile. I think in some
> cases it's one (e.g accessing memory mapped HW) or the other
> (accessing shared data). Key thing is gcc be able to optimize code
> but not remove it (especially in the latter case).

The problem here is that there are some conventions regarding the use
of "volatile" in GCC C that are rather poorly documented.  You might
look at this discussion regarding volatile and C++ to get a flavor
for what I mean <http://gcc.gnu.org/ml/gcc/2005-04/msg00724.html>.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Mon, 5 Jun 2006 12:49:52 -0400 (EDT)
Message-ID: <200606051649.k55Gnqtf004110@hiauly1.hia.nrc.ca>
References: <20060605144033.GD1335@skunkworks.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060605144033.GD1335@skunkworks.cabal.ca> from "Kyle McMartin"
	at Jun 5, 2006 10:40:33 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> That's absolutely bizarre. Can you include steps for us toolchain
> newbies to reproduce this? I'd love to try and trace down why this is
> occuring. It could be a problem indicative of something very funky
> occuring in our kernel.

There definitely are some funky things going on in the kernel.
For example, if I try to build GCC with 'make -j 4 bootstrap' on
gsyprf11, about 50% of the time make dies because of a malloc data
corruption or a shell problem.  However, I never see this with
just 'make bootstrap'.

It's crossed my mind that locking could break if there is a memory
aliasing issue,

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] c3k panics
Date: Sun, 29 May 2005 13:45:39 -0400 (EDT)
Message-ID: <200505291745.j4THjd8G029023@hiauly1.hia.nrc.ca>
References: <42999A30.6070602@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42999A30.6070602@tiscali.be> from "Joel Soete" at May 29,
	2005 10:32:16 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> John David Anglin wrote:
> > I can panic my c3750 very consistently running the binutils testsuite
> > (cvs source as of 20050526).
> mmm the experimental debian bintuils-2.16 seems to works fine for me (kernel 2.6.8.1-pa11 32bit on a b180).

I'm 95% certain that it's this assembler file that causes the crash:

	.data

foo:
	.block
bar:
        .block 0x3fffffff
com:

This causes the allocation of ~ 1GB of memory by the assembler.  My c3k
has 1GB of memory but the swap is only 512MB.  There aren't any limits
on this allocation (ulimit -a).  The assembler is using obstacks which
I believe use malloc for the allocation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

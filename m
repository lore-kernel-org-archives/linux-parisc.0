From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Merged new binutils.
Date: Wed, 14 Dec 2005 09:23:21 -0500 (EST)
Message-ID: <200512141423.jBEENLhP028272@hiauly1.hia.nrc.ca>
References: <IRHPEQ$F2D0F9EAA5D374E7768DFCBED2602C1F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org,
 tsg45800@scarlet.be
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IRHPEQ$F2D0F9EAA5D374E7768DFCBED2602C1F@scarlet.be> from "Joel
	Soete" at Dec 14, 2005 02:28:02 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I merged a new binutils into cvs.parisc-linux.org. Anyone want to take a
> > look at why we have 38 regressions in ld?
> > 
> Sorry, I don't have any more access to cvs :-(
> mmm (should be most egoistic) couldn't it be placed a compressed co on
> cvs.p-l.org/download as build-tools-latest.tar.gz?
> (just forget if it's too much work ;-)

There are some snapshots here:
ftp://sourceware.org/pub/binutils/snapshots/.

The version kept at cvs.parisc-linux.org is mainly for TLS development.
It's not generally kept up to date.  Other than for TLS, the work of
maintaining parisc binutils is being done directly in the binutils cvs.
In the early days of parisc-linux, there were a variety of parisc bug
fixes in the parisc tree.  However, these were all merged several years
ago.

H.J.L supports a "linux" version of binutils, but it's not regularly
tested on parisc as far as I know.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

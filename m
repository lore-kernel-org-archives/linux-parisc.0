From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] input constraints in atomic.h too loose ?
Date: Sun, 11 Feb 2007 12:36:56 -0500 (EST)
Message-ID: <200702111736.l1BHav1a028394__24370.5841283829$1416624284$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702110918k1aca7744rc8abb50949a22069@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702110918k1aca7744rc8abb50949a22069@mail.gmail.com>
	from "Carlos O'Donell" at Feb 11, 2007 12:18:54 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > /tmp/ccvCRbqg.s:43: Error: bad expression

> What *is* the bad assembly here. Please don't make me count assembly
> line numbers, just point me at the bad asm.

The problem is the "m" constraint is too broad for ldw and stw insns.
These instructions don't accept any memory address.  As suggested,
the "o" constraint should work.  Alternatively, the address of the
variables could be forced to a register.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

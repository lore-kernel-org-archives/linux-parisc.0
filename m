From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: [Update] TLS toolchain.
Date: Tue, 10 Jan 2006 09:47:06 -0500 (EST)
Message-ID: <200601101447.k0AEl7fP003814@hiauly1.hia.nrc.ca>
References: <43C36337.9040202@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43C36337.9040202@tausq.org> from "Randolph Chung" at Jan 10,
	2006 03:33:11 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I don't think we are ready for NPTL yet. Did we settle on how we are
> implementing futexes? Are we going to implement a new kernel fsyscall
> for the compare-and-exchange primitive that NPTL seems to depend on?

Regarding atomic, I suggest looking at
http://www.hpl.hp.com/research/linux/atomic_ops and
http://www.hpl.hp.com/techreports/2005/HPL-2005-217.html.

I haven't had a chance to look at it but this work is part of a study
being done to add thread support to C++.  This came up when I added a
userspace implementation of CAS to java.  Apparently, gc7alpha versions
are using this code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

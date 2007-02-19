From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: NPTL for hppa-linux is not backwards compatible
	with Linuxthreads.
Date: Mon, 19 Feb 2007 13:20:40 -0500 (EST)
Message-ID: <200702191820.l1JIKelf003875__6059.79243196106$1416624305$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702190825y26ea8d5eib876818d9cb89c5d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: matthias.klose@ubuntu.com,
 roland@redhat.com,
 libc-ports@sourceware.org,
 dave.anglin@nrc.ca,
 willy@debian.org,
 debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702190825y26ea8d5eib876818d9cb89c5d@mail.gmail.com>
	from "Carlos O'Donell" at Feb 19, 2007 11:25:11 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Do you know of any other ABI breaks that could be coordinated with
> this transition?

No.  The last break was GCC 4.1.0 where the calling convention
for passing complex values was corrected.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

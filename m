From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Fri, 1 Jun 2007 09:05:18 -0400 (EDT)
Message-ID: <200706011305.l51D5I3i028030__44851.8662168228$1416624380$gmane$org@hiauly1.hia.nrc.ca>
References: <465FBA5F.2010909@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: seb@frankengul.org (=?ISO-8859-1?Q?S=E9bastien_Bernard?=)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <465FBA5F.2010909@frankengul.org> from
	"=?ISO-8859-1?Q?S=E9bastien_Bernard?=" at Jun 1, 2007 08:19:11 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hi,
> I discovered that the breakage of portmap on hppa is related to the
> -pie linkage.
> Every program linked with the -pie option segfaults at start.
> Unfortunately, portmap is unconditionnaly built with this option.
> I suspect nscd is in the same case.

This problem was fixed sometime ago.  I don't see it with libc6
2.3.6.ds1-13.  Also, nscd doesn't segfault on my system.  Make sure
the libc6 and binutils packages on your system are up to date.

If they are up to date and you still have the problem, provide testcase
and details on libc6, gcc and binutils versions.

The problem was in crt1.o and related to the handling of R_PARISC_PLABEL21L
and R_PARISC_PLABEL14R relocations.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

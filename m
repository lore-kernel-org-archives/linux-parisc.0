From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Thu, 6 Sep 2007 15:47:35 -0400 (EDT)
Message-ID: <200709061947.l86JlZR2029925__35868.639793671$1416624435$gmane$org@hiauly1.hia.nrc.ca>
References: <200709061511.38991.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: vapier@gentoo.org (Mike Frysinger)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200709061511.38991.vapier@gentoo.org> from "Mike Frysinger" at
	Sep 6, 2007 03:11:37 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Nominally, the first part of the target string represents the
> > architecture of the kernel, and not the userspace architecture.
> > This is not sufficient to configure runtime applications when multiple
> > architectures are supported by one kernel.
> 
> i'm not terribly familiar with the breadth of the parisc family, but isnt
> 64bit only available with 2.0 ?  so it'd be pretty clean on Linux to say
> hppa64-*-linux-* means 64bit userland, everything else is 32bit

That's what is done now.  config.guess chooses between hppa64 and
32bit hppa variants based on the architecture of the compiler in use (CC).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 15:13:52 -0500 (EST)
Message-ID: <200701272013.l0RKDq7Q012171__42091.0711204216$1416624270$gmane$org@hiauly1.hia.nrc.ca>
References: <200701271448.05974.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: vapier@gentoo.org (Mike Frysinger)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701271448.05974.vapier@gentoo.org> from "Mike Frysinger" at
	Jan 27, 2007 02:48:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > huh ?  that patch was against vanilla binutils release ... in other words,
> > i did `tar jxf binutils-2.17.50.0.11.tar.bz2` ... so unless Gentoo has
> > patched tar to screw up elf32-hppa.c, i dont think it's a Gentoo issue
> 
> looking through some binutils history, this looks like some fix that HJLu h=
> as=20
> done (Jan 2007 / PR3826) ... i'll complain to him/binutils list that he's
> fuckin up my mojo :)

Just blame HJL.  Personally, I don't see much merit in using
"linux binutils" on hppa.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

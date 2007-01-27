From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 14:19:13 -0500 (EST)
Message-ID: <200701271919.l0RJJDeq011264__45218.0795291953$1416624269$gmane$org@hiauly1.hia.nrc.ca>
References: <200701271256.06424.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: vapier@gentoo.org (Mike Frysinger)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701271256.06424.vapier@gentoo.org> from "Mike Frysinger" at
	Jan 27, 2007 12:56:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > There's been very few hppa changes to binutils in the past several
> > months.  I can't duplicate the problem, so maybe there's something
> > wrong with your libc setup.
> 
> no, one of the very few changes to the hppa bfd broke things ... it's writi=
> ng=20
> the ELF OS ABI field as HPUX instead of Linux and well, that doesnt go over=
> =20
> very well :)
> 
> here's the weird thing ... looking at bfd/elf32-hppa.c in binutils 2.17.50.=
> 0.
> {10,11} doesnt seem to match the version actually in cvs ??
> 
> at any rate, attached patch applies against 2.17.50.0.10 and 2.17.50.0.11 a=
> nd=20

The problem appears to have been introduced by gentoo by the addition
of several ELF_OSABI defines to the file ;)  I don't think they should
be there.

The new elf_bed defines look ok.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

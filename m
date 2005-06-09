From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Remove __ldcw_align for PA-RISC 2.0 processors
Date: Thu, 9 Jun 2005 14:05:24 -0400 (EDT)
Message-ID: <200506091805.j59I5OTP010102@hiauly1.hia.nrc.ca>
References: <200506091732.KAA07794@lucy.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@fattire.cabal.ca,
 parisc-linux@lists.parisc-linux.org
To: jim.hull@hp.com (Jim Hull)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506091732.KAA07794@lucy.cup.hp.com> from "Jim Hull" at Jun 9,
	2005 10:32:34 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Grant wrote: 
> 
> > Jim Hull (HP PARISC/IPF Architect) published an errata later
> > indicating that the alignment could be relaxed to "native access"
> > (ie 4 byte for ldcw) if ",co" (Coherent Operation) completer 
> > was specified.
> > The email was dated Jan 29th, 2003.
> > But I can't a direct public reference of it. :^(

As an aside, binutils support for cache control completers was
recently improved for all load/store instructions.  Binutils
is now more precise in when cache control completers can be used.
It should now be possible to use either 1.x or 2.0 mnemonics
with cache control completers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

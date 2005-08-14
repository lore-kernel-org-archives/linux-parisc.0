From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Sat, 13 Aug 2005 21:32:00 -0400 (EDT)
Message-ID: <200508140132.j7E1W0KF011257@hiauly1.hia.nrc.ca>
References: <20050812180551.GA32609@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050812180551.GA32609@colo.lackof.org> from "Grant Grundler" at
	Aug 12, 2005 12:05:51 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > Odd that it uses "rp" for the insn at 101068ac and "%r2"
> > > for the b,l insn at 101068a4.
> > 
> > I'll look at it.  It's a small inconsistency in hppa-dis.c,
> > affecting objdump, etc.
> 
> ok. minor problem though.

This is now fixed in binutils head along with a couple of other
special cases where we printed '%' before register names.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

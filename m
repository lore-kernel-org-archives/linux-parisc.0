From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gij/gcj-dbtool segfaults
Date: Thu, 7 Sep 2006 18:51:20 -0400 (EDT)
Message-ID: <200609072251.k87MpKtq025883@hiauly1.hia.nrc.ca>
References: <17664.34373.179880.934087@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17664.34373.179880.934087@gargle.gargle.HOWL> from "Matthias
	Klose" at Sep 7, 2006 10:51:17 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> at least no more bus errors; that started after the backport of
> classpath-0.92 and gcj-4.2 to the 4.1 branch; I built a current 4.2
> compiler yesterday, but found the same behaviour on the trunk.  It's
> reproducible by installing gij-4.2 (or by running gcj-dbtool-4.2).

FWIW, this isn't happening in my builds on either linux or hpux.  I
did have this problem a couple of months ago in porting to hpux but
the problem went away after HP fixed a linker bug.  Make sure the
shared libraries being used by gcj-dbtool are exactly as expected.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

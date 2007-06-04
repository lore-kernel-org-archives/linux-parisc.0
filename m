From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 21:23:49 -0400 (EDT)
Message-ID: <200706040123.l541Nnc1022459__22539.4736546606$1416624388$gmane$org@hiauly1.hia.nrc.ca>
References: <20070604011007.GA2075@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070604011007.GA2075@fattire.cabal.ca> from "Kyle McMartin" at
	Jun 3, 2007 09:10:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Er, then why didn't it complain before?

I think the linker script may have changed.

> Can you do a quick test if I cook up a patch?

Yes.  I disabled the code after "cows can fly".  2.6.22-rc2
now boots and df works.s

However, svn is still behaving wierdly:
Badness at 000000004018e2cc
Seems to be in __kmalloc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 13:37:50 -0400 (EDT)
Message-ID: <200507161737.j6GHboDo009866@hiauly1.hia.nrc.ca>
References: <20050716161603.GE5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050716161603.GE5314@systemhalted.org> from "Carlos O'Donell"
	at Jul 16, 2005 12:16:04 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Who previously executed the COPR,0,0?

I dunno, incorrect identify sequence?  I agree the 1.1 arch is specific
about how to do an identify sequence.

> I use the fldd to set the new cleared state of the status register.

I had been wondering if fstw and fldw could be used, but it's an
undefined operation to set T with fldw and fstd clears T, so I believe
your use of fstd and fldd is correct in this sequence.

However, you have to be careful in using fstd to get the fp status
register as it clears T after the insn.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

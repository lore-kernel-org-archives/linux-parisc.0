From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] 	Heads up,	2.6.7-pa0 FTBS with 64-bit toolchain
	+ loop
Date: Sun, 20 Jun 2004 21:21:02 +0200
Message-ID: <16597.58270.737890.793378@gargle.gargle.HOWL>
References: <20040616194411.GB3412@baldric.uwo.ca>
	<40D35B15.3040505@tiscali.be> <20040618212505.GA12572@engsoc.org>
	<20040619011714.GC23535@colo.lackof.org>
	<20040619015455.GE12572@engsoc.org> <40D4C53E.5000309@tiscali.be>
	<16597.22580.146769.47375@gargle.gargle.HOWL>
	<40D5B081.30508@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40D5B081.30508@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Joel Soete writes:
> > deb http://ftp.debian.org/debian ../project/experimental main contrib non-free

sorry, should be ftp.de.debian.org, or every other mirror.

> ok i miss something in my sources.list I only have:
> deb http://ftp.de.debian.org/debian experimental main contrib non-free
> deb-src http://ftp.de.debian.org/debian experimental main contrib non-free
> 
> A link? (Packages, Sources, Release files only look like the same)

deb http://ftp.de.debian.org/debian ../project/experimental main contrib non-free
deb http://ftp.de.debian.org/debian experimental main contrib non-free

both lines should work.

> > then install it using apt-get -t experimental gcc-3.4

apt-get -t experimental install gcc-3.4


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

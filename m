From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] 	Heads up,	2.6.7-pa0 FTBS with 64-bit toolchain
	+ loop
Date: Sun, 20 Jun 2004 11:26:12 +0200
Message-ID: <16597.22580.146769.47375@gargle.gargle.HOWL>
References: <20040616194411.GB3412@baldric.uwo.ca>
	<40D35B15.3040505@tiscali.be> <20040618212505.GA12572@engsoc.org>
	<20040619011714.GC23535@colo.lackof.org>
	<20040619015455.GE12572@engsoc.org> <40D4C53E.5000309@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40D4C53E.5000309@tiscali.be>
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
> That said, my very interest in 3.4 (and 3.5 now because is became
> the debian gcc-snapshot ;) )

gcc-3.4 is available as a package as well. Add the following line to
to your sources.list.

deb http://ftp.debian.org/debian ../project/experimental main contrib non-free

then install it using apt-get -t experimental gcc-3.4
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

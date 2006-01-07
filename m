From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] ld summary, all is good.
Date: Sat, 7 Jan 2006 18:14:34 -0500
Message-ID: <20060107231434.GP17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


                === ld Summary ===

# of expected passes            215
# of expected failures          41
/mnt/flaire/src/tls-toolchain-hppa/build/binutils/ld/ld-new 20051210

I built my own libc6 with the appropriate support for some of our new
relocations and binutils is happy. I have the patches attached, I will
need to feed them to the debian-glibc team.

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

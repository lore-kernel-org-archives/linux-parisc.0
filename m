From: Ivar <orskaug@stud.ntnu.no>
Subject: [parisc-linux] Firefox/Mozilla patches
Date: Fri, 17 Dec 2004 23:26:57 +0100 (MET)
Message-ID: <Pine.GSO.4.58.0412172254550.1196@panter.stud.ntnu.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc-linux@parisc-linux.org
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


The apt-versions of Mozilla & Firefox have never worked for me, so I've
recently been looking into the codebase. Compiling with the current
toolchain (gcc-3.3) was painless, however it was necessary to slightly
modify the XPCOM HP-UX/HP-CC code for it to work with gcc & parisc-linux.
Some platform spesific code is required to make XPCOM (and consequently
Mozilla/Firefox) work on any combination of OS/compiler/architecture.
XPCOM calls virtual funtions direcly, using the vtable pointers (not via
the runtime).

Anyway, after applying these modifications Firefox 1.0 runs nicely on my
C3000. If  these issues are not resolved in the apt versions of
mozilla/firefox, I will submit my patches,

cheers,
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

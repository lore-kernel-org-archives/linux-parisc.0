From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Feature request for parsic kernel hackers (2
	mini-projects)
Date: Mon, 1 Aug 2005 00:57:38 -0400
Message-ID: <20050801045734.GU9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


parisc,

I have two small kernel hacker projects.

1. Add cr27 printing to HPMC, this would let someone debug
   multi-threaded problems by examining the thread register.
   It would be even cooler to make this NPTL aware and dump
   the TCB and DTV.

2. Add some option that enables the user to print something
   like /proc/self/maps when a user process dies. This is 
   very usefull for translating a fault address into a quick
   estimate of which library function crashed.

Fame and glory? My gratitude? :)

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

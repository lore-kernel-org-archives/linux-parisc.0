Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA25281
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Mar 2000 01:52:10 -0700
From: BOSCHINI@ICIL64.CILEA.IT
Date: Fri, 31 Mar 2000 10:51:34 +0000 (MET-01DST)
To: PARISC-LINUX@THEPUFFINGROUP.COM
Cc: BOSCHINI@cilea.it, QUATTRONE@cilea.it
Message-id: <01JNOHLGY86Q000XJ1@ICIL64.CILEA.IT>
MIME-version: 1.0
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Subject: [parisc-linux] Building bin-utils and gcc on HP735...

Hello, 

first of all, compliments for the project.
I started some days ago trying to install parisc-linux on a 735 box. 
I started using gcc-2.95.2 and the corresponding binutils, as downloaded from 
http://hpux.tn.tudelft.nl/

Then, realisng a needed the parisc includes from the puffin, I re-started from
scratch. As sson as I start building, both with HP Ansi C compiler as well with
gcc 2.95, the binutils, I get an error about not finding bison

Making all in po
        /bin/sh /TMP/binutils/binutils/../ylwrap "`if [ -f ../bison/bison ] ;
then echo ../bison/bison -y -L/TMP/binutils/binutils/../bison/ ; else echo
bison -y ; fi`" /TMP/binutils/binutils/arparse.y y.tab.c arparse.c y.tab.h
arparse.h --  -d
/TMP/binutils/binutils/../ylwrap[86]: bison:  not found.
*** Error exit code 1

So, i decided to try building the puffin gcc using my old bin-utils, but,
obviously, make dies as soon as bison is required.

Do I need to install bIson first of building binutils and gcc ?

I have another question as well, is FDDI supported ? 

My box is on FDDI so I'd like to know it.

Anyway, thanks in advance and again, compliments for the great job !!!! 

Matteo Boschini
System and Network Administrator
C.I.L.E.A.
(boschini@cilea.it)

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA29142
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Mar 2000 09:00:08 -0700
From: BOSCHINI@ICIL64.CILEA.IT
Date: Fri, 31 Mar 2000 17:59:32 +0000 (MET-01DST)
Subject: Re: [parisc-linux] Building bin-utils and gcc on HP735...
To: willy@thepuffingroup.com
Cc: PARISC-LINUX@thepuffingroup.com
Message-id: <01JNOWOXLRXQ000XJ1@ICIL64.CILEA.IT>
MIME-version: 1.0
Content-type: TEXT/PLAIN; CHARSET=US-ASCII

Hello all, 

I installed bison and then flex (also needed) but still binutils make dies with
a strange (at leat to me) yacc error:

lex  /TMP/binutils/ld/ldlex.l && mv lex.yy.c ldlex.c
"/TMP/binutils/ld/ldlex.l" line 303: error 3: Parse tree too big, Try using %e
num
1000/1000 nodes(%e), 0/2500 positions(%p), 1/500 (%n), 0 transitions, 0/1000
packed char classes(%k), 0/4000 packed transitions(%a), 0/5000 output slots(%o)
*** Error exit code 1

Stop.
*** Error exit code 1


Nevertheless, being the impatient chap that I am, I stil ltried to buil
gg-latest, which,in turn, dies with an as error:

_muldi3
as: "/var/tmp/ccFVV40c.s", line 1: error 1052: Directive name not recognized -
FILE
as: "/var/tmp/ccFVV40c.s", line 3: error 1052: Directive name not recognized -
STABS
as: "/var/tmp/ccFVV40c.s", line 4: error 1052: Directive name not recognized -
STABS
as: "/var/tmp/ccFVV40c.s", line 5: error 1052: Directive name not recognized -
TEXT
as: "/var/tmp/ccFVV40c.s", line 6: error 1052: Directive name not recognized -
LTEXT
as: "/var/tmp/ccFVV40c.s", line 7: error 1052: Directive name not recognized -
STABS
as: "/var/tmp/ccFVV40c.s", line 8: error 1052: Directive name not recognized -
STABS


and so forth untill maximu error count is reached.....

are the two related ? 
or is it just me doing something very stupid ?

thanks in advance, 

matteo

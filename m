Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA22977
	for <parisc-linux@puffin.external.hp.com>; Sat, 21 Oct 2000 14:38:33 -0600
Date: Sat, 21 Oct 2000 13:39:50 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001021133950.A7980@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] parisc asm questions
List-ID: <linux-parisc.vger.kernel.org>

would someone please enlighten me about why this is happening?

i have a simple fetch-add asm loop:

/* arg0 is a pointer to a buffer, %arg1 is the length, %r4 == %arg1>>2 */
$loop:
	ldws,ma		4(%arg0), %r3
	addc		%ret0, %r3, %ret0
	addib,<>	-1, %r4, $loop
	addi		-4, %arg1, %arg1

i notice that the sum returned is sometimes off by a certain amount from
what i was expecting.  while i was tracing this down, i added a line to 
the loop so that it's:

$loop:
	add		%r0, %r3, %r3	/* isn't this equivalent to a nop? */
	ldws,ma		4(%arg0), %r3
	addc		%ret0, %r3, %ret0
	addib,<>	-1, %r4, $loop
	addi		-4, %arg1, %arg1

and i get fairly different behavior. I think I'm not understanding how
the carry bit gets updated or something. any hints will be much appreciated.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

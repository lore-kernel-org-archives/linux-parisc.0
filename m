Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f168.law14.hotmail.com [64.4.21.168])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2079482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Mar 2001 18:38:16 -0700 (MST)
From: "Brian Stewart" <pdksh@hotmail.com>
To: rhirst@linuxcare.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Help with 710 Network Driver
Date: Tue, 27 Mar 2001 01:38:11 
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_69f4_186c_2e0b"
Message-ID: <F168pWd7KKQpQq5pnee00000138@hotmail.com>
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_69f4_186c_2e0b
Content-Type: text/plain; format=flowed

I found this in the pmk1.1 micro kernel source for mklinux regarding the 
intel ethernet chip. It appears the chip/system is droping the CX interrupt 
at a very high rate on the 705/710. To correct this the micro kernel driver 
times the last time a CX interrupt was sent I belive. Check it out and maybe 
you can make heads of it Ricahard.

BTW what is a CX interrupt.

Thank You


It is part of the if_596.c ethernet driver code.
_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.

------=_NextPart_000_69f4_186c_2e0b
Content-Type: text/plain; name="pc596xmt_bug.txt"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="pc596xmt_bug.txt"


#ifdef	PC596XMT_BUG
/*
* The PC596 board on hp700's apparently can lose CX interrupts
* (i.e. interrupts when transmit is complete).  We used to deal
* with this by a 3-second watchdog timeout.  This is not adequate
* for the newer, smaller, all-on-one-board hp710's and hp705's;
* these newer machines lose many more CX interrupts when busy,
* seriously degrading network performance.
*
* A simple datapoint illustrates this more clearly.  A 730 which
* transmitted 4.7 million packets lost 21 CX interrupts.  A 710
* which transmitted 134 thousand packets lost 139 interrupts.
*
* When PC596XMT_BUG is #define'd: On packet transmission, determine
* how long to wait for CX interrupt.  When a CX interrupt arrives,
* clear this timer.  After each call to hardclock() (see "trap.c"),
* if the current time exceeds our timer, set the timer's "tv_sec"
* field to "-1" and create a LAN interrupt.
*
* Note: these data structures are accessed in hardclock(); hence
* they are not part of `pc_softc_t'.
*
* Note: If pc586_waitxmt is too small then you'll end up declaring
* tx interrupts lost too quickly (hardware may still be retransmitting
* due to collisions).  When that happens you'll walk on-top of the
* hardware tx buffer and trash the packet the hardware is still trying
* to put on the wire.
*
* Simple version of the hardware backoff alg:
*
* while (retries < MAX)
*   wait 2**min(retries,10) * slot time
*
* By default MAX == 15 and the slot time is ~50us.  Compute it out
* and it would seem that a packet could live in the hardware for
* about 332750us.  Round it an even 350000 for a little slack.
*
*/
struct timeval pc586_toutxmt[NLAN];	/* last time packet xmit'd */
long pc586_waitxmt = 350000;		/* us. to wait b4 declaring CX lost */
int pc586_eir[NLAN];			/* prochpa lan interrupt register */

#define pc586inton(unit) \
    { \
	extern int asp2procibit[]; \
	register int ibit = aspitab(INT_LAN, SPLLAN, pc586intr , unit); \
	if (ibit > 0 && asp2procibit[ibit] > 0) \
		pc586_eir[unit] = asp2procibit[ibit]; \
	else \
		pc586_eir[unit] = 0; \
    }
#define pc586intoff(unit) \
    { \
	aspitab(INT_LAN, SPLLAN, (void (*)(int))NULL, unit); \
	pc586_eir[unit] = 0; \
	timerclear(&pc586_toutxmt[unit]); \
    }
#else	/* !PC596XMT_BUG */


------=_NextPart_000_69f4_186c_2e0b--

From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Thu, 21 Jul 2005 18:29:46 -0600
Message-ID: <42E03DFA.6040808@excelcia.org>
References: <200507212328.j6LNSfto010960@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200507212328.j6LNSfto010960@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin wrote:

> I know that 32-bit 2.6.10 isn't stable on my c3k.  There is a known
> bug with kernel memcpy and fpregs.

Well, as far as the bug I am reporting goes, so far I have narrowed it
down to a kernel later than 2.6.10-pa11 and before 2.6.11-pa4.  It
appears that whatever went into 2.6.10 isn't to blame.

It looks like the interrupt storm theory is best.  The functions I get
from the TOC data this time are:

GRO2 0x101060e0 handle_interruption+6c
IOAQ 0x101120dc handle_unaligned+2c0

I am curious, though.  This time when it hung the hearbeat didn't stop.
 Does this mean that it didn't hang as solid as the other times?  Are
interrupts still being handled at some kernel level if the heartbeat LED
is flashing normally?  If this is the case, then this means the TOC data
may be useless this time around, right?

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

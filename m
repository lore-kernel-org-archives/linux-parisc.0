From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Thu, 21 Jul 2005 21:55:18 -0600
Message-ID: <20050722035518.GC29339@colo.lackof.org>
References: <200507212328.j6LNSfto010960@hiauly1.hia.nrc.ca>
	<42E03DFA.6040808@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42E03DFA.6040808@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 21, 2005 at 06:29:46PM -0600, Kurt Fitzner wrote:
> John David Anglin wrote:
> 
> > I know that 32-bit 2.6.10 isn't stable on my c3k.  There is a known
> > bug with kernel memcpy and fpregs.
> 
> Well, as far as the bug I am reporting goes, so far I have narrowed it
> down to a kernel later than 2.6.10-pa11 and before 2.6.11-pa4.  It
> appears that whatever went into 2.6.10 isn't to blame.

Ok...If you were to try one more kernel, could it be 2.6.11-pa1?

> It looks like the interrupt storm theory is best.  The functions I get
> from the TOC data this time are:
> 
> GRO2 0x101060e0 handle_interruption+6c
> IOAQ 0x101120dc handle_unaligned+2c0

yes, seems like it's likely too.

> I am curious, though.  This time when it hung the hearbeat didn't stop.
>  Does this mean that it didn't hang as solid as the other times?

that would be my guess too.

> Are
> interrupts still being handled at some kernel level if the heartbeat LED
> is flashing normally?

yes

> If this is the case, then this means the TOC data
> may be useless this time around, right?

Not necessarily. The TOC data may still be useful
for register state.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

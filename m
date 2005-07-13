From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] Infinite error message from SDC driver on install
Date: Tue, 12 Jul 2005 20:12:48 -0600
Message-ID: <42D478A0.9040608@excelcia.org>
References: <42CF1766.8030608@excelcia.org> <42D0468C.5010005@excelcia.org>
	<20050711195440.GD2170@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20050711195440.GD2170@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Kyle McMartin wrote:
> On Sat, Jul 09, 2005 at 03:50:04PM -0600, Kurt Fitzner wrote:
> 
>>"HP SDC MLC: Registering the System Domain Controller's HIL MLC."
> 
> I don't suppose you could investigate further? (TOC the machine, 
> lookup where it's hung, see the howto on parisc-linux.org). 
> 
> All the d-i images tested fine on my B180, which is a fairly close
> match to your B132...

I've done some more testing.  My results are similar to what Scott
posted.  I've only taken the most cursory look at the relevant code in
the kernel, so my report here is simply observation and my own
interpretation.

When booting from the install CDs and the console is GRAPHICS(0), I find
that I get the transaction add error ad infinitum:

  "HP SDC: Transaction add failed: transaction already queued?"

In one out of every five boots (approximately), after a variable number
of the transaction errors, there will be a timeout error.  Once the
timeout error occurs, no more transaction add errors occur.  The number
of transaction add errors that occur before this happens can be anywhere
from three to several hundreds.

  "HP SDC: Transaction add failed: transaction already queued?"
    above repeated three to several hundred times
  "HP SDC: read timeout (99999ms)"

I found quite by accident that if I am moving the mouse just as the
kernel is booting up, there is a far better chance of getting the
timeout error quickly and thus terminating the transaction error after
just 3 or 4 lines.

If the console is set to serial_1, the transaction error almost always
(9 out of 10 times) terminates after only 3 or 4 lines.  I now believe
that the two observations (mouse movement and serial console) are
related.  I believe the extra interrupt overhead from either the PS/2 or
serial port is allowing the timeout to occur.

Regarding the problem with the kernel hanging, just as Scott indicated,
this only occurs on SMP-enabled kernels on the B132L.  Not being
familliar with Debian prior to this install, it took me a while to
figure out how to get the installer to allow me to select a different
kernel (which is why I have so much info on the frequency of the issues
on a per boot basis).

I have now compiled my own kernel without HIL or SDC support.  This is
quite nice simply because the HIL poling sucks a lot of CPU time
(despite what the FAQ says, I could never get the CPU usage of ksoftirqd
below 8% even when higher priority tasks were running at a -19 nice level).

I'll now spend some time in the kernel code to see how the transaction
add errors are somehow resetting the read timeout.

Hope the observations help.

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

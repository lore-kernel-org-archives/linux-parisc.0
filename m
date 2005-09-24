From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J6000 hangs with 2.6.14-rc1-pa1-32smp
Date: Sat, 24 Sep 2005 10:58:18 -0600
Message-ID: <20050924165818.GB7824@colo.lackof.org>
References: <43309941.4020706@netvisao.pt>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Antonio Cardoso Martins <digiplan@netvisao.pt>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43309941.4020706@netvisao.pt>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 21, 2005 at 12:20:33AM +0100, Antonio Cardoso Martins wrote:
> Hello,
> 
> could anybody help with tracing this bug deeper?
> 
> Machine: HP J6000 workstation with serial console, 2048 Mb
> 
> Linux version 2.6.14-rc1-pa1-32smp (root@moonlight) (gcc version 3.3.5 
> (Debian 1:3.3.5-13)) #1 SMP Sun Sep 18 20:24:10 WEST 2005
> 
> ...
> SMP CALL FUNCTION TIMED OUT! (cpu=0), try 1

Antonio,
I still occasionally see the above bug. I think we deadlock
when interrupts are disabled and we try to send an IPI.
Ergo we can never harvest the completion.  I haven't had time to dig
more into the one good TOC dump that I do have.

I have to wonder if we are loosing nested IPI or deadlock if both
CPUs happen to want to send an IPI to each other at the same time.

I've parked a kernel I've built that boots on my j6k at:
	ftp://gsyprf10.external.hp.com/kernels/c3000/2.6.14-rc1-pa1.tgz

If you want to give that a try and then compare the .config files,
that would be helpful.

> Would someone please help me?

I think the next step is to add a bug catcher that will panic
if/when one cpu fails to get the IPI spinlock or pending_ipi
is already set in ipi_send() (only works on 2-way).
Or something like that.  I have to think about this lot more.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

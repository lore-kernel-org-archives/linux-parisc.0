From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] parisc-linux J6000 Hangs with 2.6.13-32-pa1-smp
Date: Sun, 11 Sep 2005 14:47:25 -0600
Message-ID: <20050911204725.GB8192@colo.lackof.org>
References: <431F4176.3040909@netvisao.pt>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Antonio Cardoso Martins <digiplan@netvisao.pt>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <431F4176.3040909@netvisao.pt>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 07, 2005 at 08:37:26PM +0100, Antonio Cardoso Martins wrote:
> Grant, thank you very much for your prompt replies.

welcome

> "ser pim" is just to collect diagnostic info.
> It doesn't attempt to boot the machine or anything else.
> 
> I see, but what i was trying to tell you, is that after making "ser 
> pim", "ser clearpim", and "boot pri ipl", the machine wont boot unitl i 
> turn it off completely first. I think this could be not relevant. It's 
> just my urge to document abnormal behaviour from J6000.

ah ok - as jda mentioned, that is a known problem.


> Back to the bug trace, you asked me to find
> 
> 	0x0000000010115414 (IIA Offset)
> 	0x0000000010490010 (GR02)
> 	0x0000000010115410 (CR18)
> 
> in the corresponding System.map?
> 
> The results are:

To make life easier, you might try:
	http://cvs.parisc-linux.org/*checkout*/build-tools/a.c?content-type=text%2Fplain&rev=1.2

(or "cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs co build-tools"
 and then "cd build-tools; make a"

> ...
> 101150c0 T smp_send_reschedule
> 10115150 T smp_call_function
> 101154b4 T smp_flush_tlb_all
> 101154f4 T smp_do_timer
> 10115558 T smp_prepare_boot_cpu
> 10115668 T smp_cpus_done
> 1011566c T __cpu_up
> 101156cc T smp_send_stop
> ...
> 1049000c D proc_gsc_root
> 10490010 D proc_mckinley_root
> 10490014 D parisc_vmerge_boundary
> ...
> 
> Hope you can find what you were looking for

IOAQ is near the end of smp_call_function().
GR02 (return pointer) is proc_mckinley_root.

Odd that GR02 would point at data ("D").
Unless gr02 is being trashed by smp_call_function.
But I don't see where smp_call_function() would touch
gr02 and trash it. Something wierd is up.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] smp kernels at 100% system 0% idle 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Sat, 06 Jul 2002 18:12:23 BST." <20020706171223.GF971@sleepie.demon.co.uk>
References: <20020706171223.GF971@sleepie.demon.co.uk> 
Date: Sun, 07 Jul 2002 12:28:03 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020707182803.22807482E@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Richard Hirst wrote:
> This appears to be due to local_irq_count(cpu) always being 2 when
> update_process_times() is called.  Looks like we call irq_enter() twice,
> once in do_irq() and again in smp_do_timer().  Maybe we can just remove
> the irq_enter/exit calls from smp_do_timer()?

Followup:
  -pa50 has the extra irq_enter/exit calls removed and "top" now seems
  to report reasonable values for user/system/idle!

My A500-44 (Dual CPU, CONFIG_SMP=y) has been building kernels
in a loop all night.

The only quirk was eth0 (tulip) dropped out around 7:21 AM (PST) today.
I didn't see anything related in dmesg output and here is the
"ifconfig" output:
eth0      Link encap:Ethernet  HWaddr 00:30:6E:03:79:9F  
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:109069 errors:1 dropped:0 overruns:0 frame:0
          TX packets:109273 errors:3 dropped:0 overruns:0 carrier:3
          collisions:0 txqueuelen:100 
          RX bytes:7325550 (6.9 MiB)  TX bytes:29846310 (28.4 MiB)
          Interrupt:128 

Anyway, I ifconfig'd the interface again, logged in again, and restarted
the clean/oldconfig/dep/vmlinux/modules loop again. (uses -j4 on
the last three steps). It's running happily again now.

thanks again Richard!
grant

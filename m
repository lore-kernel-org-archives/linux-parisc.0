Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org, jes@wildopensource.com
In-Reply-To: Message from grundler@dsl2.external.hp.com (Grant Grundler)
   of "Sat, 03 Aug 2002 19:17:07 MDT." <20020804011707.2B9164860@dsl2.external.hp.com>
References: <20020804011707.2B9164860@dsl2.external.hp.com> 
Date: Sat, 03 Aug 2002 20:03:47 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020804020348.23C414860@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

Grant Grundler wrote:
> Log message:
> 2.4.18-pa62 acenic-0.91+minor fix
> Jes Sorensen asked me to test his latest driver...besides
> one minor build fix in acenic.h it loaded and booted.
> 
> First time I tried the machine crashed. I didn't have /sbin/hotplug
> but CONFIG_HOTPLUG was enabled. May this serve as a reminder
> to others...

diff against whatever we had in our CVS before:
	ftp://ftp.parisc-linux.org/patches/acenic-0.91-ggg.diff

and the original tarball (drivers/net/acenic.[ch]):
	ftp://ftp.parisc-linux.org/patches/acenic-0.91.tar.gz

This line of output:
eth1: Enabling PCI Memory Mapped access - was not enabled by BIOS/Firmware

The driver isn't using pci_enable_device() and it should.
Jes is aware of the problem.

But I'm happy...another HP IO card supported by parisc-linux. ;^)

I tried to run netperf but netserver segfaults on parisc.
I'll rebuild to see if compiler changes have fixed netserver and try again.
Anyway, I need to figure out which other 1000SX card is connected
 to the switch.

grant

a500:~# modprobe acenic
acenic.c: v0.91 07/31/2002  Jes Sorensen, linux-acenic@SunSITE.dk
                            http://home.cern.ch/~jes/gige/acenic.html
eth1: Enabling PCI Memory Mapped access - was not enabled by BIOS/Firmware
eth1: Alteon AceNIC Gigabit Ethernet at 0xfffffffffb000000, irq 322
  Tigon II (Rev. 6), Firmware: 12.4.11, MAC: 00:30:6e:04:80:68
  PCI bus width: 64 bits, speed: 66MHz, latency: 128 clks
eth1: Firmware up and running
eth1: Optical link UP (Full Duplex, Flow Control: TX RX)
a500:~# uname -a
Linux a500 2.4.18-pa61 #4 SMP Sat Aug 3 01:00:08 PDT 2002 parisc64 unknown unknown GNU/Linux
a500:~# ifconfig eth1
eth1      Link encap:Ethernet  HWaddr 00:30:6E:04:80:68  
          inet addr:192.168.0.21  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:40 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100 
          RX bytes:8951 (8.7 KiB)  TX bytes:1522 (1.4 KiB)
          Interrupt:66 

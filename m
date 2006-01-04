From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J2240 - Almost there....
Date: Wed, 4 Jan 2006 10:43:32 -0700
Message-ID: <20060104174332.GB20079@colo.lackof.org>
References: <7d01f9f00601010615v54117490o9a575fd279244524@mail.gmail.com>
	<000401c61003$cea58c60$3401a8c0@POGO>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Craig D. Lansing" <clansing@charter.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000401c61003$cea58c60$3401a8c0@POGO>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 02, 2006 at 08:19:55PM -0500, Craig D. Lansing wrote:
> Sorry that it took so long to reply.  I spent most of the day driving to /
> from Washington, DC yesterday.  Re-installed and ran into problems as
> follows:
> 
> 1) Got gdm prompt (black&white, really large), but was able to login.  Mouse
> was not recognized after that so I was "stuck" in the desktop.

ctl-alt-backspace will kill the X11 server.

> I was able to login OK in single user command line mode.
> 
> 2) Re-installed after getting the actual "advanced" HP p1120 console specs
> (instead of "simple").  Re-install failed due to "SMP CALL FUNCTION TIMED
> OUT! (cpu=0), try ###" errors (I powered off the box after about 2000 of
> these).

Newer kernels (not sure if 2.6.14, but certainly 2.6.15-pa1) fix this.
(kudos to James Bottomley)

>   Rebooted and got message to run "dpkg --configure -a".  Did that
> and packages installed.  The system now tries to start gdm (flickers a lot),
> but ultimately just goes to a blinking cursor  When I reboot (shutdown -r 0)
> I now get the "Welcome to your new Debian system" prompt.  I guess maybe I
> should re-install again????
> 
> 3) Networking appears to not be working, I assumed that is because of the
> "blacklisted" FDDI card (defxx,DEFPA).

Unlikely.

>   The box has an internal IP address
> 192.168.1.100 and I can't even ping it.  However, I cannot ping the box when
> booted into HP-UX either (192.168.1.200).  Bad card (I tried the obvious of
> another cable)????

Add a 100BT card (tulip or e100) and see if that works better.
According to HW DB, j2240 has DEC21143 (tulip) built-in and I would
expect that to work fine.

Based on the /proc/iomem output below, looks like you have two tulip
devices in the machine. Likely the LAN cable is connected to the wrong one.

> To get the info. requsted below w/o a LAN, I "cheated" and started a getty
> against a serial port, logged in via a Reflection session, and logged to an
> output file... not pretty, but functional.  Sorry if this is more than you
> wanted to see.

no problem.

...
> howlin:~# cat /proc/iomem
> 00000000-7fffffff : System RAM
>   00000000-000009ff : PDC data (Page Zero)
>   00100000-003b4fff : Kernel code
>   003b5000-00513b03 : Kernel data
> f0190000-f0190000 : lcd_cmd
> f0190001-f0190001 : lcd_data
> f1600000-f3ffffff : GSC Bus [10/]
>   f1604000-f1604fff : Cujo
>   f1607800-f1607807 : serial
>   f1800000-f1ffffff : Cujo LMMIO 0
> f4000000-f5ffffff : GSC Bus [8/]
> f6000000-f7ffffff : GSC Bus [10/]
>   f6000000-f7ffffff : Cujo LMMIO 1
>     f6000000-f7ffffff : 0000:02:00.0
>       f6100000-f64fffff : stifb mmio
>       f7000000-f71fffff : stifb fb
> f8000000-fff7ffff : GSC Bus [8/]
>   fc000000-fc000fff : Cujo
>   fc003800-fc003807 : serial
>   fc004000-fc004fff : Dino [8/4]
>   fc800000-fcffffff : Dino [8/4] LMMIO 0
>     fc800000-fc800fff : 0000:01:13.0
>       fc800000-fc800fff : sym53c8xx
>     fc801000-fc8010ff : 0000:01:13.0
>       fc801000-fc8010ff : sym53c8xx
>     fc802000-fc80207f : 0000:01:14.0
>       fc802000-fc80207f : tulip
>   fd800000-fdffffff : Cujo LMMIO 0
>     fd800000-fd80ffff : 0000:00:04.0
>     fd810000-fd81007f : 0000:00:03.0
>       fd810000-fd81007f : tulip
>     fd811000-fd81107f : 0000:00:04.0
>   ffd00000-ffdfffff : Lasi
>     ffd00000-ffd00fff : Lasi
>     ffd06000-ffd06fff : Lasi SCSI
>     ffd08000-ffd08fff : GSC PS2
> fff80000-fffaffff : Central Bus
>   fff88000-fff88fff : U2:Uturn
>   fff8a000-fff8afff : U2:Uturn
>   fffa0000-fffa0fff : CPU
>   fffa2000-fffa2fff : CPU
> fffb0000-fffdffff : Local Broadcast
> fffe0000-ffffffff : Global Broadcast


0000:00:03.0 is tulip in slot 3.
0000:01:14.0 is tulip built-in. (my guess)

> howlin:~# cat /proc/interrupts 
>            CPU00       CPU01 
>  32:     125984     124641      PARISC-CPU  timer
>  33:       8458       9035      PARISC-CPU  IPI
>  34:        120          0      PARISC-CPU  lasi
>  35:          0       1274      PARISC-CPU  Cujo
>  36:       7095          0      PARISC-CPU  Dino [8/4]
>  37:          0          0      PARISC-CPU  Cujo
>  69:         41          0            Lasi  GSC PS2 keyboard, GSC PS2 mouse
>  86:         79          0            Lasi  lasi700
>  99:          0        858            Cujo  eth0

Note that eth0 is routed to Cujo (not dino) - this tulip is in slot 3.

> 106:          0        417            Cujo  serial
> 131:       7095          0      Dino [8/4]  sym53c8xx
> howlin:~# dmesg
> Linux version 2.6.8-2-32-smp (root@palinux) (gcc version 3.3.5 (Debian
> 1:3.3.5-1
> 3)) #1 SMP Wed Aug 24 17:55:41 UTC 2005
> FP[0] enabled: Rev 0 Model 14
> The 32-bit Kernel has started...
> Determining PDC firmware type: System Map.
...
> Brought up 1 CPUs
> CPU0:  online
>  domain 0: span ffffffff
>   groups: 00000001 00000002 00000004 00000008 00000010 00000020 00000040
> 0000008 0 00000100 00000200 00000400 00000800 00001000 00002000 00004000
> 00008000 000100 00 00020000 00040000 00080000 00100000 00200000 00400000
> 00800000 01000000 02000 000 04000000 08000000 10000000 20000000 40000000
> 80000000
> CPU1: offline
>  domain 0: span ffffffff
>   groups: 00000002 00000004 00000008 00000010 00000020 00000040 00000080
> 0000010 0 00000200 00000400 00000800 00001000 00002000 00004000 00008000
> 00010000 000200 00 00040000 00080000 00100000 00200000 00400000 00800000
> 01000000 02000000 04000 000 08000000 10000000 20000000 40000000 80000000
> 00000001
> CPU2: offline
>  domain 0: span ffffffff
>   groups: 00000004 00000008 00000010 00000020 00000040 00000080 00000100
> 0000020 0 00000400 00000800 00001000 00002000 00004000 00008000 00010000
> 00020000 000400 00 00080000 00100000 00200000 00400000 00800000 01000000
> 02000000 04000000 08000 000 10000000 20000000 40000000 80000000 00000001
> 00000002
...
> CPU31: offline
>  domain 0: span ffffffff
>   groups: 80000000 00000001 00000002 00000004 00000008 00000010 00000020
> 0000004 0 00000080 00000100 00000200 00000400 00000800 00001000 00002000
> 00004000 000080 00 00010000 00020000 00040000 00080000 00100000 00200000
> 00400000 00800000 01000 000 02000000 04000000 08000000 10000000 20000000
> 40000000

Do we really need this stuff dumped to console?

> 0x00004 } 18. Memory at 0xfffb1000 [49] { 1, 0x0, 0x083, 0x00009 } Releasing
> cpu 1 now, hpa=fffa2000 FP[1] enabled: Rev 0 Model 14
> CPU(s): 2 x PA8200 (PCX-U+) at 236.000000 MHz Found U2 at 0xfff88000 Found
> U2 at 0xfff8a000 Lasi version 0 at 0xffd00000 found.
> Cujo version unknown found at 0xfc000000 Dino [8/4] version 3.1 found at
> 0xfc004000 Cujo version 2.0 found at 0xf1604000 Enabling Cujo 2.0 bug
> workaround SCSI subsystem initialized TC classifier action (bugs to
> netdev@oss.sgi.com cc hadi@cyberus.ca) STI GSC/PCI core graphics driver
> Version 0.9a STI PCI graphic ROM found at f1ff0000 (64 kB), fb at f6000000
> (32 MB)

Your mailer or capture utility is loosing CRs here.

> version 1.1.13 (May 11, 2002)
> tulip0:  EEPROM default media type Autosense.
> tulip0:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
> tulip0: ***WARNING***: No MII transceiver found!
> eth0: Digital DS21143 Tulip rev 33 at 0xfd810000, 00:60:B0:B2:FC:F5, IRQ 99.
> tulip1: no phy info, aborting mtable build
> tulip1:  MII transceiver #1 config 1000 status 7809 advertising 01e1.
> eth1: Digital DS21143 Tulip rev 48 at 0xfc802000, 00:60:B0:A4:F3:F1, IRQ
> 128.
...

ok. should be easy now to figure out which is connected (or not).

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

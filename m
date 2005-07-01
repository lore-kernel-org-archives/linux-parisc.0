From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: [parisc-linux] Matrox Mystique video card NOT initialized on HP
 Visualize 785/B2000 with 2.6.12-rc6-pa1kernel
Date: Fri, 01 Jul 2005 23:08:05 +0800
Message-ID: <5.1.1.6.1.20050701213229.02ab2910__14389.5437628546$1416623826$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0546189570=="
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0546189570==
Content-Type: multipart/alternative;
	boundary="=====================_43992908==.ALT"

--=====================_43992908==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi,

I have now upgraded to Linux Kernel 2.6.12-rc6-pa1 but am still having 
problems in getting Matrox Mystique video card up and running, i.e. the 
card did not get initialized. At least it didn't cause Kernel panic as it 
did in 2.6.8.  (The driver is compiled into the kernel.)

Part of the booting up messages are attached here:

"... Snipped

SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 68)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
PDC Stable Storage facility v0.09
Soft power switch enabled, polling @ 0xf0400804.
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at fd820000 (128 kB), fb at fb000000 (16 MB)
     id 35acda16-9a02587, conforms to spec rev. 8.0c
     graphics card name: HPA4982A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
matroxfb: Matrox Mystique (PCI) detected
matroxfb: cannot determine memory size
matroxfb: probe of 0000:01:01.0 failed with error -1
tridentfb: Trident framebuffer 0.7.8-NEWAPI initializing
stifb: 'HPA4982A' (id: 0x35acda16) not supported.
Generic RTC Driver v1.07

... Snipped"


What should I try next? Pls advise.

Thanks,
Lee

ps. I also have the Trident driver compiled into the Kernel but no Trident 
card installed.

pps. Output from 'lspci -v':-


... Snipped

0000:01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
         Subsystem: Hewlett-Packard Company: Unknown device 108c
         Flags: bus master, 66MHz, medium devsel, latency 255, IRQ 70
         Memory at fb000000 (64-bit, prefetchable) [size=16M]
         Memory at fa000000 (64-bit, non-prefetchable) [size=16M]
         Expansion ROM at fd820000 [disabled] [size=128K]

0000:01:01.0 VGA compatible controller: Matrox Graphics, Inc. MGA 1064SG 
[Mystique] (rev 02) (prog-if 00 [VGA])
         Flags: bus master, stepping, medium devsel, latency 248, IRQ 71
         Memory at fd800000 (32-bit, non-prefetchable) [size=16K]
         Memory at fd000000 (32-bit, prefetchable) [size=8M]
         Memory at f4800000 (32-bit, non-prefetchable) [size=8M]
         Expansion ROM at fd820000 [disabled] [size=64K]

... Snipped

--=====================_43992908==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<font face="Courier New, Courier">Hi,<br><br>
I have now upgraded to Linux Kernel 2.6.12-rc6-pa1 but am still having
problems in getting Matrox Mystique video card up and running, i.e. the
card did not get initialized. At least it didn't cause Kernel panic as it
did in 2.6.8.&nbsp; (The driver is compiled into the kernel.)<br><br>
Part of the booting up messages are attached here:<br><br>
&quot;... Snipped<br><br>
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 68) <br>
SuperIO: Serial port 1 at 0x3f8<br>
SuperIO: Serial port 2 at 0x2f8<br>
SuperIO: Parallel port at 0x378<br>
SuperIO: Floppy controller at 0x3f0<br>
SuperIO: ACPI at 0x7e0<br>
SuperIO: USB regulator enabled<br>
PDC Stable Storage facility v0.09<br>
Soft power switch enabled, polling @ 0xf0400804.<br>
STI GSC/PCI core graphics driver Version 0.9a<br>
STI PCI graphic ROM found at fd820000 (128 kB), fb at fb000000 (16
MB)<br>
&nbsp;&nbsp;&nbsp; id 35acda16-9a02587, conforms to spec rev. 8.0c<br>
&nbsp;&nbsp;&nbsp; graphics card name: HPA4982A<br>
sticon: Initializing STI text console.<br>
Console: switching to colour STI console 160x64<br>
matroxfb: Matrox Mystique (PCI) detected<br>
matroxfb: cannot determine memory size<br>
matroxfb: probe of 0000:01:01.0 failed with error -1<br>
tridentfb: Trident framebuffer 0.7.8-NEWAPI initializing<br>
stifb: 'HPA4982A' (id: 0x35acda16) not supported.<br>
Generic RTC Driver v1.07<br><br>
... Snipped&quot;<br><br>
<br>
What should I try next? Pls advise.<br><br>
Thanks,<br>
Lee<br><br>
ps. I also have the Trident driver compiled into the Kernel but no
Trident card installed.<br><br>
pps. Output from 'lspci -v':-<br><br>
<br>
... Snipped<br><br>
0000:01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev
03)<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Subsystem:
Hewlett-Packard Company: Unknown device 108c<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Flags: bus
master, 66MHz, medium devsel, latency 255, IRQ 70<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Memory at
fb000000 (64-bit, prefetchable) [size=16M]<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Memory at
fa000000 (64-bit, non-prefetchable) [size=16M]<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Expansion
ROM at fd820000 [disabled] [size=128K]<br><br>
0000:01:01.0 VGA compatible controller: Matrox Graphics, Inc. MGA 1064SG
[Mystique] (rev 02) (prog-if 00 [VGA])<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Flags: bus
master, stepping, medium devsel, latency 248, IRQ 71<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Memory at
fd800000 (32-bit, non-prefetchable) [size=16K]<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Memory at
fd000000 (32-bit, prefetchable) [size=8M]<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Memory at
f4800000 (32-bit, non-prefetchable) [size=8M]<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Expansion
ROM at fd820000 [disabled] [size=64K]<br><br>
... Snipped</font><br>
</html>

--=====================_43992908==.ALT--



--===============0546189570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0546189570==--

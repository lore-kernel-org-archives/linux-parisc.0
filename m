From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: ATI 3D Rage II+ Video Card
Date: Sun, 03 Jul 2005 12:11:47 +0800
Message-ID: <5.1.1.6.1.20050703114537.02a58010__23460.9208106578$1416623829$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <OnlUgD.A.Q0E.oX2xCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hi,

If you are interested, followiong are some test results I carried out while 
trying to bring up an ATI 3D Rage II+ video card on my B2000 which runs on 
Linux kernel 2.6.12-rc6-pa1.

The video card outputs from 'lspci -v' are:

0000:01:01.0 VGA compatible controller: ATI Technologies Inc 3D Rage II+ 
215GTB [Mach64 GTB] (rev 9a) (prog-if 00 [VGA])
	Flags: bus master, stepping, medium devsel, latency 255
	Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
	I/O ports at 12000 [size=256]
	Memory at f4800000 (32-bit, non-prefetchable) [size=4K]
	Expansion ROM at f4820000 [disabled] [size=128K]

Test 1) Compiled only ATI Mach64 (no other ATI bits were included) driver 
as a module while 'frame buffer', 'video helper', 'tile blitting' and 'HP 
STI frame buffer' were compiled into the kernel. (No other video drivers 
were selected):

Result 1.1) The driver module was not loaded automatically though the video 
card was in place. Did 'lsmod' no 'atyfb' module was found.

Result 1.2) Entered command 'modprobe atyfb' nothing happened (no signals 
were detected although connection was reported OK by the HP910 monitor). 
Did a 'lsmod' 'atyfb' driver was listed among others.

Test 2) Compiled ATI Mach64 (no other ATI bits were included) driver along 
with 'frame buffer', 'video helper', 'tile blitting' and 'HP STI frame 
buffer' into the kernel. (No other video drivers were selected):

Result 2.1) Again nothing happened. Checked 
'/lib/modules/2.6.12-rc6-pa1/kernel/drivers' no 'video' subdirectory was 
found. I assumed this is normal as I have not selected any video drivers to 
be compiled as modules.

Result 2.2) The boot up messages related to video drivers did not show any 
messages referencing the ATI driver. The relevant output are:

STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f4820000 (128 kB), fb at fd000000 (16 MB)
     id 35acda16-9a02587, conforms to spec rev. 8.0c
     graphics card name: HPA4982A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
stifb: 'HPA4982A' (id: 0x35acda16) not supported.
Generic RTC Driver v1.07



I will continue to add in other related ATI drivers one bit at a time to 
see if the situation will change. I will only compile the drivers into the 
kernel to save time.

In the meanwhile, if you have any suggestions pls let me know.

Rgds,
Lee




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

From: Marnix van den Berg <marnix.vd.berg@hccnet.nl>
Subject: Re: [parisc-linux] SCSI hang in 2.6.6-pa4
Date: Fri, 21 May 2004 09:34:42 +0200
Message-ID: <40ADB112.7090107@hccnet.nl>
References: <Pine.LNX.4.58.0405191939460.30587@trillian.uni>	<40AC8294.7030303@tiscali.be>
	<Pine.LNX.4.58.0405202222240.18175@trillian.uni>
Reply-To: marnix.vd.berg@hccnet.nl
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0405202222240.18175@trillian.uni>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On my headless c3k I get:

0000:00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c896 
(rev 04)
         Subsystem: LSI Logic / Symbios Logic: Unknown device 1000
         Flags: bus master, medium devsel, latency 255, IRQ 65
         I/O ports at 0900
         Memory at f4005000 (64-bit, non-prefetchable) [size=1K]
         Memory at f4002000 (64-bit, non-prefetchable) [size=8K]
         Capabilities: [40] Power Management version 1

0000:00:0f.1 SCSI storage controller: LSI Logic / Symbios Logic 53c896 
(rev 04)
         Subsystem: LSI Logic / Symbios Logic: Unknown device 1000
         Flags: bus master, medium devsel, latency 255, IRQ 65
         I/O ports at 0800
         Memory at f4004000 (64-bit, non-prefetchable) [size=1K]
         Memory at f4000000 (64-bit, non-prefetchable) [size=8K]
         Capabilities: [40] Power Management version 1

During boot-up:

kernel: sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq   65
kernel: sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
kernel: sym0: SCSI BUS has been reset.
kernel: sym0: SCSI BUS mode change from SE to SE.
kernel: sym0: SCSI BUS has been reset.
kernel: scsi0 : sym-2.1.18i
kernel: sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 65
kernel: sym1: No NVRAM, ID 7, Fast-40, LVD, parity checking
kernel: sym1: SCSI BUS has been reset.
kernel: scsi1 : sym-2.1.18i
kernel:   Vendor: QUANTUM   Model: ATLAS10K-9LVD     Rev: HP06
hpux kernel:   Type:   Direct-Access            ANSI SCSI revision: 03
kernel: sym1:6:0: tagged command queuing enabled, command queue depth 16.
kernel: st: Version 20040226, fixed bufsize 32768, s/g segs 256
kernel: sym1:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 31)
kernel: SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
kernel: SCSI device sda: drive cache: write back

This is with 2.6.6-rc1-pa0, haven't had time to upgrade my kernel lately.


Elliott Potter wrote:

 > On Thu, 20 May 2004, Joel Soete wrote:
 >
 >
 >> Hello Elliott,
 >>
 >> Elliott Potter wrote:
 >>
 >>> Hello all,
 >>>
 >>> I've got a J5000 that appeared to work mostly OK under 2.4.25-pa.
 >>>
 >>
 >> J5000 is of the b2k, c3k family isn't it?
 >> (read on openpa:"...They are basically the bigger brothers of the
 >> C3000/C3600 et al, featuring better expandability. ...")
 >
 >
 >
 > They appear to be similar.  Maybe someone can run lspci -v on a c3k and
 > see what you get for the SCSI host adapter ... I get
 >
 > 00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c896 
(rev 04)
 >    Subsystem: LSI Logic / Symbios Logic: Unknown device 1000
 >    Flags: bus master, medium devsel, latency 255, IRQ 65
 >    I/O ports at 0900 [size=256]
 >    Memory at f4005000 (64-bit, non-prefetchable) [size=1K]
 >    Memory at f4002000 (64-bit, non-prefetchable) [size=8K]
 >    Capabilities: [40] Power Management version 1
 >
 > 00:0f.1 SCSI storage controller: LSI Logic / Symbios Logic 53c896 
(rev 04)
 >    Subsystem: LSI Logic / Symbios Logic: Unknown device 1000
 >    Flags: bus master, medium devsel, latency 255, IRQ 65
 >    I/O ports at 0900 [size=256]
 >    Memory at f4005000 (64-bit, non-prefetchable) [size=1K]
 >    Memory at f4002000 (64-bit, non-prefetchable) [size=8K]
 >    Capabilities: [40] Power Management version 1
 >
 >
 >
 >>> I just put 2.6.6-pa4 on there and when I boot, the machine hangs:
 >>>
 >>
 >> umm 32bit or 64bit kernel?
 >
 >
 >
 > 32 bit?  I assume.  If it was 64 bit it wasn't on purpose.  Under CPU
 > selection I chose the PA7000 option (or whatever the first one on the
 > list was).
 >
 >
 >> Personaly, I just test 2.6.6-pa2 (32 and 64 bits) on my b2k without
 >> pb but with the c3k default config file that I found under
 >> arch/parisc/configs/c3000_defconfig. (make mrproper then) I copy this
 >> as .config and 'make oldconfig' before 'make vmlinux' (default
 >> 64bits).
 >> Did you used the same?
 >
 >
 >
 > I fiddled with the config a bit, but not a lot.  I did not use 64 bits.
 > Then make vmlinux, etc.
 >
 >
 >>> [...]
 >>> sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 65
 >>> sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
 >>> sym0: SCSI BUS has been reset.
 >>> scsi0 : sym-2.1.18j
 >>> sym0:0:0: ABORT operation started.
 >>> sym0:0:0: ABORT operation timed-out.
 >>> sym0:0:0: DEVICE RESET operation started.
 >>> sym0:0:0: DEVICE RESET operation timed-out.
 >>> sym0:0:0: BUS RESET operation started.
 >>> sym0:0:0: BUS RESET operation timed-out.
 >>> sym0:0:0: HOST RESET operation started.
 >>> sym0: SCSI BUS has been reset.
 >>> <hang>
 >>>
 >>> ... any hints on this?  Could it be related to the TCQ problem someone
 >>> had with the 53c700 a few months ago?
 >>>
 >>
 >> Do you see this one listed in your found device list?
 >
 >
 >
 > Nope.  Different chip, and also (as I read a bit more about it since my
 > first post) a different brand of hard drive, which may make a
 > difference.  Ah well.
 >
 >
 >> But it is a strange coincidence, the description of your pb is similar
 >> to the one that Stephano encounter with its c3k
 >> (http://lists.debian.org/debian-hppa/2004/05/msg00066.html) but with 
2.4.
 >> So it would be surprising that it is the same cause; never the less if
 >> you used usb kbd/mouse can you try a serial console?
 >
 >
 >
 > In fact there is no keyboard/mouse/head on the machine, so if it's not
 > going to boot I have to use serial console to see the messages.
 > --
 > Elliott
 > _______________________________________________
 > parisc-linux mailing list
 > parisc-linux@lists.parisc-linux.org
 > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


Elliott Potter wrote:

> On Thu, 20 May 2004, Joel Soete wrote:
> 
> 
>>Hello Elliott,
>>
>>Elliott Potter wrote:
>>
>>>Hello all,
>>>
>>>I've got a J5000 that appeared to work mostly OK under 2.4.25-pa.
>>>
>>
>>J5000 is of the b2k, c3k family isn't it?
>>(read on openpa:"...They are basically the bigger brothers of the
>>C3000/C3600 et al, featuring better expandability. ...")
> 
> 
> They appear to be similar.  Maybe someone can run lspci -v on a c3k and
> see what you get for the SCSI host adapter ... I get
> 
> 00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c896 (rev 04)
>    Subsystem: LSI Logic / Symbios Logic: Unknown device 1000
>    Flags: bus master, medium devsel, latency 255, IRQ 65
>    I/O ports at 0900 [size=256]
>    Memory at f4005000 (64-bit, non-prefetchable) [size=1K]
>    Memory at f4002000 (64-bit, non-prefetchable) [size=8K]
>    Capabilities: [40] Power Management version 1
> 
> 00:0f.1 SCSI storage controller: LSI Logic / Symbios Logic 53c896 (rev 04)
>    Subsystem: LSI Logic / Symbios Logic: Unknown device 1000
>    Flags: bus master, medium devsel, latency 255, IRQ 65
>    I/O ports at 0900 [size=256]
>    Memory at f4005000 (64-bit, non-prefetchable) [size=1K]
>    Memory at f4002000 (64-bit, non-prefetchable) [size=8K]
>    Capabilities: [40] Power Management version 1
> 
> 
> 
>>>I just put 2.6.6-pa4 on there and when I boot, the machine hangs:
>>>
>>
>>umm 32bit or 64bit kernel?
> 
> 
> 32 bit?  I assume.  If it was 64 bit it wasn't on purpose.  Under CPU
> selection I chose the PA7000 option (or whatever the first one on the
> list was).
> 
> 
>>Personaly, I just test 2.6.6-pa2 (32 and 64 bits) on my b2k without
>>pb but with the c3k default config file that I found under
>>arch/parisc/configs/c3000_defconfig. (make mrproper then) I copy this
>>as .config and 'make oldconfig' before 'make vmlinux' (default
>>64bits).
>>Did you used the same?
> 
> 
> I fiddled with the config a bit, but not a lot.  I did not use 64 bits.
> Then make vmlinux, etc.
> 
> 
>>>[...]
>>>sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 65
>>>sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
>>>sym0: SCSI BUS has been reset.
>>>scsi0 : sym-2.1.18j
>>>sym0:0:0: ABORT operation started.
>>>sym0:0:0: ABORT operation timed-out.
>>>sym0:0:0: DEVICE RESET operation started.
>>>sym0:0:0: DEVICE RESET operation timed-out.
>>>sym0:0:0: BUS RESET operation started.
>>>sym0:0:0: BUS RESET operation timed-out.
>>>sym0:0:0: HOST RESET operation started.
>>>sym0: SCSI BUS has been reset.
>>><hang>
>>>
>>>... any hints on this?  Could it be related to the TCQ problem someone
>>>had with the 53c700 a few months ago?
>>>
>>
>>Do you see this one listed in your found device list?
> 
> 
> Nope.  Different chip, and also (as I read a bit more about it since my
> first post) a different brand of hard drive, which may make a
> difference.  Ah well.
> 
> 
>>But it is a strange coincidence, the description of your pb is similar
>>to the one that Stephano encounter with its c3k
>>(http://lists.debian.org/debian-hppa/2004/05/msg00066.html) but with 2.4.
>>So it would be surprising that it is the same cause; never the less if
>>you used usb kbd/mouse can you try a serial console?
> 
> 
> In fact there is no keyboard/mouse/head on the machine, so if it's not
> going to boot I have to use serial console to see the messages.
> --
> Elliott
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

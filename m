From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Mon, 02 Nov 2009 23:20:29 +0100
Message-ID: <4AEF5B2D.7030906@gmx.de>
References: <20091102215027.07A81500F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091102215027.07A81500F@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/02/2009 10:50 PM, John David Anglin wrote:
>> On 11/02/2009 03:34 AM, John David Anglin wrote:
>>> On Sun, 01 Nov 2009, John David Anglin wrote:
>>>
>>>> On Sun, 01 Nov 2009, John David Anglin wrote:
>>>>
>>>>> On Fri, 30 Oct 2009, Helge Deller wrote:
>>>>>
>>>>>> But when compiling the kernel something is still wrong.
>>>>>> I tried it a few times now, recompiled binutils, the kernel and so on.
>>>>>> I'm not 100% sure that I did everything correct, but I still think there is
>>>>>> something wrong...
>>>>>
>>>>> I believe that you are correct but I think we have another unrelated bug.
>>>>> It appears that the unwind data is getting messed up in the link of
>>>>> built-in.o.
>>>>
>>>> It seems the unwind data is being sorted by ld -r.
>>>
>>> Does the attached patch fix the problem?
>>
>> Yes, it does :-)
>
> Thanks for testing!  I have built a 32-bit kernel with the revised assembler
> and linker, and the readelf -u output looked good to me.  I will install
> the remaining two changes tonight (the assembler change was installed a couple
> of days ago).

I did tested the 64bit version now as well.
It looks good too.

> I haven't had a chance to boot the new kernel (waiting for a GCC build
> to complete).  There is a USB issue that appeared on my c3750 with
> 2.6.30.9 (2.6.30.8 is ok) and 2.6.31.5.  Here is the dmesg output
> from 2.6.31.5:
>
> Linux version 2.6.31.5 (root@hiauly6) (gcc version 4.3.4 (Debian 4.3.4-5) ) #6 Sun Nov 1 14:20:36 EST 2009
> unwind_init: start = 0x10524000, end = 0x10559a60, entries = 13734
> FP[0] enabled: Rev 1 Model 19
> The 32-bit Kernel has started...
> ...
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> ...
> usbmon: debugfs is not available
> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> ohci_hcd 0000:00:0e.2: OHCI Host Controller
> ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
> ohci_hcd 0000:00:0e.2: irq 1, io mem 0xf4007000
> ...
> usb usb1: configuration #1 chosen from 1 choice
>   sdb5
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 3 ports detected
> ...
> usb 1-1: new low speed USB device using ohci_hcd and address 2
> EXT3-fs: mounted filesystem with writeback data mode.
> VFS: Mounted root (ext3 filesystem) readonly on device 8:19.
> Freeing unused kernel memory: 124k freed
> usb 1-1: configuration #1 chosen from 1 choice
> usb 1-2: new low speed USB device using ohci_hcd and address 3
> usb 1-2: configuration #1 chosen from 1 choice
> sysfs: cannot create duplicate filename '/module/usbhid/sections/.text'
> ------------[ cut here ]------------
> Badness at fs/sysfs/dir.c:487

Yes, this is known.
See here:
http://patchwork.kernel.org/patch/42190/
Would be nice if this could get fixed.

  
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001111 Not tainted
> r00-03  0004000f 10576200 101cb5dc 4edc9000
> r04-07  ffffffef 4fbb4288 4edc8a88 00074844
> r08-11  4f8db000 00000000 00063000 00000064
> r12-15  00000124 00067bbb 104c36a0 00000058
> r16-19  00068fc8 00000062 4fbb4148 10576244
> r20-23  00002b68 4f16bca0 0027f808 ffffffff
> r24-27  ffffffff 00002b68 10576240 1055c2d0
> r28-31  0000004e 00000000 4fbb4340 102a0244
> sr00-03  00000000 00000000 00000000 00000010
> sr04-07  00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 101cb5dc 101cb5e0
>   IIR: 03ffe01f    ISR: 00000000  IOR: 00000000
>   CPU:        0   CR30: 4fbb4000 CR31: ffffffff
>   ORIG_R28: 00000001
>   IAOQ[0]: sysfs_add_one+0x8c/0xb4
>   IAOQ[1]: sysfs_add_one+0x90/0xb4
>   RP(r2): sysfs_add_one+0x8c/0xb4
> Backtrace:
>   [<101cadb0>] sysfs_add_file_mode+0x58/0xb4
>   [<101cd4b4>] internal_create_group+0x118/0x1dc
>   [<10158434>] load_module+0xf14/0x1214
>
> input: Logitech N48 as /devices/parisc/10/10:0/pci0000:00/0000:00:0e.2/usb1/1-1/1-1:1.0/input/input0
> generic-usb 0003:046D:C001.0001: input: USB HID v1.00 Mouse [Logitech N48] on usb-0000:00:0e.2-1/input0
> input: SILITEK USB Keyboard and Mouse as /devices/parisc/10/10:0/pci0000:00/0000:00:0e.2/usb1/1-2/1-2:1.0/input/input1
> generic-usb 0003:047B:0002.0002: input: USB HID v1.00 Keyboard [SILITEK USB Keyboard and Mouse] on usb-0000:00:0e.2-2/input0
> input: SILITEK USB Keyboard and Mouse as /devices/parisc/10/10:0/pci0000:00/0000:00:0e.2/usb1/1-2/1-2:1.1/input/input2
> generic-usb 0003:047B:0002.0003: input: USB HID v1.00 Mouse [SILITEK USB Keyboard and Mouse] on usb-0000:00:0e.2-2/input1
> usbcore: registered new interface driver usbhid
> usbhid: v2.6:USB HID core driver
> ...
>
> As you can see, there is a USB mouse and keyboard.  Want to see backtrace
> with new assembler and linker.  However, at the least the first part is
> consistent with the sysfs warning.

I have the same keyboard and mouse attached to my c3000.

  
> I "upgraded" this system to testing last weekend.  The keyboard is broken
> under X.  In gdm/kdm, one has to press a key twice.  The Xorg.0.log seems
> ok:
>
> (**) Option "CoreKeyboard"
> (**) Generic Keyboard: always reports core events
> (**) Option "Protocol" "standard"
> (**) Generic Keyboard: Protocol: standard
> (**) Option "AutoRepeat" "500 30"
> (**) Option "XkbRules" "xorg"
> (**) Generic Keyboard: XkbRules: "xorg"
> (**) Option "XkbModel" "pc104"
> (**) Generic Keyboard: XkbModel: "pc104"
> (**) Option "XkbLayout" "us"
> (**) Generic Keyboard: XkbLayout: "us"
> (**) Option "CustomKeycodes" "off"
> (**) Generic Keyboard: CustomKeycodes disabled
> (II) XINPUT: Adding extended input device "Generic Keyboard" (type: KEYBOARD)
>
> Mouse works ok.
> Thoughts?

No idea, as I only netboot my c3000 and normally don't work in front of those PA boxes.
I'll test if I see the same issues...
Did you tried bisecting 2.6.30.8 and 2.6.30.9 ?

Helge

From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: HPMC running CMake Nightly tests
Date: Fri, 21 Oct 2011 10:26:57 +0200
Message-ID: <1c7b6eb5f6657272fe96ad90b79f215f.squirrel@webmail.sf-mail.de>
References: <d21336a9332d91f209ba666bd94f3acd.squirrel@webmail.sf-mail.de>
    <20111012043201.GA22657@parisc-linux.org>
    <335757fae9d67623b229652e74aba015.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <335757fae9d67623b229652e74aba015.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>> On Tue, Sep 27, 2011 at 09:32:37AM +0200, Rolf Eike Beer wrote:
>>> I'm running the CMake tests every night. This is the second time in a
>>> row
>>> that my C3600 did not survive this. Since I was warned I connected a
>>> serial console.
>> ...
>>
>>> But then the machine got killed:
>>>
>>> Backtrace:
>>>  [<1030b9ec>] tulip_get_stats+0x34/0x5c
>>>  [<1038ac20>] dev_get_stats+0x98/0xe8
>>>  [<102946b4>] led_work_func+0x11c/0x310
>>>  [<10145204>] process_one_work+0x120/0x3ac
>>>  [<10147110>] worker_thread+0x174/0x338
>>>  [<1014b0b4>] kthread+0x9c/0xa4
>>>  [<10102c5c>] ret_from_kernel_thread+0x1c/0x24
>>>
>>>
>>> High Priority Machine Check (HPMC): Code=1 regs=10551080
>>> (Addr=00000000)
>>>
>>>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>> PSW: 00000000000001001111111100001110 Not tainted
>>> r00-03  0004ff0e 105bf000 1030b9ec 2fc72000
>>> r04-07  0000000f 00000000 00000000 00000000
>>> r08-11  2fc72000 105bf600 2fea4208 7f000000
>>> r12-15  2fea4210 105ba000 10544000 2fc2f408
>>> r16-19  1041d1dc f000017c f0000174 2fea4210
>>> r20-23  0099f055 0099f050 1030b9b8 00000000
>>> r24-27  2ff57008 2fea4210 0004a040 10544000
>>> r28-31  0004a040 f68e066d 2fea4400 1038ac20
>>> sr00-03  00000000 00000000 00000000 00000017
>>> sr04-07  00000000 00000000 00000000 00000000
>>>
>>> IASQ: 00000000 00000000 IAOQ: 10284394 10284398
>>>  IIR: 0f80109c    ISR: a627ffd0  IOR: 0204a040
>>>  CPU:        0   CR30: 2fea4000 CR31: ffffdffe
>>>  ORIG_R28: 00000000
>>>  IAOQ[0]: ioread32+0xc/0x4c
>>
>> Usually the HMPC means tulip tried to read something
>> from MMIO space that didn't respond and this
>> resulted in a "Master Abort" (PCI bus controller
>> had to abort the transaction). On PCs that's not
>> fatal but is on many RISC architectures.
>>
>> If you can decode the instruction pointer (ioread32+0x10) to figure out
>> which register is used to dereference the MMIO address, it would
>> be obvious what the offending address is - just to confirm the
>> pointer isn't pointing off into the weeds. It will be one of the
>> registers that contains a 0xfnnnnnnn address.
>
> I will have a look.
>
>> Interrupt the boot process and collect the HPMC dump as described:
>>    http://www.parisc-linux.org/faq/kernelbug-howto.html>
>>
>> The output will include the offending address that the ioread32 was
>> trying to access to confirm the instruction was decoded correctly.
>> If anyone has access to the magic decoder ring, we might be able to tell
>> more.

Ok, I have another one. I removed all those parts that did not show any
errors or where the register contents were all zeros.

Timestamp =
  Thu Oct  20 09:05:52 GMT 2011    (20:11:10:20:09:05:52)

HPMC Chassis Codes = 2cbf0  2500b  2cbfb

General Registers 0 - 31
00-03   0000000000000000  00000000105bf000  000000001030bbd4 
000000002fe46000
04-07   000000000000000f  0000000000000000  0000000000000000 
0000000000000008
08-11   000000002fe46000  00000000105bf600  000000002fec8208 
000000007f000000
12-15   000000002fec8210  00000000105ba000  0000000010544000 
000000002fc2f408
16-19   000000001041d1dc  00000000f000017c  00000000f0000174 
000000002fec8210
20-23   000000000108ce00  000000000108cdf3  000000001030bba0 
0000000000000000
24-27   000000000000f424  000000002fec8210  000000000004a040 
0000000010544000
28-31   000000000004a040  0000000000000000  000000002fec8400 
000000001038ae40

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000 
0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000 
0000000000000000
08-11   000000000000004e  0000000000000000  00000000000000c0 
000000000000003d
12-15   0000000000000000  0000000000000000  0000000000102000 
00000000fe000000
16-19   0000230bfe918584  0000000000000000  0000000010284504 
000000000f80109c
20-23   00000000a627ffd0  000000000204a040  000000ff0006fc0e 
0000000080000000
24-27   0000000000594000  000000011ec4a000  00000000ffffffff 
00000000ffffffff
28-31   00000000ffffffff  00000000ffffffff  000000002fec8000 
00000000ffffffff
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000027
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000010284508
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff4008040
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000 
0000000000000000
04-07   0000000a00000000  0000000000000000  0000000000000000 
0000000049ba5e35
08-11   0000000000000000  1059900010544330  0000000000000000 
105fbd602fe470c8
12-15   ffffffff00000000  0000000000000000  0000000000000000 
0000000000000000
16-19   95380000ffffffff  8008000000000000  0010000000000000 
9118000000000000
20-23   8108000000000000  8008000000000000  0000000000000000 
0000000100000000
24-27   0000000000000000  0000000000090a6e  0000000000000015 
0000000000000000
28-31   ffffffff0000313c  1055f1d010544000  0000000100000228 
2fc302001011a234

'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81041008000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x0301000000000004
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0x4b023fd9e8190951
Read Short LOG               = 0xc1af00fff4008040
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0xc1bff0fffed08040
RUN_DATA_LOW                 = 0xc1bff0fffed08040
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc1bff0fffed08040
System Responder Path        = 0x00ffffff0a000c00


HPMC PIM Analysis Information:

Timestamp =
  Thu Oct  20 09:05:52 GMT 2011    (20:11:10:20:09:05:52)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/0/12/0 (built-in PCI
device).


I/O Module Error Log Information:

Timestamp =
  Thu Oct  20 09:05:52 GMT 2011    (20:11:10:20:09:05:52)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc2a9   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------

Eike

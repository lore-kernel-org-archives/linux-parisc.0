From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fix unwind crash - was: Re: 2.6.26 kernel crash
Date: Sat, 02 Aug 2008 00:15:40 +0200
Message-ID: <48938B0C.4000809@gmx.de>
References: <200807201846.11809.deller@gmx.de> <200807201907.59762.deller@gmx.de> <488F7E32.4070204@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <488F7E32.4070204@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Kyle,

I verified, that my attached patch fixes the kernel panic.
Testcase is here: http://gsyprf10.external.hp.com/~deller/crash.tgz
Could you please apply the patch?
Signed-off-by: Helge Deller <deller@gmx.de>

Thanks,
Helge

PS:
arch/parisc/kernel/unwind.c, line 225 looks kinda fishy as well:
225: info->prev_ip = *(unsigned long *)(info->prev_sp - RP_OFFSET);

PPS:
Instead of a kernel panic (which is really annoying since you need to 
reboot the machine) I now get as expected an user fault:

do_page_fault() pid=1846 command='a.out' type=6 address=0x87802043
vm_start = 0x407ff000, vm_end = 0x40802000

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  0004ff0f 407c9f6b 406fbfe3 00012b00
r04-07  fb4ec308 000125b8 407fd534 000e6ba8
r08-11  fb4ec014 00000001 0001264a 000d3b60
r12-15  00000000 000d3b5c 000db4c8 000b0000
r16-19  000d06a0 000b0000 ffffffff 23882000
r20-23  406fc15f 406fc138 87802042 00012d80
r24-27  407fd534 000125b8 407fd534 000125b8
r28-31  00000000 00000000 00012e00 406fbfe3
sr00-03  000007f6 000007f6 00000000 000007f6
sr04-07  000007f6 000007f6 000007f6 000007f6

IASQ: 000007f6 000007f6 IAOQ: 87802043 87802047
  IIR: 43ffff80    ISR: 000007f6  IOR: 407d9adc
  CPU:        0   CR30: 8dbd0000 CR31: d2b345e2
  ORIG_R28: 000107c7
  IAOQ[0]: 0x87802040
  IAOQ[1]: 0x87802044
  RP(r2): 0x406fbfe0
Backtrace:
  [<10120650>] outb+0x64/0x70




Helge Deller wrote:
> I narrowed down to the problematic codepath, and I assume the attached 
> patch might fix it. Problem is, that I can't test without my testcase 
> which is on gsyprf10 (which is unreachable right now), so this patch 
> here is currently a RFC...
> 
> Helge
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> 
> Helge Deller wrote:
>> On Sunday 20 July 2008, Helge Deller wrote:
>>> While debugging some user-space stuff I just faced this 32bit kernel 
>>> crash (2.6.26):
>>> Maybe someone has an idea?
>>
>> This is reproduceable.
>> Testcase and docu is here: 
>> http://gsyprf10.external.hp.com/~deller/crash.tgz
>>
>> Just run:
>> LD_LIBRARY_PATH=.  ./a.out
>>
>> Output is:
>> making contexts
>> swapping contexts
>> start f2
>> &on_stack=0x12d88
>> start f1(a0=1,a1=2,a2=3,a3=fffffffc)
>> <crash>
>>
>> Info:
>> - test program is from glibc:
>>         glibc-2.7/stdlib/tst-setcontext.c
>> - the compiled libc.so.6 includes some changes for *context() 
>> functions from me.
>>
>>  
>>> Kernel Fault: Code=15 regs=5f578640 (Addr=000127ec)
>>>
>>>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>> PSW: 00000000000001001111110000001111 Not tainted
>>> r00-03  0004fc0f 10644f10 1011ee68 5f578288
>>> r04-07  00000014 8c1fe860 8c1fe828 8eb7d030
>>> r08-11  105ee890 00000040 0001264a 000d3b60
>>> r12-15  00000000 000d3b5c 000dde68 000b0000
>>> r16-19  8eb7d250 000b0000 ffffffff 000127ec
>>> r20-23  ffffe040 00000000 101205d4 00000000
>>> r24-27  00012800 101205cc 5f578288 1062ff10
>>> r28-31  00000000 000002ee 5f578640 10120630
>>> sr00-03  00000000 000013a7 00000000 000013a7
>>> sr04-07  00000000 00000000 00000000 00000000
>>>
>>> IASQ: 00000000 00000000 IAOQ: 1011ed04 1011ed08
>>>  IIR: 0e601093    ISR: 00000000  IOR: 000127ec
>>>  CPU:        0   CR30: 5f578000 CR31: ffffffff
>>>  ORIG_R28: 40400000
>>>  IAOQ[0]: unwind_frame_regs+0x214/0x244
>>>  IAOQ[1]: unwind_frame_regs+0x218/0x244
>>>  RP(r2): unwind_once+0x10/0x48
>>> Backtrace:
>>>  [<1011ee68>] unwind_once+0x10/0x48
>>>  [<10112bbc>] do_show_stack+0x28/0xac
>>>  [<10112cd0>] parisc_show_stack+0x90/0xa8
>>>  [<10111258>] do_page_fault+0x174/0x294
>>>  [<10113824>] handle_interruption+0x570/0x58c
>>>  [<10117078>] intr_check_sig+0x0/0x34
>>>
>>> Kernel panic - not syncing: Kernel Fault


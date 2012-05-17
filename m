From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Thu, 17 May 2012 21:57:20 +0200
Message-ID: <5770099dcbd607c019c941971e019b12.squirrel@webmail.sf-mail.de>
References: <4FA9975C.5060708@bergerie>
    <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
    <4FAADE2A.9080803@bergerie>
    <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
    <4FAEE943.2030203@gmx.de>
    <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
    <4FB182F8.2040403@gmx.de>
    <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
    <1337069366.3005.10.camel@dabdike.lan>
    <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>
    <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>
    <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>
    <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>
    <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "John David Anglin" <dave.anglin@bell.net>,
	"James Bottomley" <james.bottomley@hansenpartnership.com>,
	"Vincent" <vincent.stehle@laposte.net>,
	linux-parisc@vger.kernel.org
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB550F1.7080104@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 05/15/2012 10:48 PM, John David Anglin wrote:
>> We need to debug why your B160L hangs.  Can you kill whatever hangs
>> from the console?  Sometimes the application is still in the foreground.
>
> Ok, the B160L problem is gone now.
> I found the reason for this bug between the chair and the monitor :-)
> (it was my fault - sorry .... )
>
> But I think we still have a problem.
> I'm using 3.4.0-rc7, have pulled all fixes from James "fixes" branch,
> and Dave's "vmlinux.lds" patch.
>
> The 32bit machines (715/64 and B160L) boot nicely into userspace.
> The 64bit machine (C3000) crashes directly when switching to userspace.
>
> Do we still have another problem somewhere?
> Or is it introduced because of the vmlinux.lds patch?
> (Reminder: without the vmlinux.lds patch the C3000 hangs directly at
> bootup after printing memory information...)
>
> Helge
>
> VFS: Mounted root (ext3 filesystem) readonly on device 8:3.
> Freeing unused kernel memory: 316k freed
> Backtrace:
>   [<10119560>] clear_user_page_asm+0x44/0x6c
>   [<101195dc>] clear_user_page+0x54/0x6c
>   [<101bbaa8>] handle_pte_fault+0x5dc/0x7a8
>   [<101bbd3c>] handle_mm_fault+0xc8/0x120
>   [<101bbffc>] __get_user_pages+0x160/0x3c4
>   [<101bc348>] get_user_pages+0x50/0x60
>   [<101e169c>] get_arg_page+0x64/0xe8
>   [<101e182c>] copy_strings+0x10c/0x248
>   [<101e1990>] copy_strings_kernel+0x28/0x44
>   [<101e328c>] do_execve+0x2a0/0x36c
>   [<10120424>] sys_execve+0x44/0x7c
>   [<10104084>] __execve+0x20/0x34
>   [<10133b9c>] vprintk+0x1d8/0x4f4
>   [<10133ee8>] printk+0x30/0x40
>   [<10118550>] free_initmem+0x154/0x184
>   [<10117cbc>] init_post+0xa0/0xd4
>
>
> Kernel Fault: Code=26 regs=8fc30940 (Addr=0f2ff000)
>
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001101111111100001110 Not tainted
> r00-03  0006ff0e 00000040 10119560 8fc308c0
> r04-07  106e5820 107d2000 0000000f 10768020
> r08-11  ffeffff1 8fd00ffc 8f49ce40 00000001
> r12-15  00000000 00000017 00000001 00000000
> r16-19  00004400 00000020 00000000 ffffffff
> r20-23  00000000 00000000 00000001 00000040
> r24-27  1090aa40 ffeffff1 0000fa40 106e2020
> r28-31  0f2ff000 0007d882 8fc30940 0007d024
> sr00-03  00000000 00000000 00000000 00000000
> sr04-07  00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 10100eec 10100ef0
>   IIR: 0f801280    ISR: 00000000  IOR: 0f2ff000
>   CPU:        0   CR30: 8fc30000 CR31: de9345e0
>   ORIG_R28: 8f812728
>   IAOQ[0]: __clear_user_page_asm+0x20/0x70
>   IAOQ[1]: __clear_user_page_asm+0x24/0x70
>   RP(r2): clear_user_page_asm+0x44/0x6c
> Backtrace:
>   [<10119560>] clear_user_page_asm+0x44/0x6c
>   [<101195dc>] clear_user_page+0x54/0x6c
>   [<101bbaa8>] handle_pte_fault+0x5dc/0x7a8

Looks basically as if we are back at the start, no? Because the initial
problem was only a few instructions away. So, did we change the 64 bit
assembly in any way?

Eike

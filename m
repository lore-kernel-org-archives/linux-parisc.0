Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24882
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 10:18:00 -0700
Message-ID: <1A8904C3797ED411AC2E0008C7E6F88117C6A4@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'Andreas Thienemann'" <andreas@bawue.de>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] FW: hp_boot.log
Date: Fri, 8 Dec 2000 18:20:10 +0100 
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

Hi Andreas,

I tried three other machines, with following results
1) B180c
2) B000  
3) 712    
On the B2000 booting also resulted in stack dump,
on B180c and the 712 the system freezes to death after the "switching to UPL
console" message.

I wonder, if it has something to do with the problem that i encounterd some
time ago with the linux port to sun-hardware.
If the system had to much memory, it was not able to startup.
Cant do much testing now, and next week i am @ HP. (see what happens if i
try to boot from my cd at the hp-trainings lab...;-))

Hans
> -----Original Message-----
> From:	Andreas Thienemann [SMTP:andreas@bawue.de]
> Sent:	Friday, December 08, 2000 5:33 PM
> To:	Witvliet, Hans
> Cc:	'parisc-linux@thepuffingroup.com'; 'thuis'
> Subject:	Re: [parisc-linux] FW: hp_boot.log
> 
> Hi Hans,
> 
> "Witvliet, Hans" wrote:
> 
> > I had the impression that the C110 was supported, however when booting
> from
> > cd (from palinux.05.iso) i got following results:
> Interesting.
> 
> This does resemble the crash I'm experiencing on my D250.
> 
> The Kernel boots, finds some Hardware and than dumps stack. Somewhere
> after
> the message "Posix Conformance tested".
> 
> The following is from my fault message:
> ---
> Data access rights fault in kernel: Code=26 regs=c7f9c7c0 (Addr=00000004)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001011
> r0-3     00000000 c0291800 c02712ec 00000000
> r4-7     c7ffc400 ffffffff c01c3870 c025d800
> r8-11    c0292800 000000f0 00000000 000000ff
> r12-15   000000f2 000000fa 000000fd f0100000
> r16-19   f0001180 f0000070 f0000068 00000000
> r20-23   c7f9c74e 00000002 c0271574 ffd07000
> r24-27   c7f9c750 00000f20 00000000 c023a000
> r28-31   00000001 00000000 c7f9ca00 0027b9b8
> sr0-4    00000000 00000000 00000000 00000000
> sr4-8    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: c0271308 c027130c
>  IIR: 0e681096    ISR: 00000000  IOR: 00000004
> ORIG_R28: 000000fd
> ---
> 
> I guess it has something to do with the "i82596_probe".
> Could you do a lookup of the IAOQ Register to see if it is the same?
> Get the "build-tools" from the CVs, and use the "a" program to lookup the
> symbol in your system-map.
> 
> bye,
>  andreas
> 
> --------------------------------------------------------------------------
> -
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
> with
> `unsubscribe' as the subject.

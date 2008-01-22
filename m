From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: some gij-4.3/2.6.24-rc8 crashes
Date: Tue, 22 Jan 2008 10:40:36 -0500
Message-ID: <119aab440801220740g77918c01r5c768f688f8170ca@mail.gmail.com>
References: <200801191816.25091.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200801191816.25091.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Jan 19, 2008 12:16 PM, Helge Deller <deller@gmx.de> wrote:
> I noticed the following crashes yesterday with a plain 2.6.24-rc8 kernel.
> Maybe someone has an idea?

Please see the following URL and my inline comments.
http://www.parisc-linux.org/faq/kernelbug-howto.html

> The system still worked afterwards.
>
>       _______________________________
>      < Your System ate a SPARC! Gah! >
>       -------------------------------
>              \   ^__^
>               \  (xx)\_______
>                  (__)\       )\/\
>                   U  ||----w |
>                      ||     ||
> gij-4.3.bin (pid 23032): Protection id trap (code 27)
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001111 Not tainted
> r00-03  0004000f 10280000 1018d72c 60314388
> r04-07  00000000 000197a8 00000001 60314388
> r08-11  00000000 fffffff2 603140c8 00000006
> r12-15  00176fc0 0001bb40 00000014 00001000
> r16-19  402c3554 00019840 0001bb54 00000001
> r20-23  000197ae 00000000 6031439e 00000000
> r24-27  00000001 1050eaac 7e6c2970 1059f010
> r28-31  0000000f 00000001 60314500 1018d4e4
> sr00-03  00000000 00000000 00000000 000000ca
> sr04-07  00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 1018d76c 1018d770
>  IIR: 0e95d240    ISR: 000000ca  IOR: 000197ae
>  CPU:        0   CR30: 60314000 CR31: 11111111
>  ORIG_R28: 1017d598
>  IAOQ[0]: do_sys_poll+0x138/0x1b0
>  IAOQ[1]: do_sys_poll+0x13c/0x1b0
>  RP(r2): do_sys_poll+0xf8/0x1b0
> Backtrace:
>  [<10106cf0>] die_if_kernel+0x130/0x1a0
>  [<1010755c>] handle_interruption+0x3f4/0x58c
>  [<1010a078>] intr_check_sig+0x0/0x34
>
>
>       _______________________________
>      < Your System ate a SPARC! Gah! >
>       -------------------------------
>              \   ^__^
>               \  (xx)\_______
>                  (__)\       )\/\
>                   U  ||----w |
>                      ||     ||
> gij-4.3.bin (pid 23166): Protection id trap (code 27)
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Tainted: G      D
> r00-03  0004ff0f 10280000 1010f864 600b8148
> r04-07  445e5400 54aec974 54aec778 445e5424
> r08-11  00000000 00000001 54aec974 600b8148
> r12-15  00000012 0001bb40 00000014 00001000
> r16-19  402c3554 00019840 0001bb54 00000001
> r20-23  00000012 fffffff8 37c6ea54 600b80c8
> r24-27  445e5424 600b80c8 445e5424 1059f010
> r28-31  00000012 00040001 600b82c0 10179e38
> sr00-03  00000000 00000000 00000000 000000ca
> sr04-07  00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 10138ae4 10138ae8
>  IIR: 0f54d280    ISR: 000000ca  IOR: 445e5424
>  CPU:        0   CR30: 600b8000 CR31: 11111111
>  ORIG_R28: 1017d598
>  IAOQ[0]: copy_siginfo_to_user+0x54/0x458
>  IAOQ[1]: copy_siginfo_to_user+0x58/0x458
>  RP(r2): setup_rt_frame+0xb8/0x388
> Backtrace:
>  [<10106cf0>] die_if_kernel+0x130/0x1a0
>  [<1010755c>] handle_interruption+0x3f4/0x58c
>  [<1010a078>] intr_check_sig+0x0/0x34

- The userspace process received a signal.
- We setup the signal frame on the users stack.
- We start copying the siginfo struct into userspace and fail.

This isn't fatal because we are writing into a userspace address, it
*is* fatal to the userspace process.

Did you run out of memory?

c.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA13683
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 10:47:32 -0700
Date: Mon, 22 Jan 2001 11:44:01 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] tar hangs on 715/75
In-Reply-To: <20010122165014.O3571@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0101221123580.19359-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Mon, 22 Jan 2001, Richard Hirst wrote:

[ snip! ]

> Do other people see this problem on 715/old machines?  Just type 'tar';
> if you have the problem you'll never see the usage message.
> 
> Even better, does anyone have any suggestions as to what might be
> causing it?  I am using taggarts new tarball nfsroot.

My C100 barfs (Bus error) when I run tar or make (and probably other
programs I haven't discovered).  dmesg shows:

!!die_if_kernel: tar(6969): Unaligned data reference 28
 
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3     00000000 40149938 4015dc7b 401470d4
r4-7     40168148 00000000 00000031 001e8481
r8-11    bb0001a8 bb0001a0 00000001 4001ada0
r12-15   4001ad7c 00000000 0009c5b0 00000000
r16-19   00000000 00000001 0000b71b 40168148
r20-23   001e8000 40159f14 bb000454 00000008
r24-27   40161460 00000000 401470d4 00076808
r28-31   00000016 00000000 bb000700 4006e987
sr0-3    00005187 00005187 00000000 00005187
sr4-7    00005187 00005187 00005187 00005187
 
IASQ: 00005187 00005187 IAOQ: 4015e0ab 4015e0af
 IIR: 0c6011d4    ISR: 00005187  IOR: 401470d4
ORIG_R28: 00000000 

I don't know if this may in any way be related.

- Greg

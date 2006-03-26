From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes) and more
Date: Sun, 26 Mar 2006 18:58:56 +0200
Message-ID: <200603261858.56874.deller@gmx.de>
References: <e6eae0290603251932l142222f2n@mail.gmail.com>
	<20060326040516.GA27713@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060326040516.GA27713@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 26 March 2006 06:05, John David Anglin wrote:
> > Regarding the segfault, I can't help you there ... although I have seen many
> > applications not longer working on my Debian/testing system lately
> > (segfault, 'unresolvable relocation error 0x42' most of the time).
> 
> This should be fixed in libc6 2.3.6-3 which has support for the above
> relocation.  If it's still occurring, there needs to be a new bug report.
> In the situations that I've seen the relocations are coming from
> /usr/lib/Scrt1.o when pie code is being used.

Hi Dave,

I'm running libc6-2.3.6-4 and see some strange crashes. Might it be related, or does  2.3.6-4 doesn't includes your fix ?

Regards,
Helge

root@c3000:~# dpkg -l | grep libc
ii  libc6                       2.3.6-4                        GNU C Library: Shared libraries and Timezone data
ii  libc6-dev                   2.3.6-4                        GNU C Library: Development Libraries and Header Files
ii  libc6-pic                   2.3.6-4                        GNU C Library: PIC archive library

dbus-0.61-5.deb
nscd-2.3.6-4.deb

do_page_fault() pid=1854 command='dbus-daemon' type=15 address=0x41493520
vm_start = 0x4095d000, vm_end = 0x4095f000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111110100001111 Not tainted
r00-03  00000000 0062c6c3 409148df 40493818
r04-07  4095b714 404933b8 00000005 40493000
r08-11  0000000f 0007a960 00000005 fb556648
r12-15  fb55664c 4095c714 4095c714 fb55674c
r16-19  4095ed9c 00000001 00000000 4095b714
r20-23  01000168 00000000 000196a8 0007a960
r24-27  00000005 000000d3 a2d3a6be 00070eec
r28-31  00000000 404931e4 fb556880 409148f3
sr0-3   00000000 00000000 00000000 00001765
sr4-7   00001765 00001765 00001765 00001765

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  11bb69e08f41d7fc 000000001017b2f8 1051e2201051e220 11ba1b0810436960
fr08-11  0000000300000000 11bb69e00098963a 0000000000000002 11ba1b0810436960
fr12-15  0007a8a810517010 0000000010125938 0007a8c81054d6a0 0000000000030000
fr16-19  0000000b1051e810 11ba409c11ba4148 1051e220103af867 00002000103d15a0
fr20-23  11b9400000000000 0000000010166ef8 0000000000000000 0000000010514010
fr24-27  0000000110436810 10125a9800000000 232aaf8049c5f780 0098963a11b94000
fr28-31  ffffff9c11ba1b08 11ba414810167050 000000001051e010 00000000f0400004

IASQ: 00001765 00001765 IAOQ: 40914917 4091491b
 IIR: 0e85001c    ISR: 00001765  IOR: 41493520
 CPU:        0   CR30: 8eb90000 CR31: 104bc000
 ORIG_R28: 00000000
 IAOQ[0]: 0x40914917
 IAOQ[1]: 0x4091491b
 RP(r2): 0x409148df


do_page_fault() pid=1830 command='nscd' type=15 address=0x41493534
vm_start = 0x41425000, vm_end = 0x41428000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 410d0fdc 410b80cf 404c8c80
r04-07  410d0ca0 00000000 4426c56b 404937e8
r08-11  41493520 00000079 404933b8 00000079
r12-15  404c8e89 000000d3 000000d2 410d0df0
r16-19  4426c56b 00000059 410d0fdc 410d0ca0
r20-23  00000000 01000168 00000000 00000008
r24-27  404c8cb8 404c8e48 404c8cb8 410d0ca0
r28-31  00000001 00000803 404c8f40 00000000
sr0-3   00001701 00000000 00000000 00001701
sr4-7   00001701 00001701 00001701 00001701

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  11bb69e08f41d7fc 000000001017b2f8 1051e2201051e220 11ba1b0810436960
fr08-11  0000000300000000 11bb69e00098963a 0000000000000002 11ba1b0810436960
fr12-15  0000100010517010 404c8e4010125938 402ac4b41054d6a0 0000000000030000
fr16-19  0000000b1051e810 11ba409c11ba4148 1051e220103af867 00002000103d15a0
fr20-23  11b9400000000000 0000000010166ef8 40095a2bcccccccd 404c8cb810514010
fr24-27  0000000a10436810 10125a9800000000 232aaf8049c5f780 0098963a11b94000
fr28-31  ffffff9c11ba1b08 11ba414810167050 000000001051e010 00000000f0400004

IASQ: 00001701 00001701 IAOQ: 410b7f43 410b7f47
 IIR: 491c0028    ISR: 00001701  IOR: 41493534
 CPU:        0   CR30: 8e9cc000 CR31: 104bc000
 ORIG_R28: 00000001
 IAOQ[0]: 0x410b7f43
 IAOQ[1]: 0x410b7f47
 RP(r2): 0x410b80cf
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

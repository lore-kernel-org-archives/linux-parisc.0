From: "Helge Deller" <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 13 Apr 2010 13:55:01 +0200
Message-ID: <20100413115501.307040@gmx.net>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org, gniibe@fsij.org,
	carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100412214118.46D925160@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I wonder if it would help to enable the kunmap_atomic support used
> for the PA8800/PA8900 for the B2000.  It might be non equivalent alia=
sing
> causes corruption.

I did changed asm/processor.h to include my CPU:
static inline int parisc_requires_coherency(void)
{
#ifdef CONFIG_PA8X00
        return (boot_cpu_data.cpu_type >=3D pcxu);
#endif
}

CONFIG_PA8X00 is defined.

Still crashes.

> Are you using standard 4K pages?

Yes: CONFIG_PARISC_PAGE_SIZE_4KB=3Dy


> I assume that it's always the thread created by pthread_create that's
> causing the segv. =20

Yes, all my tests up to now indicated that too.

> What does the stack region for the thread look
> like when it drops core?  Possibly, we have two separate issues.

do_page_fault() pid=3D3890 command=3D'minifail_dave' type=3D6 address=3D=
0x00000003

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  0004ff0f 10561000 401190d7 c046e3c0
r04-07  4012b5f4 00000007 4012bdf4 00000000
r08-11  4012be64 00000000 c046e3ca 0000001c
r12-15  4012be60 4012c7f8 00000000 c046e448
r16-19  4012c0b0 c046e448 40129270 00000000
r20-23  00000000 00000000 00000000 00000000
r24-27  fffffff5 ffffffd3 4012c0b0 00011dac
r28-31  00000000 4012c0b0 c046e4c0 401190d7
sr00-03  00008dd2 00000000 00000000 00008dd2
sr04-07  00008dd2 00008dd2 00008dd2 00008dd2

IASQ: 00008dd2 00008dd2 IAOQ: 00000003 00000007
 IIR: 43ffff80    ISR: 00008dd2  IOR: 40000bd0
 CPU:        0   CR30: 87d24000 CR31: ffffffff
 ORIG_R28: 00000000
 IAOQ[0]: 00000003
 IAOQ[1]: 00000007
 RP(r2): 401190d7


or=20

do_page_fault() pid=3D28779 command=3D'minifail_dave' type=3D6 address=3D=
0x00000003

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  0004ff0f 10561000 401190d7 bff943c0
r04-07  4012b5f4 00000007 4012bdf4 00000000
r08-11  4012be64 00000000 bff943ca 0000001c
r12-15  4012be60 4012c7f8 00000000 bff94448
r16-19  4012c0b0 bff94448 40129270 00000000
r20-23  00000000 00000000 00000000 00000000
r24-27  fffffff5 ffffffd3 4012c0b0 00011dac
r28-31  00000000 4012c0b0 bff944c0 401190d7
sr00-03  000070bc 00000755 00000000 000070bc
sr04-07  000070bc 000070bc 000070bc 000070bc
IASQ: 000070bc 000070bc IAOQ: 00000003 00000007
 IIR: 43ffff80    ISR: 000070bc  IOR: 40000bd0
 CPU:        1   CR30: 8cfe4000 CR31: ffffffff
 ORIG_R28: 00000000
 IAOQ[0]: 00000003
 IAOQ[1]: 00000007
 RP(r2): 401190d7


or



do_page_fault() pid=3D9898 command=3D'minifail_dave' type=3D15 address=3D=
0x000000fc

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  0006ff0f 0029608d 40114127 00000000
r04-07  4012b5f4 40001768 00000007 00000000
r08-11  f4385cbf 40129270 4012bdf4 40d52348
r12-15  07a1c2e5 0000001f 40d52448 4012b5f4
r16-19  4012bdf4 40d52358 00000000 4012b5f4
r20-23  0001014c 00000000 0f843530 4031bdc4
r24-27  40d52348 00000003 000000f0 00011dac
r28-31  000000f0 40d52448 40d52580 4011410b
sr00-03  0000a53c 00000000 00000000 0000a53c
sr04-07  0000a53c 0000a53c 0000a53c 0000a53c

IASQ: 0000a53c 0000a53c IAOQ: 40113c23 40113c27
 IIR: 0f58101c    ISR: 0000a53c  IOR: 000000fc
 CPU:        0   CR30: 87c78000 CR31: ffffffff
 ORIG_R28: 00000000
 IAOQ[0]: 40113c23
 IAOQ[1]: 40113c27
 RP(r2): 40114127
--=20
GRATIS f=FCr alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

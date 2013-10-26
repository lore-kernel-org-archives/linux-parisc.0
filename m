From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Sat, 26 Oct 2013 19:17:20 +0200
Message-ID: <20131026191720.5282c0c3@marga.jer-c2.orkz.net>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Rolf Eike Beer <eike@sf-mail.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 26 Oct 2013 16:26:03 +0200
Rolf Eike Beer <eike@sf-mail.de> wrote:

> I did "modprobe ipmi_si" on my C8000 (kernel 3.11.6), which
> immediately broke the machine. I have no backtrace yet, but I'll try
> to get one next week. In case someone has such a machine and the mood
> to debug this already=E2=80=A6 ;)

[  730.964000] ipmi message handler version 39.2
[  731.092000] IPMI System Interface driver.
[  731.148000] ipmi_si: Adding default-specified kcs state
machine[  731.224000] ipmi_si: Trying default-specified kcs state
machine at i/o address 0xca2, slave address 0x0, irq 0 <Cpu0>
e800009800e00000  000000004042ab9c  CC_ERR_CHECK_HPMC <Cpu0>
37000f7300e00000  8040004000000000  CC_ERR_CPU_CHECK_SUMMARY <Cpu0>
f600105e00e00000  fffffff0f0c00000  CC_MC_HPMC_MONARCH_SELECTED <Cpu0>
140003b200e00000  000000000000000b  CC_ERR_HPMC_STATE_ENTRY <Cpu0>
5600100b00e00000  0000000000000194  CC_MC_OS_HPMC_LEN_ERR <Cpu0>
5600106400e00000  fffffff0f0435110  CC_MC_BR_TO_OS_HPMC_FAILED <Cpu0>
e800009800e00000  000000004042ab9c  CC_ERR_CHECK_HPMC <Cpu0>
37000f7300e00000  8040004000000000  CC_ERR_CPU_CHECK_SUMMARY <Cpu0>
4000109f00e00000  0000000000000000  CC_MC_HPMC_INITIATED <Cpu0>
4000101900e00000  0000000000000000  CC_MC_MULTIPLE_HPMCS <Cpu0>
030010d500e00000  0000000000000000  CC_CPU_STOP

Confirmed.


     jer
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

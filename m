Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA26807
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 12:59:12 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Jul 2000 19:00:46 -0000
To: Paul Bame <bame@noam.fc.hp.com>
Cc: Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
References: <20000713003533.Y9568@linuxcare.com> <E13CmYw-00077l-00@noam.fc.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 13 Jul 2000 14:46:11 -0400
In-Reply-To: Paul Bame's message of "Thu, 13 Jul 2000 11:14:14 -0600"
Message-ID: <87ya3527ik.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame <bame@noam.fc.hp.com> writes:

> I think this code is right, because 0x3c0-0x78 is 0x348.  I think this
> makes this a linker problem.  The off-by-0x2000 is suspicious
> since the ldo offset is 14 bits and 2^14 = 0x2000.

It looks like binutils is incorrectly treating those fields as
unsigned, or has an off by one error, or something similar.  The
reason why the version with the extra check and panic() makes it work
is because this makes gcc cleverly load the offset in the struct in
two steps.  note:

devinet.c.1.3:

#warning Take this test out when GCC is fixed
	if ((unsigned)&devinet_sysctl.devinet_root_dir <= (unsigned)&devinet_sysctl.devinet_vars) {
		panic(__FILE__ ": probable gcc bug");
	}
	devinet_sysctl.sysctl_header =
		register_sysctl_table(devinet_sysctl.devinet_root_dir, 0);

devinet.s.1.3:

	addil LR'devinet_sysctl-$global$,%r27
	ldo RR'devinet_sysctl-$global$+4(%r1),%r3  ; &devinet_sysctl.devinet_vars (offset 4)
	ldo 836(%r3),%r19                          ; &devinet_sysctl.devinet_root_dir (offset 840)
	comb,>> %r19,%r3,.L2613
	copy %r19,%r26                             ; arg 0 of register_sysctl_table
	ldil LR'.LC44,%r26
	.CALL ARGW0=GR
	bl panic,%r2
	ldo RR'.LC44(%r26),%r26
.L2613:
	.CALL ARGW0=GR,ARGW1=GR
	bl register_sysctl_table,%r2
	nop

relevant bits of hppa-linux-objdump -S vmlinux for 1.3:

c02ae538:       2b 6f 00 00     addil 1e000,dp,%r1
c02ae53c:       34 23 24 e0     ldo 1270(r1),r3
c02ae540:       34 73 06 88     ldo 344(r3),r19
c02ae544:       88 73 a0 18     cmpb,>> r19,r3,c02ae558 <.L2613>
c02ae548:       08 13 02 5a     copy r19,r26

Note:

$ printf "%x\n" $((0x1270+0x344))
15b4

devinet.c.1.4:

	devinet_sysctl.sysctl_header =
		register_sysctl_table(devinet_sysctl.devinet_root_dir, 0);

devinet.s.1.4:

	addil LR'devinet_sysctl-$global$,%r27
	ldi 0,%r25
	ldo RR'devinet_sysctl-$global$+840(%r1),%r4
	.CALL ARGW0=GR,ARGW1=GR
	bl register_sysctl_table,%r2
	copy %r4,%r26

relevant bits of hppa-linux-objdump -S vmlinux for 1.4:

c02ae534:       2b 6f 00 00     addil 1e000,dp,%r1
c02ae538:       34 19 00 00     ldi 0,r25
c02ae53c:       34 24 2b 69     ldo -a4c(r1),r4
c02ae540:       e8 5f 08 15     b,l c02ad950 <.Lfe1+0x118>,rp
c02ae544:       08 04 02 5a     copy r4,r26

Note:
$ printf "%x\n" -0xa4c
fffff5b4

(and of course, the low 13 bits of that are 0x15b4)

I'm looking at the relevant binutils code right now.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA25142
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 11:11:48 -0600
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by cosrel1.hp.com (Postfix) with ESMTP id 7CAD92E9
	for <parisc-linux@thepuffingroup.com>; Thu, 13 Jul 2000 11:13:18 -0600 (MDT)
To: Alan Modra <amodra@puffin.external.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems 
In-Reply-To: Your message of "Thu, 13 Jul 2000 00:35:33 BST."
             <20000713003533.Y9568@linuxcare.com>
References: <20000713003533.Y9568@linuxcare.com> 
Date: Thu, 13 Jul 2000 11:14:14 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13CmYw-00077l-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


More info on this one -- and yes it's the old problem come back to
haunt us.

Witness two functions:

    static void * a2(void) {
	return (void *)&devinet_sysctl.devinet_root_dir;
    }
    static void * a3(void) {
	return (void *)&devinet_sysctl;
    }

And their return values:

    a3 c028b22c a2 c0289574

a2 should be c028b574 -- it's off by 0x2000 as Richard noted earlier.
a3() is OK and a2() is broken.

Here's disassembly from vmlinux via objdump:

    c021b27c <a2>:
    c021b27c:       2b 6f 00 00     addil 1e000,dp,%r1
    c021b280:       e8 40 c0 00     bv r0(rp)
    c021b284:       34 3c 2a e9     ldo -a8c(r1),ret0

    c021b288 <a3>:
    c021b288:       2b 6f 00 00     addil 1e000,dp,%r1
    c021b28c:       e8 40 c0 00     bv r0(rp)
    c021b290:       34 3c 24 58     ldo 122c(r1),ret0

The two ldo instructions should be showing a difference of 0x348 -- the
ofset of the member within the struct which I calculated separately.  As
shown, the offsets differ by 0x2348.  This code is hosed.

The object file says:

    00000000 <a2>:
       0:   2b 60 00 00     addil 0,dp,%r1
			    0: R_PARISC_DPREL21L    .data+0x78
       4:   e8 40 c0 00     bv r0(rp)
       8:   34 3c 00 00     ldo 0(r1),ret0
			    8: R_PARISC_DPREL14R    .data+0x3c0
    Disassembly of section .text.a3:

    00000000 <a3>:
       0:   2b 60 00 00     addil 0,dp,%r1
			    0: R_PARISC_DPREL21L    .data+0x78
       4:   e8 40 c0 00     bv r0(rp)
       8:   34 3c 00 00     ldo 0(r1),ret0
			    8: R_PARISC_DPREL14R    .data+0x78

I think this code is right, because 0x3c0-0x78 is 0x348.  I think this
makes this a linker problem.  The off-by-0x2000 is suspicious
since the ldo offset is 14 bits and 2^14 = 0x2000.

For completeness here's what came out of the compiler, which looks cool
to me:

    a1:
	    .PROC
	    .CALLINFO FRAME=0,NO_CALLS
	    .ENTRY
	    addil LR'devinet_sysctl-$global$,%r27
	    bv %r0(%r2)
	    ldw RR'devinet_sysctl-$global$+844(%r1),%r28
	    .EXIT
	    .PROCEND

    a2:
	    .PROC
	    .CALLINFO FRAME=0,NO_CALLS
	    .ENTRY
	    addil LR'devinet_sysctl-$global$,%r27
	    bv %r0(%r2)
	    ldo RR'devinet_sysctl-$global$+840(%r1),%r28

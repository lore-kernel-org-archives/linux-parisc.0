Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C04C48C4
	for <parisc-linux@parisc-linux.org>; Tue, 25 Sep 2001 19:17:17 -0600 (MDT)
Date: Wed, 26 Sep 2001 01:16:13 +0000
From: Richard Allen <ra@hp.is>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Trace/breakpoint trap
Message-ID: <20010926011613.A18474@hp.is>
References: <20010925234225.A18261@hp.is> <ra@hp.is> <20010926001857.1BAF937C8D@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010926001857.1BAF937C8D@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Tue, Sep 25, 2001 at 06:18:57PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 25, 2001 at 06:18:57PM -0600, Matt Taggart wrote:
> Try it with strace and post the results. Was anything printed on the console?

Im as thick as they come.   Ofcource kernel messages are in dmesg...

Lots and lots of the following:


     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011000000000000001011
r0-3	 00000000 00040130 bff028b8 bff02818
r4-7	 000000c8 40176434 0005d5a0 0004beb6
r8-11	 00000001 0004be88 000401ec bff02790
r12-15	 00000028 00000029 bff02690 00000000
r16-19	 00000000 00043130 0002a800 00000000
r20-23	 000000ad 40106c54 40178e50 40178e30
r24-27	 00000005 00000001 00000000 00040130
r28-31	 000000c8 0005d598 bff02b38 00019ca4
sr0-3	 00000132 0000012f 00000000 00000132
sr4-7	 00000132 00000132 00000132 00000132

IASQ: 00000132 00000132 IAOQ: bff02cd7 bff03d83
 IIR: 00000000    ISR: 00000132  IOR: 00000000
 CPU:        0   CR30: 1bef0000 CR31: 10358000
 ORIG_R28: 40176434
break 0,0: pid=4248 command='make'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011000000000000001011
r0-3	 00000000 00040130 bff028b8 bff02818
r4-7	 000000c8 40176434 0005d5a0 0004beb6
r8-11	 00000001 0004be88 000401ec bff02790
r12-15	 00000028 00000029 bff02690 00000000
r16-19	 00000000 00043130 0002a800 00000000
r20-23	 000000ad 40106c54 40178e50 40178e30
r24-27	 00000005 00000001 00000000 00040130
r28-31	 000000c8 0005d598 bff02b38 00019ca4
sr0-3	 00000132 0000012f 00000000 00000132
sr4-7	 00000132 00000132 00000132 00000132

IASQ: 00000132 00000132 IAOQ: bff02cd7 bff03d83
 IIR: 00000000    ISR: 00000132  IOR: 00000000
 CPU:        0   CR30: 1bef0000 CR31: 10358000
 ORIG_R28: 40176434
break 0,0: pid=4248 command='make'



-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BFD2482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 07:56:19 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 161U7k-0005gY-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 07 Nov 2001 15:56:16 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1005144976.3be94b9093186@webmail.tiscalinet.be>
Date: Wed, 07 Nov 2001 15:56:16 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] evms_vgscan crash hppa kernel
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

I just apply evms-0.2.3 patches against hppa kernel 2.4.9-pa78.
This kernel compiles, boots and runs also fine on my b180.

But when I launch evms_vgscan the kernel crash with following message:

...
Kernel Fault: Code=15 regs=124fc6c0 (Addr=faf00918)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 10117000 1018c314 00000000
r4-7     10085e40 00000001 00000000 faf00908
r8-11    17b57c80 124bf300 00023674 faf00788
r12-15   00000000 ffffffff 000c2310 00000000
r16-19   00000000 000255c8 00014000 00023d60
r20-23   00000200 00000000 00000200 102ac400
r24-27   00000200 124fc808 00000000 1029c010
r28-31   00000000 00000000 124fc6c0 102ac420
sr0-3    00000000 00000000 00000000 000002d5
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1018c350 1018c354
 IIR: 48fa0020    ISR: 00000000  IOR: faf00918
 CPU:        0   CR30: 124fc000 CR31: 10348000
 ORIG_R28: 124fc508

a "grep 1018c3 /boot/System.map"
1018c394 t evms_ioctl_cmd_get_minor

I would like to debug this by obtaining a core dump of the kernel after the 
reboot but I do not know how? (I did not find back the mail explaining how to do 
it in detail)

Thanks in advance for help,
        Joel




-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)

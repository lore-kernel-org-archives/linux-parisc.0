Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70CF9484E
	for <parisc-linux@parisc-linux.org>; Fri, 10 Oct 2003 16:17:01 -0600 (MDT)
Message-ID: <3F872FDC.2090408@tiscali.be>
Date: Fri, 10 Oct 2003 22:17:00 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] evolution (1.4.5-1) do_page_fault?
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

The new evolution crash on my c110 [debian unstable] (even though I test 
successfully a previous release on my b2k) with a kernel 2.6test7pa5.

do_page_fault() pid=3917 command='evolution' type=7 address=0x413627db
vm_start = 0x41332000, vm_end = 0x413b3000

    YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 413c6bf0 41383947 00690d80
r04-07  413c7bf0 00000000 00000001 00000000
r08-11  0000000c 0030c7a8 41288844 0000007e
r12-15  001c622c 002d7830 000009e4 0013a078
r16-19  08000000 faf03260 0000003a 413c7bf0
r20-23  00154d1c 413627c0 00154c90 00002007
r24-27  00101006 00154c90 00690d80 000c1478
r28-31  00000001 00000019 faf03980 4185c657
sr0-3   00000000 00000088 00000000 00000088
sr4-7   00000088 00000088 00000088 00000088

IASQ: 00000088 00000088 IAOQ: 413627db 413627df
IIR: 687c0048    ISR: 00000088  IOR: 00690da4
CPU:        0   CR30: 10bd4000 CR31: 103cb000
ORIG_R28: 41a130a0
IAOQ[0]: 0x413627db
IAOQ[1]: 0x413627df
RP(r2): 0x41383947
     _______________________________
    < Your System ate a SPARC! Gah! >
     -------------------------------
            \   ^__^
             \  (xx)\_______
                (__)\       )\/\
                 U  ||----w |
                    ||     ||

I put the question because very surprised by this message?

Thanks for advise,
   Joel

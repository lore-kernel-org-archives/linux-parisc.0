Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id D56894841
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 10:07:52 -0600 (MDT)
Message-ID: <3F897C56.800@tiscali.be>
Date: Sun, 12 Oct 2003 16:07:50 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] flush_tlb_all_local:
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

into parisc/kernel/pacache.S, i find this:
[...]
flush_tlb_all_local:
[...]
         rsm     PSW_SM_Q,%r0       /* Turn off Q bit to load iia queue */
         ldil    L%REAL_MODE_PSW, %r1
         ldo     R%REAL_MODE_PSW(%r1), %r1
         mtctl   %r1, %cr22
         mtctl   %r0, %cr17
         mtctl   %r0, %cr17
[...]

Why twice 'mtctl   %r0, %cr17'?

and also:
[...]
fitmanymiddle:                                  /* Loop if LOOP >= 2 */
         ADDIB>          -1,%r31,fitmanymiddle   /* Adjusted inner loop 
decr */
         pitlbe          0(%sr1,%r28)
         pitlbe,m        %arg1(%sr1,%r28)        /* Last pitlbe and addr 
adjust */

Typicaly the function name is flush_..., so why do we 'purge' here?

Thanks in advance for help,
	Joel

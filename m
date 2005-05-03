From: "Joel Soete" <soete.joel@tiscali.be>
Subject: yet another ssm/rsm/rfi question [Was: [parisc-linux] head.S: a small
	typo]
Date: Tue, 3 May 2005 16:56:10 +0000
Message-ID: <426F252F00002DD9@mail-1-bnl.tiscali.it>
References: <20050501152849.GA17998@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050501152849.GA17998@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hello all,

yet another strange notice between head.S and real2.S:

the following:
/* rfi_virt2real() and rfi_real2virt() could perhaps be adapted for
 * more general-purpose use by the several places which need RFIs
 */
        .text
        .align 128
rfi_virt2real:
        /* switch to real mode... */
        pcxt_ssm_bug

        rsm             PSW_SM_Q+PSW_SM_I,%r0  /* prep to load iia queue
*/
        mtctl           %r0, %cr17      /* Clear IIASQ tail */
        mtctl           %r0, %cr17      /* Clear IIASQ head */
        load32          PA(rfi_v2r_1), %r1
        mtctl           %r1, %cr18      /* IIAOQ head */
        ldo             4(%r1), %r1
        mtctl           %r1, %cr18      /* IIAOQ tail */
        load32          REAL_MODE_PSW, %r1
        mtctl           %r1, %cr22
        rfi

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
rfi_v2r_1:
        tophys_r1 %r2
        bv      0(%r2)
        nop

looks very like to me to:
        .text
        .align  128

        .export flush_tlb_all_local,code

flush_tlb_all_local:
        .proc
        .callinfo NO_CALLS
        .entry

        /*
         * The pitlbe and pdtlbe instructions should only be used to
         * flush the entire tlb. Also, there needs to be no intervening
         * tlb operations, e.g. tlb misses, so the operation needs
         * to happen in real mode with all interruptions disabled.
         */

        pcxt_ssm_bug

        /* relied upon translation! PA 2.0 Arch. F-4 and F-5 */
        rsm             PSW_SM_Q+PSW_SM_I, %r0  /* prep to load iia queue=

*/
        mtctl           %r0, %cr17              /* Clear IIASQ tail */
        mtctl           %r0, %cr17              /* Clear IIASQ head */
        ldil            L%PA(1f), %r1
        ldo             R%PA(1f)(%r1), %r1
        mtctl           %r1, %cr18              /* IIAOQ head */
        ldo             4(%r1), %r1
        mtctl           %r1, %cr18              /* IIAOQ tail */
        load32          REAL_MODE_PSW, %r1
        mtctl           %r1, %cr22
        rfi
        nop

1:      ldil            L%PA(cache_info), %r1
        ldo             R%PA(cache_info)(%r1), %r1

        /* Flush Instruction Tlb */
[snip]

(well we could easly re-label 1 by e.g. flush_tlb_all_local_1 and use "lo=
ad32
PA(flush_tlb_all_local_1), %r1")
but I am surprised to not find the 8 nops between rfi and label.

Any recommendation about this?

Thanks again,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

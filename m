From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Tue, 26 Apr 2005 19:36:43 +0200
Message-ID: <4252B02B000092E3@mail-1-bnl.tiscali.it>
References: <200504251623.j3PGNq6m011656@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504251623.j3PGNq6m011656@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

> 
> >         nop             /* 8 */
> > -#endif
> 
> The arch document (page F-4) says that you only need 7 instructions
> between ssm and rsm.
> 
Yes for the following bacth (this time with 64bits included on b2k only n=
ot
yet for d380 sorry next step)

That said it works also (32 bit up and smp, 64bit up)
the same if I replace .align 256 by 128 no pb
(btw I disasemble the resulting kernel text and this code seems to be onl=
y
called once and very early)

btw I don't more understand why the following ifdef (in the same head.S):=

#ifdef __LP64__ /* move to psw.h? */   
#define         PSW_BITS        PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R
#else
#define         PSW_BITS        PSW_SM_Q
#endif

Oth I still have thousand of detailed questions but started to the main o=
ne:
your concern in a previous mail;
if I well understand it's located in 2 places in pacache.S and one would
be in:
[snip]
        .align  128

        .export disable_sr_hashing_asm,code

disable_sr_hashing_asm:
        .proc
        .callinfo NO_CALLS
        .entry

        /* Switch to real mode */

        ssm             0, %r0                  /* relied upon translatio=
n!
*/
        nop
        nop
        nop
        nop
        nop
        nop
        nop

        rsm             (PSW_SM_Q|PSW_SM_I), %r0 /* disable Q&I to load t=
he
iia queue */
        ldil            L%REAL_MODE_PSW, %r1
        ldo             R%REAL_MODE_PSW(%r1), %r1
        mtctl           %r1, %cr22
        mtctl           %r0, %cr17              /* Clear IIASQ tail */
        mtctl           %r0, %cr17              /* Clear IIASQ head */
        ldil            L%PA(1f), %r1
        ldo             R%PA(1f)(%r1), %r1
        mtctl           %r1, %cr18              /* IIAOQ head */
        rfi
        nop

1:      cmpib,=3D,n       SRHASH_PCXST, %r26,srdis_pcxs
        cmpib,=3D,n       SRHASH_PCXL, %r26,srdis_pcxl
        cmpib,=3D,n       SRHASH_PA20, %r26,srdis_pa20
        b,n             srdis_done
[snip]
srdis_done:

        /* Switch back to virtual mode */

        rsm             PSW_SM_Q, %r0           /* clear Q bit to load ii=
a
queue */
        ldil            L%KERNEL_PSW, %r1
        ldo             R%KERNEL_PSW(%r1), %r1
        mtctl           %r1, %cr22
        mtctl           %r0, %cr17              /* Clear IIASQ tail */
        mtctl           %r0, %cr17              /* Clear IIASQ head */
        ldil            L%(2f), %r1
        ldo             R%(2f)(%r1), %r1
        mtctl           %r1, %cr18              /* IIAOQ head */
        ldo             4(%r1), %r1
        mtctl           %r1, %cr18              /* IIAOQ tail */
        rfi
        nop

2:      bv              %r0(%r2)
        nop
        .exit
[snip]

Always if I well understand this last srdis_done would looks like:
srdis_done:


        /* Switch back to virtual mode */

        ssm             0, %r0                  /* relied upon translatio=
n!
*/
        nop
        nop
        nop
        nop
        nop
        nop
        nop

        rsm             PSW_SM_Q, %r0           /* clear Q bit to load ii=
a
queue */
        ldil            L%KERNEL_PSW, %r1
        ldo             R%KERNEL_PSW(%r1), %r1
        mtctl           %r1, %cr22
        mtctl           %r0, %cr17              /* Clear IIASQ tail */
        mtctl           %r0, %cr17              /* Clear IIASQ head */
[snip]

Thanks in advance,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

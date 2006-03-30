From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] What's the right way to create a new stack in glibc?
Date: Thu, 30 Mar 2006 07:35:27 +0100
Message-ID: <IWXGZ3$DD5205B10AADF945ECDD523A4C5A1C7B@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randoplh, Carlos,

May be can you give me some more light.

I was testing all rational changes suggested by tausq in last mail about
clone() patch but it was broken. A first one was of mine I sadly confuse
boolean and bit  insn, after a fix it was still broken ;<(. I so come bac=
k
step by step to a working situation and noticed that:
this hunk made panicing kernel:
[snip]    
.Larg_error:

       /* Create a stack frame */
       ldo             64(%sp), %sp

       /* Set errno */
       bl              __syscall_error, %rp
       sub             %r0, %ret0, %arg0

       /* Return after setting errno */
       /* Restore rp from ENTRY() */
       ldw             -84(%sp), %rp
       bv              %r0(%rp)
       ldo             -64(%sp), %sp
[snip]
clone04(2665): unaligned access to 0xfffffffa at ip=3D0x00011027
clone04(2665): unaligned access to 0xfffffffa at ip=3D0x0001105f
clone04(2665): unaligned access to 0xfffffffa at ip=3D0x00011177
clone04(2665): unaligned access to 0xfffffffa at ip=3D0x0001117f
Unaligned handler failed, ret =3D -2
clone04 (pid 2665): Unaligned data reference (code 28) at 0001119b
kernel BUG at /CAD/linux-2.6.16-pa8/mm/mmap.c:1957!
Backtrace:
 [<10158848>] exit_mmap+0x178/0x330
 [<101235a4>] mmput+0x44/0xb8
 [<101281e0>] do_exit+0x12c/0x8a0
 [<101289b8>] do_group_exit+0x64/0xc4
 [<1010b114>] syscall_exit+0x0/0x14

Kernel panic - not syncing: BUG!

OTH, this hunk was working:
[snip]
.Larg_error:

        /* Create a stack frame */
        stwm            %r3, 64(%sp)

        /* Set errno */
        bl              __syscall_error, %rp
        sub             %r0, %ret0, %arg0

        /* Return after setting errno */
        /* Restore rp from ENTRY() */
        ldw             -84(%sp), %rp
        bv              %r0(%rp)
        ldwm            -64(%sp), %r3
[snip]

Even though that's well what does gcc when I compile this sample:
[snip]
int sclone(unsigned long Val1, unsigned long Val2)
{
  if ((( Val1) && (Val2))) {
    printf ("Ok ;-)\n");
    return 0;
  } else { 
    printf ("Ko ;-(\n");
    return -1;
  } 
};
[snip]

# gcc --save-temps -O2 foo.c
more foo.s
[snip]
sclone:
        .PROC
        .CALLINFO FRAME=3D64,CALLS,SAVE_RP
        .ENTRY
        stw %r2,-20(%r30)
        comib,=3D 0,%r26,.L2
        ldo 64(%r30),%r30
        comib,<>,n 0,%r25,.L7
.L2:
        ldil LR'.LC1,%r26
        bl puts,%r2
        ldo RR'.LC1(%r26),%r26
        ldw -84(%r30),%r2
        ldi -1,%r28
        bv %r0(%r2)
        ldo -64(%r30),%r30
.L7:
[snip]

TIA for addtional attention,
    Joel




=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

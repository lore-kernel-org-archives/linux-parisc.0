From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 10:22:45 -0700
Message-ID: <20040921172245.GS22642@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

willy found a problem this morning with the exception code which was
traced down to the following:

the following code comes from lusercopy.S (with macros expanded):

lstrncpy_from_user:
        .proc
        .callinfo NO_CALLS
        .entry
        comib,=     0,%r24,$lsfu_done
        copy        %r24,%r23
        get_sr
1:      ldbs,ma     1(%sr1,%r25),%r1
$lsfu_loop:
        stbs,ma     %r1,1(%r26)
        comib,=,n   0,%r1,$lsfu_done
        addib,<>,n  -1,%r24,$lsfu_loop
2:      ldbs,ma     1(%sr1,%r25),%r1
$lsfu_done:
        sub         %r23,%r24,%r28
$lsfu_exit:
        bv          %r0(%r2)
        nop
        .exit

        .section .fixup,"ax"
3:      b $lsfu_exit
        ldi         -EFAULT,%r28
        .previous

        .section __ex_table,"aw"
        .word       1b,3b
        .word       2b,3b
        .previous

        .procend

what is supposed to happen is that when a fault happens at "1:", we
would branch to "3:". The code in "3:" sets the return value to -EFAULT
and branches back to the exit path.

what we observed was that when a fault happens, we get an endless loop
of faults.

when i disassembled the code at 3:, i see:

1038ce68:       e8 05 00 7d     b,l 10357eac <tcpdiag_dump+0x5ac>,r0
1038ce6c:       34 1c 3f e5     ldi -e,ret0

the target of the branch is a long branch stub:

10357eac:       20 20 02 02     ldil 10100000,r1
10357eb0:       e0 20 22 b2     be,n 158(sr4,r1)

but 10100158 is lstrncpy_from_user, not $lsfu_exit:
10100158 <lstrncpy_from_user>
10100190 <$lsfu_exit>

i wonder if the sections are somehow confusing things.... this is with
fairly recent gcc/binutils toolchains, for 32-bit.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Tue, 1 May 2007 21:42:14 +0200
Message-ID: <20070501194214.GB4309__23996.6954956346$1416624345$gmane$org@amd64.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
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

Hi all,

We have just switched to a glibc 2.5 using LT + TLS in Debian. This
causes unaligned memory access when using bash:

bash(19279): unaligned access to 0x000e1bb2 at ip=0x407cb76b

Using prctl to trap on aligned access and gdb, the unaligned access
seems to be in closedir() (a glibc function), at the point marked by
a '*'.
   
   0x40bcb718 <closedir+0>:        stw rp,-14(sp)
   0x40bcb71c <closedir+4>:        stw,ma r5,40(sp)
   0x40bcb720 <closedir+8>:        stw r4,-3c(sp)
   0x40bcb724 <closedir+12>:       stw r3,-38(sp)
   0x40bcb728 <closedir+16>:       movb,= r26,r3,0x40bcb7a8 <closedir+144>
   0x40bcb72c <closedir+20>:       stw r19,-20(sp)
   0x40bcb730 <closedir+24>:       addil L%1000,r19,r1
   0x40bcb734 <closedir+28>:       ldw 0(r3),r5
   0x40bcb738 <closedir+32>:       ldw 5b0(r1),ret0
   0x40bcb73c <closedir+36>:       ldw 64(ret0),r20
   0x40bcb740 <closedir+40>:       cmpib,<> 0,r20,0x40bcb7c8 <closedir+176>
   0x40bcb744 <closedir+44>:       copy r20,r22
   0x40bcb748 <closedir+48>:       b,l 0x40bb4aa0,rp
   0x40bcb74c <closedir+52>:       copy r3,r26
   0x40bcb750 <closedir+56>:       copy r5,r26
   0x40bcb754 <closedir+60>:       copy r19,r4
   0x40bcb758 <closedir+64>:       be,l 100(sr2,r0),sr0,r31
   0x40bcb75c <closedir+68>:       ldi 6,r20
   0x40bcb760 <closedir+72>:       copy r4,r19
   0x40bcb764 <closedir+76>:       addil L%1000,r19,r1
 * 0x40bcb768 <closedir+80>:       ldw 5ec(r1),r31
   0x40bcb76c <closedir+84>:       sub r0,ret0,r22
   0x40bcb770 <closedir+88>:       ldi -1000,r20
   0x40bcb774 <closedir+92>:       cmpb,<< r20,ret0,0x40bcb794 <closedir+124>
   0x40bcb778 <closedir+96>:       copy ret0,r21
   0x40bcb77c <closedir+100>:      copy r21,ret0
   0x40bcb780 <closedir+104>:      ldw -54(sp),rp
   0x40bcb784 <closedir+108>:      ldw -3c(sp),r4
   0x40bcb788 <closedir+112>:      ldw -38(sp),r3
   0x40bcb78c <closedir+116>:      bv r0(rp)
   0x40bcb790 <closedir+120>:      ldw,mb -40(sp),r5
   0x40bcb794 <closedir+124>:      mfctl tr3,ret0
   0x40bcb798 <closedir+128>:      ldi -1,r21
   0x40bcb79c <closedir+132>:      add,l ret0,r31,ret0
   0x40bcb7a0 <closedir+136>:      b,l 0x40bcb77c <closedir+100>,r0
   0x40bcb7a4 <closedir+140>:      stw r22,0(ret0)
   0x40bcb7a8 <closedir+144>:      ldi 16,r21
   0x40bcb7ac <closedir+148>:      addil L%1000,r19,r1
   0x40bcb7b0 <closedir+152>:      ldw 5ec(r1),ret0
   0x40bcb7b4 <closedir+156>:      mfctl tr3,r20
   0x40bcb7b8 <closedir+160>:      add,l r20,ret0,r20
   0x40bcb7bc <closedir+164>:      stw r21,0(r20)
   0x40bcb7c0 <closedir+168>:      b,l 0x40bcb77c <closedir+100>,r0
   0x40bcb7c4 <closedir+172>:      ldi -1,r21

The problem does not look obvious (at least to me). Any idea?

Thanks,
Aurelien

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

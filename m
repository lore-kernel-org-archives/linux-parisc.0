From: nobody@nowhere.invalid (Unknown)
Subject: (unknown)
Date: Sat, 22 Nov 2014 01:45:15 +0000 (UTC)
Message-ID: <17712.5709517442$1416620715@news.gmane.org>


0x401cec20 <_ZSt8buf_cout>:     #   40948

00000000401ce000-00000000401e7000 rwxp 00000000000a7000 08:03 65295      /usr/lib/libstdc++.so.3.0.2

Albert, I assume you did install the new libstdc++3 as well?

apt-get works fine for me, btw (715/75 and a500), running apt 0.5.4


Albert's r2 was 401845ff:

0x401845f0 <_ZNKSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE6do_putES3_RSt8ios_basecm+64>: stw r21,-6c(sr0,sp)
0x401845f4 <_ZNKSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE6do_putES3_RSt8ios_basecm+68>: b,l 0x4018ec44 <_ZNSbIwSt11char_traitsIwESaIwEEC1Ev+1088>,rp
0x401845f8 <_ZNKSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE6do_putES3_RSt8ios_basecm+72>: stw r20,-34(sr0,sp)
0x401845fc <_ZNKSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE6do_putES3_RSt8ios_basecm+76>: copy r5,ret0
0x40184600 <_ZNKSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE6do_putES3_RSt8ios_basecm+80>: copy r4,r19

which looks reasonable...

0x4018ec44 <_ZNSbIwSt11char_traitsIwESaIwEEC1Ev+1088>:  addil -1800,r19,%r1
0x4018ec48 <_ZNSbIwSt11char_traitsIwESaIwEEC1Ev+1092>:  ldw 5e8(sr0,r1),r21
0x4018ec4c <_ZNSbIwSt11char_traitsIwESaIwEEC1Ev+1096>:  bv r0(r21)
0x4018ec50 <_ZNSbIwSt11char_traitsIwESaIwEEC1Ev+1100>:  ldw 5ec(sr0,r1),r19

a .plt lookup, or something.


Richard

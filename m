From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Gcc bug or I missunderstand? [ftsd %fr22, 56(%sr0,
	%r20) failed to build?]
Date: Wed, 15 Dec 2004 17:27:05 +0100
Message-ID: <418A80250000FC28@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: dave@hiauly1.hia.nrc.ca
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

Hello all,

In the memcpy.c stand this comment:
 * TODO:
[...]
 * - try not to use the post-increment address modifiers; they create add=
itional
 *   interlocks
[...]

I right a test case which is precompile as:
        { register double r1;
                __asm__ __volatile__ ( "\t" "fldd" " 0(" "%%sr0" ",%1),
%0\n" : "=3Df"(r1) : "r"(pds) : "r8");
        while (len >=3D 8*sizeof(double)) {




                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "0" "(" "%%s=
r0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");
                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "8" "(" "%%s=
r0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");
                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "16" "(" "%%=
sr0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");
                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "24" "(" "%%=
sr0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");

                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "32" "(" "%%=
sr0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");
                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "40" "(" "%%=
sr0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");
                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "48" "(" "%%=
sr0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");
                __asm__ __volatile__ ( "1:\t" "fstd" " %1, " "56" "(" "%%=
sr0"
",%0)\n" : "+r"(pdd) : "f"(r1) : "r8");
                pdd -=3D 8;
                len -=3D 8*sizeof(double);
        }
        };

it failed to build because:

gcc -save-temps -o tmset5 tmset5.c
tmset5.s: Assembler messages:
tmset5.s:122: Error: Invalid operands 
tmset5.s:130: Error: Invalid operands 
tmset5.s:138: Error: Invalid operands 
tmset5.s:146: Error: Invalid operands 
tmset5.s:154: Error: Invalid operands 
tmset5.s:162: Error: Invalid operands 

this tmset5.s looks like:
[...]
    101 .L11:
    102         ldw 56(%r3),%r20
    103         ldo 64(%r3),%r19
    104         fldds 0(%r19),%fr22
    105 #APP
    106         1:      fstd %fr22, 0(%sr0,%r20)
    107
    108 #NO_APP
    109         stw %r20,56(%r3)
    110         ldw 56(%r3),%r20
    111         ldo 64(%r3),%r19
    112         fldds 0(%r19),%fr22
    113 #APP
    114         1:      fstd %fr22, 8(%sr0,%r20)
    115
    116 #NO_APP
    117         stw %r20,56(%r3)
    118         ldw 56(%r3),%r20
    119         ldo 64(%r3),%r19
    120         fldds 0(%r19),%fr22
    121 #APP
    122         1:      fstd %fr22, 16(%sr0,%r20)
    123
    124 #NO_APP
    125         stw %r20,56(%r3)
    126         ldw 56(%r3),%r20
    127         ldo 64(%r3),%r19
    128         fldds 0(%r19),%fr22
    129 #APP
    130         1:      fstd %fr22, 24(%sr0,%r20)
    131
    132 #NO_APP
    133         stw %r20,56(%r3)
    134         ldw 56(%r3),%r20
    135         ldo 64(%r3),%r19
    136         fldds 0(%r19),%fr22
    137 #APP
    138         1:      fstd %fr22, 32(%sr0,%r20)
    139 
    140 #NO_APP
    141         stw %r20,56(%r3)
    142         ldw 56(%r3),%r20
    143         ldo 64(%r3),%r19
    144         fldds 0(%r19),%fr22
    145 #APP
    146         1:      fstd %fr22, 40(%sr0,%r20)
    147
    148 #NO_APP
    149         stw %r20,56(%r3)
    150         ldw 56(%r3),%r20
    151         ldo 64(%r3),%r19
    152         fldds 0(%r19),%fr22
    153 #APP
    154         1:      fstd %fr22, 48(%sr0,%r20)
    155 
    156 #NO_APP
    157         stw %r20,56(%r3)
    158         ldw 56(%r3),%r20
    159         ldo 64(%r3),%r19
    160         fldds 0(%r19),%fr22
    161 #APP
    162         1:      fstd %fr22, 56(%sr0,%r20)
    163
    164 #NO_APP
    165         stw %r20,56(%r3)
    166         ldw 56(%r3),%r19
    167         ldo -64(%r19),%r19
    168         stw %r19,56(%r3)
    169         ldw -44(%r3),%r19
    170         ldo -64(%r19),%r19
    171         stw %r19,-44(%r3)
    172         b,n .L9
[...]

in lines: 
    106         1:      fstd %fr22, 0(%sr0,%r20)
[...]
    114         1:      fstd %fr22, 8(%sr0,%r20)
[...]

no pb but for following ones:

[...]
    122         1:      fstd %fr22, 16(%sr0,%r20)
[...]
    130         1:      fstd %fr22, 24(%sr0,%r20)
[...]
    138         1:      fstd %fr22, 32(%sr0,%r20)
[...]
    146         1:      fstd %fr22, 40(%sr0,%r20)
[...]
    154         1:      fstd %fr22, 48(%sr0,%r20)
[...]
    162         1:      fstd %fr22, 56(%sr0,%r20)
[...]

it seems that if d>8 there is a pb?
Did I miss something?

Thanks in advance for help,
    Joel

-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

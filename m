From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] hppa64-...-gcc-4.1 annoying pb?
Date: Thu,  4 May 2006 11:23:05 +0200
Message-ID: <IYQI2H$6645391A0E02D81A0F770E4531372AEB@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
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

Hello Dave,

I already rebuild and run recent pa kernel with gcc-4.1 but apparently I
missed a strange pb with hppa64: it seems to take abnormaly enormous time=
 to
compile 

  hppa64-linux-gnu-gcc-4.1 -Wp,-MD,mm/.page_alloc.o.d  -nostdinc -isystem=

/usr/lib/gcc/hppa64-linux-gnu/4.1.1/include -D__KERNEL__ -Iinclude -Iincl=
ude2
-I/usr/src/linux-2.6.17-rc3-pa2/include -include include/linux/autoconf.h=

-I/usr/src/linux-2.6.17-rc3-pa2/mm -Imm -Wall -Wundef -Wstrict-prototypes=

-Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit-frame-pointer =
-pipe
-mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-section=
s
-march=3D2.0 -mschedule=3D8000 -Wdeclaration-after-statement -Wno-pointer=
-sign 
-D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(page_alloc)" 
-D"KBUILD_MODNAME=3DKBUILD_STR(page_alloc)" -c -o mm/page_alloc.o
/usr/src/linux-2.6.17-rc3-pa2/mm/page_alloc.c

top showing me:
top - 11:16:03 up 21:14,  5 users,  load average: 1.00, 1.00, 0.94
Tasks:  69 total,   2 running,  67 sleeping,   0 stopped,   0 zombie
Cpu0  : 18.0% us,  3.0% sy,  0.1% ni, 78.8% id,  0.2% wa,  0.0% hi,  0.0%=
 si
Mem:   4115284k total,   825596k used,  3289688k free,    95032k buffers
Swap:   250872k total,        0k used,   250872k free,   520436k cached
Change delay from 1.0 to: 
  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  P WCHAN    
COMMAND                                                   
21547 root      25   0 19692  17m 3976 R 97.2  0.4  51:11.32 0 intr_chec =
cc1 
                                                      
 4986 root      16   0  2980 1336 1016 R  2.9  0.0  29:29.88 0 227038604 =
top 
                                                      

# strace -p 21547
write(1, " %r28,63,61,%r31\n\tdepd,z %r25,2,"..., 4096) =3D 4096
write(1, ",120(%r3)\n\tdepd,z %r23,62,63,%r3"..., 4096) =3D 4096
write(1, "37:\n\taddil LT\'.LC12,%r27\n\tcopy %"..., 4096) =3D 4096
mmap(NULL, 1048576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, =
0) =3D
0x40d2e000
write(1, "pd,z %r28,60,61,%r28\n\tldo 128(%r"..., 4096) =3D 4096
write(1, ",ENTRY_GR=3D18\n\t.ENTRY\n\taddil LT\'n"..., 4096) =3D 4096
write(1, "totalram_pages(%r1),%r28\n\tstd,ma"..., 4096) =3D 4096
brk(0x59b000)                           =3D 0x59b000
brk(0x59a000)                           =3D 0x59a000
brk(0x597000)                           =3D 0x597000
... (pending)

just shows me those few lines after 45min?

I am quite sure it will be completed but I don't know yet how much time i=
t
would require?

Thanks in advance,
    Joel

PS: Dave I will try your patch regarding n4k asap (thanks ;-) )

=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

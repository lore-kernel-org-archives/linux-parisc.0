Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 839364841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 13:33:09 -0700 (MST)
Message-ID: <3FAC0146.2050800@hrzpub.tu-darmstadt.de>
Date: Fri, 07 Nov 2003 21:32:06 +0100
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
References: <3FA95BBA.7080705@hrzpub.tu-darmstadt.de> <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/mixed;
 boundary="------------060009030406010801000901"
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

This is a multi-part message in MIME format.
--------------060009030406010801000901
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Wilcox schrieb:

>So we've lost the top 32 bits of the value.  Can you run it under strace
>and tell me what ioctls fdisk is calling?  I bet it's calling BLKGETSIZE64
>and our put_user() is broken.
>
Yes, it's calling BLKGETSIZE64... Full Output of 'strace fdisk' is attached.

Greetings,
    Ruediger

--------------060009030406010801000901
Content-Type: text/plain;
 name="fdisk-2.6.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="fdisk-2.6.log"


gandalf:~# strace fdisk /dev/sdb
execve("/sbin/fdisk", ["fdisk", "/dev/sdb"], [/* 14 vars */]) = 0
newuname({sys="Linux", node="gandalf", ...}) = 0
brk(0)                                  = 0x3a000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40018000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 35026, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\1\365"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 1446800, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40029000
mprotect(0x40172000, 99216, PROT_NONE)  = 0
mmap(0x40181000, 32768, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x148000) = 0x40181000
mmap(0x40189000, 5008, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40189000
close(3)                                = 0
munmap(0x40019000, 35026)               = 0
open("/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap2(NULL, 1860304, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4018b000
close(3)                                = 0
brk(0)                                  = 0x3a000
brk(0x5b000)                            = 0x5b000
brk(0)                                  = 0x5b000
open("/dev/sdb", O_RDWR|O_LARGEFILE)    = 3
read(3, "\200\0PALO\0\3\0\4\200\0\0)\323\375\0\0\0\0\0\0\0\0002"..., 512) = 512
newuname({sys="Linux", node="gandalf", ...}) = 0
ioctl(3, BLKSSZGET, 0xfaf004c8)         = 0
fstat64(3, {st_mode=0, st_size=6, ...}) = 0
ioctl(3, 0x301, 0xfaf004c8)             = 0
ioctl(3, BLKGETSIZE64, 0xfaf00530)      = 0
_llseek(3, 0, [0], SEEK_SET)            = 0
read(3, "\200\0PALO\0\3\0\4\200\0\0)\323\375\0\0\0\0\0\0\0\0002"..., 8192) = 8192
fstat64(1, {st_mode=0, st_size=5, ...}) = 0
ioctl(1, 0x40245410, {B9600 opost isig icanon echo ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
write(1, "\n", 1
)                       = 1
open("/usr/share/locale/locale.alias", O_RDONLY) = 4
fstat64(4, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "# Locale name alias data base.\n#"..., 4096) = 2539
read(4, "", 4096)                       = 0
close(4)                                = 0
munmap(0x4001a000, 4096)                = 0
open("/usr/share/locale/de_DE@euro/LC_MESSAGES/util-linux.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/share/locale/de@euro/LC_MESSAGES/util-linux.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/share/locale/de_DE/LC_MESSAGES/util-linux.mo", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/share/locale/de/LC_MESSAGES/util-linux.mo", O_RDONLY) = 4
fstat64(4, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 163630, PROT_READ, MAP_PRIVATE, 4, 0) = 0x40352000
close(4)                                = 0
open("/usr/lib/gconv/gconv-modules.cache", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/gconv/gconv-modules", O_RDONLY) = 4
fstat64(4, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "# GNU libc iconv configuration.\n"..., 4096) = 4096
read(4, ".B1.002//\nalias\tJS//\t\t\tJUS_I.B1."..., 4096) = 4096
read(4, "859-3\t1\nmodule\tINTERNAL\t\tISO-885"..., 4096) = 4096
read(4, "9-14//\nalias\tLATIN8//\t\tISO-8859-"..., 4096) = 4096
read(4, "CSEBCDICES//\t\tEBCDIC-ES//\nalias\t"..., 4096) = 4096
read(4, "IBM284//\nalias\tEBCDIC-CP-ES//\t\tI"..., 4096) = 4096
read(4, "ias\t864//\t\t\tIBM864//\nalias\tCSIBM"..., 4096) = 4096
read(4, "\tIBM937\t\t1\nmodule\tINTERNAL\t\tIBM9"..., 4096) = 4096
read(4, "UC-JP//\nmodule\tEUC-JP//\t\tINTERNA"..., 4096) = 4096
read(4, "143IECP271//\tIEC_P27-1//\nalias\tI"..., 4096) = 4096
read(4, "\nmodule\tINTERNAL\t\tISO_10367-BOX/"..., 4096) = 4096
read(4, "\t\tto\t\t\tmodule\t\tcost\nmodule\tShift"..., 4096) = 222
read(4, "", 4096)                       = 0
close(4)                                = 0
munmap(0x4001a000, 4096)                = 0
open("/usr/lib/gconv/ISO8859-15.so", O_RDONLY) = 4
read(4, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\7"..., 512) = 512
fstat64(4, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 73040, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x4037a000
mprotect(0x4037c000, 64848, PROT_NONE)  = 0
mmap(0x4038b000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0x1000) = 0x4038b000
close(4)                                = 0
write(1, "Befehl (m f\374r Hilfe): ", 22Befehl (m für Hilfe): ) = 22
fstat64(0, {st_mode=0, st_size=5, ...}) = 0
ioctl(0, 0x40245410, {B9600 opost isig icanon echo ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(0, p
"p\n", 4096)                    = 2
write(1, "\n", 1
)                       = 1
write(1, "Platte /dev/sdb: 40 MByte, 40239"..., 41Platte /dev/sdb: 40 MByte, 40239104 Byte
) = 41
write(1, "134 K\366pfe, 62 Sektoren/Spuren, 9"..., 42134 Köpfe, 62 Sektoren/Spuren, 9 Zylinder
) = 42
write(1, "Einheiten = Zylinder von 8308 * "..., 53Einheiten = Zylinder von 8308 * 512 = 4253696 Bytes

) = 53
write(1, "    Ger\344t Boot      Start       "..., 63    Gerät Boot      Start         End      Blocks   Id  System
) = 63
write(1, "/dev/sdb1   *           1       "..., 75/dev/sdb1   *           1           8       33201   f0  Linux/PA-RISC boot
) = 75
write(1, "/dev/sdb2               9       "..., 62/dev/sdb2               9          23       62310   83  Linux
) = 62
write(1, "/dev/sdb3              24       "..., 67/dev/sdb3              24          83      249240   82  Linux Swap
) = 67
write(1, "/dev/sdb4              84       "..., 66/dev/sdb4              84        1019     3888144   8e  Linux LVM
) = 66
write(1, "\n", 1
)                       = 1
write(1, "Befehl (m f\374r Hilfe): ", 22Befehl (m für Hilfe): ) = 22
read(0, q
"q\n", 4096)                    = 2
close(3)                                = 0
write(1, "\n", 1
)                       = 1
munmap(0x40019000, 4096)                = 0
exit(0)                                 = ?
gandalf:~#

--------------060009030406010801000901--

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.xs4all.nl (smtp1.xs4all.nl [194.109.127.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26135482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 13:21:03 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp1.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA19813
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 21:21:00 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Fri, 21 Sep 2001 21:17:33 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60 boots fine
Message-ID: <20010921211733.A5505@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <bdale@gag.com> <87g09gpkac.fsf@rover.gag.com> <200109211731.LAA01939@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109211731.LAA01939@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 21, 2001 at 11:31:51AM -0600, Grant Grundler wrote:
> Certainly. But we had to start someplace. I'm happy Paul wrote
> *any* documentation - an excellent set of documentation no less
> and packaged the whole mess.
> 
> IMHO, new folks need to get involved for stuff like palo enhancements.
> I'm sure Paul would welcome any patches people cook up.
> 
I guess that means me :-)

This is my current palo output:

jurriaan@pa8200:~$ sudo /sbin/palo
palo version 0.94 bame@c3k Sat Sep  8 12:33:24 MDT 2001
ELF32 executable
Partition Start(MB) End(MB) Id Type
1               1      31   f0 Palo
2              32    3846   83 ext2
3            3847    7661   83 ext2
4            7662    8678   82 swap
ipl: addr 16384 size 28672 entry 0x0
 ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
<2/boot/vmlinux-2.4.9-pa24 root=/dev/sda2 HOME=/>
ipl: addr 16384 size 28672 entry 0x0
 ko 0x44000 ksz 2853588 k64o 0x0 k64sz 0 rdo 0 rdsz 0
<2/boot/vmlinux-2.4.9-pa24 root=/dev/sda2 HOME=/>

Now if I understand correctly, palo must

- warn if there is no f0 partition
- warn if there is no ext2 partition in the first 2 Gb

The first is not that difficult, the relevant patch is here:

===================================================
diff -Br -b -U 3 -N palo/lib/diskpart.c palo-new/lib/diskpart.c
--- palo/lib/diskpart.c Fri Jun 15 12:05:10 2001
+++ palo-new/lib/diskpart.c     Fri Sep 21 22:37:54 2001
@@ -97,6 +97,7 @@
 {
     int i;
     const int mbshift = 20 - 9;
+    int f0_found = 0;

     printf("Partition Start(MB) End(MB) Id Type\n\r");
     for (i = 0; i < maxparts; i++)
@@ -110,6 +111,16 @@
                mptab[i].id == 0x83 ? "ext2" :
                        (mptab[i].id == 0x82 ? "swap" :
                                (mptab[i].id == 0xf0 ? "Palo" : "Unknown")));
+                if ( (mptab[i].id == 0xf0) &&
+                     (1 + ((mptab[i].start + mptab[i].length) >> mbshift) < 2048) )
+                  f0_found = 1;
+    }
+    if (f0_found == 0)
+    {
+        printf("WARNING: You have no partition with type f0 within the first 2 Gb of the disk.\n");
+        printf("palo needs this partition to store the bootloader and optional (recovery)\n");
+        printf("kernel/ramdisk. It's size should be 4 (minimal) to 16 (safe) Mb.\n");
+        printf("Read /usr/share/doc/palo/README for more information.\n");
     }
 }

===================================================

The second problem should probably be something like this:

===================================================
diff -Br -b -U 3 -N palo/palo/palo.c palo-new/palo/palo.c
--- palo/palo/palo.c    Thu Jun 21 12:05:38 2001
+++ palo-new/palo/palo.c        Fri Sep 21 23:14:48 2001
@@ -784,6 +792,20 @@
            }
            if (f0 == MAXPARTS)
                error(11);
+            if (strlen(commandline) > 1)
+            {
+                int bootpart=atoi(commandline);
+                if ((bootpart > 0) && (bootpart < MAXPARTS))
+                {
+                   /* 2^11 = 1048576 / 512 */
+                   if (1+((ptab[bootpart].start + ptab[bootpart].length) >> 11) >= 2048 )
+                   {
+                       printf("Warning: your kernel-image ('%s') is on a partition that isn't entirely below 2 Gb.\n",commandline);
+                       printf("Palo can't read files beyond 2 Gb on older machines. Read /usr/share/doc/palo/README for more informa
tion.\n");
+                   }
+                }
+            }
+
            print_ptab_pretty(ptab, MAXPARTS);

            if (0) printf("F0 partition start sector %d length %d\n",
===================================================

I'd appreciate pointers to improve this.

If this works out, perhaps adding reiserfs support to palo is next?
It works in yaboot (PPC boot-loader), after all.

Good luck,
Jurriaan
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
test.out: unmodified: line 1
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
test.out: unmodified: line 1

-- 
Your face is just a mask you wear,
but masks are hidden faces
	The Oysterband - The road to Santiago
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.00 0.00

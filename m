From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] kernel BUG at include/asm/mmzone.h:74!
Date: Sat, 10 Jul 2004 10:16:29 -0700
Message-ID: <20040710171629.GN546@tausq.org>
References: <200407101354.12456.deller@gmx.de>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200407101354.12456.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

In reference to a message from Helge Deller, dated Jul 10:
> I'm now running into this problem when trying to start X11, either with the VisEG stifb or sstfb driver.

this is because mmio space is not handled properly by the discontigmem
support...

this patch should "fix" it, but i'm not completely happy with this 
approach.  will think about it some more. it won't work on 64-bit 
platforms because pfn_is_io() is wrong there....

you don't need CONFIG_DISCONTIGMEM on c3000, so you can also just 
disable that :)

Index: include/asm-parisc/mmzone.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/mmzone.h,v
retrieving revision 1.2
diff -u -p -r1.2 mmzone.h
--- include/asm-parisc/mmzone.h	9 Jul 2004 19:04:21 -0000	1.2
+++ include/asm-parisc/mmzone.h	10 Jul 2004 17:03:25 -0000
@@ -64,10 +64,16 @@ extern struct node_map_data node_data[];
 #define PFNNID_MAP_MAX  512     /* support 512GB */
 extern unsigned char pfnnid_map[PFNNID_MAP_MAX];
 
+#define pfn_is_io(pfn) ((pfn & (0xf0000000 >> PAGE_SHIFT)) == (0xf0000000 >> PAGE_SHIFT))
+
 static inline int pfn_to_nid(unsigned long pfn)
 {
 	unsigned int i;
 	unsigned char r;
+
+	if (unlikely(pfn_is_io(pfn)))
+		return 0;
+
 	i = pfn >> PFNNID_SHIFT;
 	BUG_ON(i >= sizeof(pfnnid_map) / sizeof(pfnnid_map[0]));
 	r = pfnnid_map[i];


randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

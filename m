Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E51A4842
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  4 May 2004 16:56:39 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id F045829805B
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  4 May 2004 16:56:34 -0600 (MDT)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 02457-03 for <parisc-linux@lists.parisc-linux.org>;
	Tue, 4 May 2004 16:56:34 -0600 (MDT)
Date: Tue, 4 May 2004 16:56:34 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040504225634.GB32258@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [RFC] palo extended partition patch
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I was looking at palo and noticed the code to handle extended
partitions beyond 2GB wasn't very elegant and maybe wrong.

But I don't have extended partitions on any of my systems.
Anyone who does can build/test this for me?

I'm also wondering if the "Skipping extended partition"
message should really be printed or not.

thanks
grant

Index: lib/diskpart.c
===================================================================
RCS file: /var/cvs/palo/lib/diskpart.c,v
retrieving revision 1.6
diff -u -p -r1.6 diskpart.c
--- a/lib/diskpart.c	4 May 2004 21:41:05 -0000	1.6
+++ b/lib/diskpart.c	4 May 2004 22:01:25 -0000
@@ -53,12 +53,24 @@ load_partitions(int bootdev, struct disk
 	while (extnum < maxparts)
 	{
 	    /* we're currently using 32-bit file seeks which is ok since
-	     * the IPL is also limited to 2G right now.  So on big disks
-	     * this next read may fail, and we need to let that happen
-	     * gracefully.
+	     * the IPL is also limited to 2G right now.  On disks > 4GB
+	     * this next read may fail. Handle that gracefully.
+	     * Yes, we know newer IODC can read/write > 2GB but
+	     * it would confuse too many people if the docs attempted
+	     * to explain for no tangible benefit. And moving boot disks
+	     * between systems will always work (assuming a useable
+	     * kernel is present).
 	     */
+	    if (offset >= (2 * 1024 * 1024 * 1024 / 512)) {
+		printf("Skipping extended partition %d - beyond reach of IPL\n\r",
+				extnum);
+		break;
+	    }
 	    if (seekread(bootdev, (char *)&fb, sizeof fb, 512 * offset) == -1)
+		printf("seekread(bootdev,...,0x%x) failed!\n\r",
+				512 * offset);
 		break;
+	    }
 	    if (fb.dosmagic[0] != 0x55 || fb.dosmagic[1] != 0xaa)
 	    {
 		printf("Bad DOS magic in extended partition\n\r");

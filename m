From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [patch] Disable parport autoprobing on !X86
Date: Thu, 14 Jun 2007 22:36:00 +0800
Message-ID: <46715250.4050101__11919.6905907758$1416624393$gmane$org@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------060204090905040304060808"
To: parisc-linux@lists.parisc-linux.org,
 linux-parport@lists.infradead.org
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

This is a multi-part message in MIME format.
--------------060204090905040304060808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The attached patch disables auto-probing on non-X86 platforms. On many 
other platforms, autoprobing causes a machine check.

Thanks to Julian Stecklina for reporting and helping to debug the problem.

thoughts/comments?

randolph

--------------060204090905040304060808
Content-Type: text/plain;
 name="pp.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pp.diff"

Disable autoprobing on non-x86 archs because it may cause machine checks.

Signed-off-by: Randolph Chung <tausq@parisc-linux.org>

diff --git a/drivers/parport/parport_pc.c b/drivers/parport/parport_pc.c
index b61c17b..117f273 100644
--- a/drivers/parport/parport_pc.c
+++ b/drivers/parport/parport_pc.c
@@ -3381,6 +3381,8 @@ static int __init parport_pc_init(void)
 	if (parse_parport_params())
 		return -EINVAL;
 
+	/* Most architectures do not allow auto-probing */
+#ifdef CONFIG_X86
 	if (io[0]) {
 		int i;
 		/* Only probe the ports we were given. */
@@ -3395,6 +3397,7 @@ static int __init parport_pc_init(void)
 		}
 	} else
 		parport_pc_find_ports (irqval[0], dmaval[0]);
+#endif
 
 	return 0;
 }

--------------060204090905040304060808
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------060204090905040304060808--

From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [palo patch] Implement CTRL-U functionality
Date: Fri, 06 Jul 2007 16:44:05 -0700
Message-ID: <468ED3C5.8040104__21588.7906881564$1416624404$gmane$org@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------040204040303090305040207"
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

This is a multi-part message in MIME format.
--------------040204040303090305040207
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I keep on meaning to do this, and have finally done it.....

The attached patch makes the palo "editor" understand CTRL-U, so that 
you can quickly clear out a particular command line parameter.

Any comments? If not I will commit this in a few days, and hope that the 
Debian/Ubuntu/Gentoo folks eventually pick it up :)

randolph

--------------040204040303090305040207
Content-Type: text/plain;
 name="palo.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="palo.diff"

diff --git a/ipl/lib.c b/ipl/lib.c
index 544385e..06d790c 100644
--- a/ipl/lib.c
+++ b/ipl/lib.c
@@ -242,6 +242,17 @@ char *enter_text(char *txt, int maxchars)
 		putchar(' ');
 		putchar(c);
 	    }
+	} else if (c == 21)
+	{			/* CTRL-U */
+	    while (pos)
+	    {
+		pos--;
+		c='\b';
+		putchar(c);
+		putchar(' ');
+		putchar(c);
+	    }
+	    txt[0] = 0;
 	} else if ((pos < maxchars) && c >= ' ')
 	{
 	    txt[pos] = c;

--------------040204040303090305040207
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------040204040303090305040207--

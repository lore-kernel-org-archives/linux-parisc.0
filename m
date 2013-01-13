From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix comment describing setup of access rights in entry.S
Date: Sun, 13 Jan 2013 17:04:18 -0500
Message-ID: <BLU0-SMTP29306E1B582FE2A4F7F28A972F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-40--297146799"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-40--297146799
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit

This comment describes incredibly subtle code, so it should be right!

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-40--297146799
Content-Disposition: attachment; filename="entry.S.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="entry.S.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index eb7850b..7c96489 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -483,7 +483,7 @@
 	 * B <-> _PAGE_DMB (memory break)
 	 *
 	 * Then incredible subtlety: The access rights are
-	 * _PAGE_GATEWAY _PAGE_EXEC _PAGE_READ
+	 * _PAGE_GATEWAY, _PAGE_EXEC and _PAGE_WRITE
 	 * See 3-14 of the parisc 2.0 manual
 	 *
 	 * Finally, _PAGE_READ goes in the top bit of PL1 (so we
@@ -493,7 +493,7 @@
 
 	/* PAGE_USER indicates the page can be read with user privileges,
 	 * so deposit X1|11 to PL1|PL2 (remember the upper bit of PL1
-	 * contains _PAGE_READ */
+	 * contains _PAGE_READ) */
 	extrd,u,*=      \pte,_PAGE_USER_BIT+32,1,%r0
 	depdi		7,11,3,\prot
 	/* If we're a gateway page, drop PL2 back to zero for promotion

--Apple-Mail-40--297146799
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



Dave
--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-40--297146799--

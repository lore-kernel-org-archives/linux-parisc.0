From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] PARISC: fix boot failure on 32-bit systems caused by branch
 stubs placed before .text
Date: Thu, 17 May 2012 10:34:34 -0400
Message-ID: <4FB50C7A.7050409@bell.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010900040001070703090800"
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Guy Martin <gmsoft@tuxicoman.be>
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------010900040001070703090800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In certain configurations, the resulting kernel becomes too large to 
boot because
the linker places the long branch stubs for the merged .text section at 
the very start
of the image.  As a result, the initial transfer of control jumps to an 
unexpected
location.  Fix this by placing the head text in a separate section so 
the stubs for
.text are not at the start of the image.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

-- 
John David Anglin    dave.anglin@bell.net


--------------010900040001070703090800
Content-Type: text/plain; charset=windows-1252;
 name="vmlinux.lds.S.diff.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vmlinux.lds.S.diff.txt"

 arch/parisc/kernel/vmlinux.lds.S |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index fa6f2b8..64a9998 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -50,8 +50,10 @@ SECTIONS
 	. = KERNEL_BINARY_TEXT_START;
 
 	_text = .;		/* Text and read-only data */
-	.text ALIGN(16) : {
+	.head ALIGN(16) : {
 		HEAD_TEXT
+	} = 0
+	.text ALIGN(16) : {
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
@@ -65,7 +67,7 @@ SECTIONS
 		*(.fixup)
 		*(.lock.text)		/* out-of-line lock text */
 		*(.gnu.warning)
-	} = 0
+	}
 	/* End of text section */
 	_etext = .;
 

--------------010900040001070703090800--

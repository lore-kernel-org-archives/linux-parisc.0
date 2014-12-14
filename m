From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 12/18] parisc/uaccess: fix sparse errors
Date: Sun, 14 Dec 2014 18:52:47 +0200
Message-ID: <1418575877-21488-13-git-send-email-mst@redhat.com>
References: <1418575877-21488-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1418575877-21488-1-git-send-email-mst@redhat.com>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

virtio wants to read bitwise types from userspace using get_user.  At the
moment this triggers sparse errors, since the value is passed through an
integer.

Fix that up using __force.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 arch/parisc/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index a5cb070..3a20da6 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -104,7 +104,7 @@ struct exception_data {
 	    }                                           \
 	}                                               \
 							\
-	(x) = (__typeof__(*(ptr))) __gu_val;            \
+	(x) = (__force __typeof__(*(ptr))) __gu_val;            \
 	__gu_err;                                       \
 })
 
-- 
MST

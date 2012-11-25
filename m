From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: sigaltstack doesn't round ss.ss_sp as required
Date: Sun, 25 Nov 2012 16:39:00 -0500
Message-ID: <BLU0-SMTP91E4227D7FA649C74A9CB397580@phx.gbl>
References: <BLU0-SMTP216C0F402CA26A39A5EEB197590@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-5--237297514"
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP216C0F402CA26A39A5EEB197590@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-5--237297514
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 24-Nov-12, at 10:05 AM, John David Anglin wrote:

> In trying to build the debian libsigsegv2 package, I found that  
> sigaltstack
> doesn't round ss.ss_sp.  The tests intentionally pass an unaligned  
> pointer.
> This results in the two stack overflow tests failing.


The attached patch fixes this issue.

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-5--237297514
Content-Disposition: attachment; filename="signal.c.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="signal.c.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 594459b..324644d 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -188,8 +188,10 @@ get_sigframe(struct k_sigaction *ka, unsigned long sp, size_t frame_size)
 	DBG(1,"get_sigframe: ka = %#lx, sp = %#lx, frame_size = %#lx\n",
 			(unsigned long)ka, sp, frame_size);
 	
+	/* Align alternate stack and reserve 64 bytes for the signal
+	   handler's frame marker.  */
 	if ((ka->sa.sa_flags & SA_ONSTACK) != 0 && ! sas_ss_flags(sp))
-		sp = current->sas_ss_sp; /* Stacks grow up! */
+		sp = (current->sas_ss_sp + 0x7f) & ~0x3f; /* Stacks grow up! */
 
 	DBG(1,"get_sigframe: Returning sp = %#lx\n", (unsigned long)sp);
 	return (void __user *) sp; /* Stacks grow up.  Fun. */

--Apple-Mail-5--237297514
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-5--237297514--

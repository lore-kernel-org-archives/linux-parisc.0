From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Boot failure with 32bit kernel
Date: Sun, 22 Apr 2012 08:20:23 -0400
Message-ID: <BLU0-SMTP60C76C814A1780515CC0B297200@phx.gbl>
References: <20120419102608.1834003e@driller.lan>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-21-307738125"
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120419102608.1834003e@driller.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-21-307738125
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 19-Apr-12, at 4:26 AM, Guy Martin wrote:

> Hi all,
>
> I compiled a kernel with a few additional features and I was unable to
> boot it. It seems that if the entry point is not 0x00100000 in  
> vmlinux,
> the boot process fails right after "Total Memory: 2048 MB".
> This is the only common denominator I could find.
>
> I've been able to reproduce this with :
> - C3600 and J5600
> - kernel 3.2.12 and 3.3.1
> - gcc 4.5.3
> - ld 2.21 and 2.22
> - palo 1.17 and 1.18


Could you try the attached patch?  It adjusts the section arrangement so
that the long branch stubs don't appear at the start of .text.  As a  
result,
_stext and stext now are at 10100000.

The problem arises from section merging and a few branch distances
in the kernel exceeding the PA 2.0 limit.

The patch might not work if the long branch stubs don't work...

Another approach might be to add -mlong-calls to CFLAGS.  However,
these calls are less efficient.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-21-307738125
Content-Disposition: attachment; filename="vmlinux.lds.S.diff.txt"
Content-Type: text/plain; x-unix-mode=0644; name="vmlinux.lds.S.diff.txt"
Content-Transfer-Encoding: 7bit

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
 

--Apple-Mail-21-307738125--

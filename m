From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix SIGSYS signals in compat case
Date: Thu, 31 Mar 2016 12:22:32 +0200
Message-ID: <20160331102232.GA30590@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index 0448a2c..3387307 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -183,6 +183,13 @@ typedef struct compat_siginfo {
 			int _band;      /* POLL_IN, POLL_OUT, POLL_MSG */
 			int _fd;
 		} _sigpoll;
+
+		/* SIGSYS */
+		struct {
+			compat_uptr_t _call_addr; /* calling user insn */
+			int _syscall;	/* triggering system call number */
+			compat_uint_t _arch;	/* AUDIT_ARCH_* of syscall */
+		} _sigsys;
 	} _sifields;
 } compat_siginfo_t;
 
diff --git a/arch/parisc/kernel/signal32.c b/arch/parisc/kernel/signal32.c
index 984abbe..c342b2e 100644
--- a/arch/parisc/kernel/signal32.c
+++ b/arch/parisc/kernel/signal32.c
@@ -371,6 +371,11 @@ copy_siginfo_to_user32 (compat_siginfo_t __user *to, const siginfo_t *from)
 			val = (compat_int_t)from->si_int;
 			err |= __put_user(val, &to->si_int);
 			break;
+		case __SI_SYS >> 16:
+			err |= __put_user(ptr_to_compat(from->si_call_addr), &to->si_call_addr);
+			err |= __put_user(from->si_syscall, &to->si_syscall);
+			err |= __put_user(from->si_arch, &to->si_arch);
+			break;
 		}
 	}
 	return err;

From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't find a register in class 'R1_REGS' while reloading 'asm'
Date: Mon, 7 Dec 2009 22:01:14 -0500
Message-ID: <20091208030114.GA12872@hiauly1.hia.nrc.ca>
References: <20091207223548.GA4515@raptus.dandreoli.com> <20091208012627.1D22C4FE3@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AqsLC8rIMeq19msA"
Cc: linux-parisc@vger.kernel.org
To: Domenico Andreoli <cavokz@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091208012627.1D22C4FE3@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 07 Dec 2009, John David Anglin wrote:

> > is anybody able to reproduce it? configuration is attached.

With your config, I get the same error.

I have attached a potential work around.  The basic idea is to force
'a' to a specific register to avoid the spill problem in reload.
It may be a bit risky to use 'r20' but there don't appear to be
any real calls in __raw_spin_is_locked.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="spinlock.h.d"

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index fae03e1..ce87e4b 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -18,10 +18,9 @@ static inline int __raw_spin_is_locked(raw_spinlock_t *x)
 static inline void __raw_spin_lock_flags(raw_spinlock_t *x,
 					 unsigned long flags)
 {
-	volatile unsigned int *a;
+	volatile register unsigned int *a asm ("r20") = __ldcw_align(x);
 
 	mb();
-	a = __ldcw_align(x);
 	while (__ldcw(a) == 0)
 		while (*a == 0)
 			if (flags & PSW_SM_I) {

--AqsLC8rIMeq19msA--

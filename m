From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: Comments?
Date: Sun, 13 Mar 2005 12:22:13 +0000
Message-ID: <42343075.4030308@tiscali.be>
References: <200503052033.j25KXK8x007561@hiauly1.hia.nrc.ca>	<200503122337.j2CNbF3p026289@hiauly1.hia.nrc.ca>
	<20050313011921.GB28289@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050313011921.GB28289@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Randolph Chung wrote:
...
> Is this the right thing to do? Do we need something similar for
> get_user()?
> 
would you mean something like:
--- include/asm-parisc/uaccess.h.orig   2005-02-26 13:23:35.000000000 +0100
+++ include/asm-parisc/uaccess.h        2005-03-13 13:20:11.000000000 +0100
@@ -102,8 +102,9 @@
             }                                           \
         }                                               \
                                                         \
-       (x) = (__typeof__(*(ptr))) __gu_val;            \
-       __gu_err;                                       \
+        __typeof__(*(ptr)) __x = (__typeof__(*(ptr))) __gu_val;        \
+       (x) = (__typeof__((x))) (__x);                          \
+       __gu_err;                                               \
  })

  #ifdef __LP64__
====><====

> Tested on 32-bit and 64-bit (thanks Kyle!)
> 
Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

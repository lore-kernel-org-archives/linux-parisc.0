From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] _syscall0() and gettid()
Date: Sun, 26 Dec 2004 04:26:09 -0500
Message-ID: <200412260426.09042.vapier@gentoo.org>
References: <200412250217.28635.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412250217.28635.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 25 December 2004 02:17 am, Mike Frysinger wrote:
> gettid.c: In function `gettid':
> gettid.c:5: error: parse error before ')' token

ok, the error is K_INLINE_SYSCALL in asm/unistd.h in the last if statement:

         __sys_res = (long)__res;                \
     }                               \
     if ( (unsigned long)__sys_res >= (unsigned long)-4095 ){    \
-        errno = -__sys_res);                     \
+        errno = -__sys_res;                     \
         __sys_res = -1;                     \
     }                               \
     __sys_res;                          \

that assignment to errno ... the parentheses is unbalanced ... i guess it 
could just be removed altogether :)
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

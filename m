From: John David Anglin <dave.anglin@bell.net>
Subject: 2.18.34 build error:
Date: Sat, 28 May 2016 15:02:06 -0400
Message-ID: <F5B3A7D1-FFBF-4A41-8B68-7B19BBD17562@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following compile error is present in 2.18.34:

arch/parisc/kernel/ptrace.c: In function 'do_syscall_trace_enter':
arch/parisc/kernel/ptrace.c:273:2: error: implicit declaration of function 'secure_computing_strict' [-Werror=implicit-function-declaration]
  secure_computing_strict(regs->gr[20]);
  ^

It's probably present in earlier versions but was hidden by the ptrace patch which is now installed in 2.18.

Dave
--
John David Anglin	dave.anglin@bell.net




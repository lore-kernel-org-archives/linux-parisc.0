Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail16.speakeasy.net [216.254.0.216])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C51E4862
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 22:56:55 -0600 (MDT)
Date: Mon, 15 Jul 2002 22:00:31 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Cc: gcc@gcc.gnu.org
Message-ID: <20020716050031.GA641@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc-3.[02] alignment problem
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Compiling the linux kernel (2.4.19-rc1-ac5) with hppa64-linux-gcc 
(3.0.4 or 3.2) gives:

tausq@a500:~/src/linux-2.4.19-rc1/net/ipv4$ hppa64-linux-gcc -D__KERNEL__ -I/home/tausq/src/linux-2.4.19-rc1/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I /usr/lib/gcc-lib/hppa64-linux/3.0/include -DKBUILD_BASENAME=tcp_diag  -c -o tcp_diag.o tcp_diag.c
{standard input}: Assembler messages:
{standard input}:138: Error: Field not properly aligned [8] (44).
{standard input}:138: Error: Invalid operands
{standard input}:609: Error: Field not properly aligned [8] (44).
{standard input}:609: Error: Invalid operands
{standard input}:707: Error: Field not properly aligned [8] (44).
{standard input}:707: Error: Invalid operands

preprocessed source attached.

(incidentally, we also see this while building glibc...)

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

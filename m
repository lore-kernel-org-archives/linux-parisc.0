From: Simone Mannori <simone.mannori@gmail.com>
Subject: Kernel for bug hunting
Date: Fri, 15 Apr 2016 07:04:17 +0200
Message-ID: <CACrbsaA0-h9VYXCcQ8x9C++K-kSFSPiBAHye_Jr=urpASfHe=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dear All,

I'm using Debian 8.0 (linux-parisc) on a c8000 and I would like to
recompile the Linux kernel for debugging purposes, hoping to find and
fix the "[radeon] and [nouveau] passive frame buffer mode".

Q1: Which version you suggest? Stable /devevelopment / GIT ?

Q2: Where I can find it? (www.kernel.org ?)

Q3: Which GCC version? (4.x ? 5.x ?)

Q4: As ".config default", you suggest the Debian 8.0 one or you have a
better new one?

You have already suuggested me few [radeon] source files where put my
nose and what debugging tools I should use (printk). My actual problem
is to find the right kernel/gcc version (I've tried several
combinations, but the compilation stops with errors).

Thanks in advance for your help.

   Simone Mannori - ITALY

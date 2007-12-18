From: "Jan Beulich" <jbeulich@novell.com>
Subject: __ex_table writable on parisc?
Date: Tue, 18 Dec 2007 16:17:08 +0000
Message-ID: <47680094.76E4.0078.0@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: <linux-parisc@vger.kernel.org>
To: <grundler@parisc-linux.org>, <kyle@parisc-linux.org>,
	<matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In an attempt to move as much common code into include/asm-generic/vmlinux.lds.h
I found that parisc puts __ex_table into writeable data - is there any real
need to this? My intention was to make this part of RODATA...

Thanks, Jan


Return-Path: <varenet@esiee.fr>
Received: from viefep18-int.chello.at (viefep18-int.chello.at [213.46.255.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4743C482C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 14:54:27 -0700 (MST)
Date: Sun, 28 Mar 2004 23:54:27 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] spinlock align code triggering bug in gcc?
Message-Id: <20040328235427.30c32ba7.varenet@esiee.fr>
In-Reply-To: <20040328203211.GK750@tausq.org>
References: <20040328203211.GK750@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave@hiauly1.hia.nrc.ca, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, 28 Mar 2004 12:32:11 -0800
"Randolph Chung" <randolph@tausq.org> wrote:

> 
> can someone check this against other versions of gcc? i cannot reach
> gcc-bugzilla right now...
> 

[varenet@npyu ~]% hppa64-linux-gcc -O2 -c foo.c
[varenet@npyu ~]% ls foo*
foo.c foo.o
[varenet@npyu ~]% hppa64-linux-gcc -v
Reading specs from
/usr/local/palinux/lib/gcc-lib/hppa64-linux/3.0.4/specs Configured with:
/Users/varenet/palinux/xc/src/gcc/configure
--host=powerpc-apple-darwin6.1 --build=powerpc-apple-darwin6.1
--target=hppa64-linux --disable-shared --disable-nls
--enable-languages=c --prefix=/usr/local/palinux Thread model: single
gcc version 3.0.4

Good old 3.0.4 seems pretty reliable ;)

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/

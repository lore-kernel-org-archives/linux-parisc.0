From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] [PATCH] C99 cleanup in kernel/sysctl.c
Date: Sat, 25 Oct 2003 09:01:48 -0700
Message-ID: <20031025160148.GC24406__7361.76536088369$1416622907$gmane$org@tausq.org>
References: <20031025155107.GA2718@artsapartment.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@parisc-linux.org, Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-kernel@vger.kernel.org
To: Art Haas <ahaas@airmail.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031025155107.GA2718@artsapartment.org>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Looking at the file kernel/sysctl.c I saw this HP-PA specfic block of
> code. Here's an untested patch to format the code with C99 named
> initializers.

hm.. this is already in our 2.6 tree, except the old version was there
also, so we have two copies of the same sysctl.. oops :)

i've removed the redundant ones.

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

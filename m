Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47EF94840
	for <parisc-linux@parisc-linux.org>; Wed, 26 Nov 2003 08:39:41 -0700 (MST)
Date: Wed, 26 Nov 2003 07:42:13 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.3.2 - 64bit failled to build?
Message-ID: <20031126154213.GO975@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3FB2652500007F03@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FB2652500007F03@ocpmta2.freegates.net>
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

> ../src/configure --target=hppa64-linux --host=hppa-linux --prefix=/opt/parisc
> --disable-shared --disable-nls --without-libc --enable-langages=c

try this:
../gcc-3.3/configure --host=hppa-linux --build=hppa-linux --target=hppa64-linux --disable-shared --disable-nls --enable-languages=c --prefix=/opt/palinux --enable-sjlj-exceptions --disable-threads

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09BCC489B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  5 Feb 2004 10:54:09 -0700 (MST)
Date: Thu, 5 Feb 2004 12:31:22 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 jejb
Message-ID: <20040205203122.GP959@tausq.org>
References: <20040204182455.1CC11494191@palinux.hppa>
	<40153061000092CC@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40153061000092CC@ocpmta1.freegates.net>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Joel, can you try the kernel at http://www.tausq.org/joel/vmlinux ? It
boots on my c3k and bame's b2k. If it works for you then pls check the 
config in the same directory and see if you can figure out which 
option is causing the crash.....

btw, I assume you are building with gcc-3.0.4?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

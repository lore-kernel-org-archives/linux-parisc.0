Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 205234829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 11:44:42 -0600 (MDT)
Date: Tue, 6 May 2003 10:40:39 -0700
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
Message-ID: <20030506174039.GC23465@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3EB7766A000003D3@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3EB7766A000003D3@ocpmta7.freegates.net>
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

> Very clear now, but not easy to implement:
> - which name to give to such a macro
> - where to implement it:

well, in this case you don't need it... i just mention it for the case
where this is needed. Here, you really can just unconditioanlly
compare against (void *)SIG_foo

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

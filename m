Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 608A94840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 08:14:13 -0700 (MST)
Date: Sun, 26 Oct 2003 07:16:38 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] gcc-hppa64 failled to install on my c110
Message-ID: <20031026151638.GJ24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3F9BD4DA.6020906@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F9BD4DA.6020906@tiscali.be>
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

> What do I wrong?
> And gcc-hppa64_3.2.3-0.1_hppa.deb isn't anymore in  unofficial-debs, 
> what do i miss?

hm.. i  guess nobody regenerated the Packages.gz file after the deb got
removed.... there were some problems with that gcc deb so i removed it
quite some time ago.

i've been testing gcc-3.3 based compilers for hppa64-linux, but they
don't seem to build working kernels. still need to investigate.

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0934482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 00:20:53 -0600 (MDT)
Date: Wed, 6 Aug 2003 23:02:49 -0700
From: Randolph Chung <randolph@tausq.org>
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem: linux-2.6.0-test-pa6 and ssh
Message-ID: <20030807060249.GB4979@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3F31CF22.9080706@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F31CF22.9080706@hrzpub.tu-darmstadt.de>
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

> booting the 2.6.0-test2-pa6 kernel works quite right, but when I try to 
> login via ssh I get the following error after entering the password: 
> "Server refused to allocate pty".
> With a 2.4-kernel and latest 2.5-kernel it worked alright.
> I using devfs and debian unstable on my 715/100.
> Has anyone an idea how to get ssh to work?

hm.. it seems to work for me... can you try running sshd in debug 
mode (sshd -ddd, output goes to syslog) and see if that tells you more 
about what's happening?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

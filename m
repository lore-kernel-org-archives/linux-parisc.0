Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BA444829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Dec 2002 12:42:10 -0700 (MST)
Date: Mon, 2 Dec 2002 11:46:36 -0800
From: Randolph Chung <randolph@tausq.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] syscall
Message-ID: <20021202194636.GM19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <CB813811CBF6D3118DCC00902740BB4A0BAF3E6F@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CB813811CBF6D3118DCC00902740BB4A0BAF3E6F@xsp01.brazil.hp.com>
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

> How I manually make a syscall passing the index?

Look at glibc/sysdeps/unix/sysv/linux/hppa/sysdep.c

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

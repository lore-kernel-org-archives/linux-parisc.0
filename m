Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C50F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 09:18:39 -0600 (MDT)
Date: Mon, 2 Sep 2002 08:21:37 -0700
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
Message-ID: <20020902152137.GG25710@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3D3815BD0000A54B@ocpmta5.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3815BD0000A54B@ocpmta5.be.tiscali.com>
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

> I would like to use gcc-3.2 to compile the latest cvs kernel. HOWTO do this?

edit the toplevel kernel Makefile and change the HOSTCC and CC lines 
so that HOSTCC=gcc-3.2 and CC=$(CROSS_COMPILE)gcc-3.2

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

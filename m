Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9717F482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 08:55:24 -0700 (MST)
Date: Mon, 17 Mar 2003 07:52:35 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FC driver?
Message-ID: <20030317155235.GN26139@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030317111801.GF17073@lug-owl.de> <3E68A12A00002A77@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E68A12A00002A77@ocpmta3.freegates.net>
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

> >So your device is called "PCI_DEVICE_ID_HP_TACHYON". Searching for this
> >string, you'll find it in ./linux/drivers/scsi/cpqfcTSinit.c, so that
> >card seems to be supported.

well....

this is the "right" driver, but it doesn't work on parisc. Grant has
poked at it a little bit but afaik it still doesn't work. The driver is
not that well written either, so that doesn't help either :(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

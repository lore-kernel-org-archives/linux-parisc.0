Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36B24482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 09:55:57 -0700 (MST)
Date: Mon, 10 Feb 2003 07:59:48 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pty.c & gcc-3.2 workaround?
Message-ID: <20030210155948.GS11363@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E476CFE0000078D@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E476CFE0000078D@ocpmta3.freegates.net>
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

> Is this work-around could be safely remove now? (I just test it on 2.4.20-pa26
> 32bit UP as well as on a 2.4.21-pre4-pa23 of mine and seems to works fine)

i think we should leave it in for now, since some people (?) are still
running woody/testing which doesn't have the new gcc-3.2 yet. we can
phase that out in a few months i guess.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

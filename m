Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8496482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Nov 2001 05:16:52 -0700 (MST)
Received: from old@istop (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with SMTP id 3920817014
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Nov 2001 07:17:20 -0500 (EST)
Message-Id: <3.0.5.32.20011105071636.0191f530@mail.magma.ca>
Date: Mon, 05 Nov 2001 07:16:36 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Booting C200
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

OK, I found some stuff in the archive on the "Chassis Codes" and set up an
old laptop as a terminal, disconnected the keyboard (and mouse) and booted.
Now I tried this with the disk out of my 712/60 and the C200 is not hung.
It proceeds through the boot process and then hangs on starting cron.

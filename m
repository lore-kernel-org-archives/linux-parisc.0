Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id JAA00638
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 09:11:21 -0500
Received: (from neufeld@localhost)
	by caliban.physics.utoronto.ca (8.9.2/8.8.8) id JAA18643
	for hppa-linux@thepuffingroup.com; Mon, 22 Mar 1999 09:11:15 -0500 (EST)
Date: Mon, 22 Mar 1999 09:11:15 -0500 (EST)
From: Christopher Neufeld <neufeld@physics.utoronto.ca>
Message-Id: <199903221411.JAA18643@caliban.physics.utoronto.ca>
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Picky details of TLB fault handlers
List-ID: <linux-parisc.vger.kernel.org>

   Here's a question probably best suited for the folks at HP. The
PA-RISC 2.0 documentation says that a (software) TLB miss fault handler
cannot use virtual addressing. OK, what constitutes an exit from the
handler? Can you use virtual addressing after the last modification the
handler makes to the TLB (perhaps after executing several instructions
which don't require virtual addressing to load the pipeline), or do you
have to execute an explicit return from interrupt?


-- 
 Christopher Neufeld                   neufeld@physics.utoronto.ca
 Home page:  http://caliban.physics.utoronto.ca/neufeld/Intro.html
 "Don't edit reality for the sake of simplicity"

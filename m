Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2B32482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 May 2002 09:36:42 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g4GFaeFN016204
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 May 2002 11:36:40 -0400 (EDT)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) id g4GFadsu016202
	for parisc-linux@lists.parisc-linux.org; Thu, 16 May 2002 11:36:39 -0400 (EDT)
Message-Id: <200205161536.g4GFadsu016202@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 16 May 2002 11:36:38 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] config.guess default for parisc64
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

The config.guess default for parisc64 seems wrong to me.  The current
default is hppa64-unknown-linux-gnu.  With gcc, this results in a
64bit compiler being built.  However, there isn't a 64bit userland :-(

Under hpux11, the default on a "wide" 64bit machine is hppa2.0w-hp-hpux11*.
This configuration results in a 32bit native compiler which is what
most people want.  If you want a 64bit compiler, you have to explicitly
specify the host/target as hppa64.

At the moment, it is not possible to switch from 32bit to 64bit with
a compiler runtime option.  I know this is possible on sparc but I
believe there have been issues with libraries.  Thus, I don't think
a single gcc compiler for parisc64 is likely in the near term.

I imagine this was discussed before but I think we would be better
off with hppa2.0w-unknown-linux-gnu as the default.  This would
indicate a 32bit PA 2.0 architecture running on a 64bit wide kernel.

What do people think?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

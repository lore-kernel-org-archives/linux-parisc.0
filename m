Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A0124829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 10:40:50 -0600 (MDT)
Date: Mon, 2 Sep 2002 09:44:24 -0700
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
Message-ID: <20020902164424.GE14634@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020902152137.GG25710@tausq.org> <3D3815BD0000A8AE@ocpmta5.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3815BD0000A8AE@ocpmta5.be.tiscali.com>
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

> Oops the 32bits kernel which I obtain, boot well on my b2k but ip connection
> problem is always there: the system seems to loop somewhere with ssh (heart
> bit seems life and no more response neither at serial console, neither at
> ssh prompt) and telnet causes an HPMC (bus timeout?)

looking up the iaoq and gr02 values reported in the hpmc in System.map 
would be the first step...

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

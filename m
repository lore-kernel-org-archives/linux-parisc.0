Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zouave.sonic.net (zouave.sonic.net [209.204.172.153])
	by dsl2.external.hp.com (Postfix) with ESMTP id D409A4877
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 12:06:32 -0600 (MDT)
Received: from frizzen.efball.com (frizzen.efball.com [192.168.0.27])
	by zouave.sonic.net (Postfix) with ESMTP id EB46866E1
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 11:06:31 -0700 (PDT)
Date: Fri, 21 Jun 2002 11:06:30 -0700
From: E Frank Ball <frankb@efball.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] my find... (and a plea for advice)
Message-ID: <20020621110630.A12946@zouave.sonic.net>
Reply-To: frankb@efball.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

} > The other day, I stumbled on to an HP 745 machine.  Figuring I could 
} > do "something" with it, and having the urge to dive into playing with a RISC 
} > box(and another linux machine), I stumbled on to your community here.
} 
} What types of monitors have you connected to the box?
} A good multi-sync should do... anything that can handle 1280x1024.

The 745s have a 4 switch DIP switch on the motherboard.  Switches 2 and
3 are used to set the video resolution.

Switch 2 | Switch 3  |    Video Mode
-------------------------------------------
  DOWN   |   DOWN    | 1024x768 @ 72 Hz
  DOWN   |    UP     | 1280x1024 @ 72 Hz
   UP    |   DOWN    | 1024x768 @ 60 Hz
   UP    |    UP     |  Will Not Boot


-- 

   E Frank Ball                frankb@efball.com

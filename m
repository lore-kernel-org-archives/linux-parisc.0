Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from doorslam.net (port-212-202-169-196.reverse.qdsl-home.de [212.202.169.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0EF624830
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Sep 2003 02:50:57 -0600 (MDT)
Date: Fri, 12 Sep 2003 10:50:45 +0200
From: Paul Weissmann <paul@doorslam.net>
To: northern snowfall <dbailey27@ameritech.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 3BNC Monitor + HIL Keyboard
Message-ID: <20030912085045.GD28970@blinder.doorslam.net>
Reply-To: paul@doorslam.net
References: <3F617541.8010209@ameritech.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F617541.8010209@ameritech.net>
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

northern snowfall [dbailey27@ameritech.net] wrote:
> Hi, all
> 
>    I recently bought a PA-RISC 1.1 Apollo 9000/735 workstation
> from UMich dispo. I couldn't pass up on the low low price ;-).
> However, I'm stuck in Graphics mode because I do not have access
> to the 3BNC Monitor or a HIL keyboard to get access to the PROM.

pulling the framebuffer out of the sgc-slot should result in console 
on the first serial-port.


        - paul

-- 
   zwei jaeger treffen sich. beide tot.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-4.cisco.com (sj-msg-core-4.cisco.com [171.71.163.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D26B482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Feb 2003 02:50:46 -0700 (MST)
Date: Sat, 1 Feb 2003 01:50:12 -0800
From: Christian Suder <csuder@cisco.com>
To: Christian Suder <csuder@cisco.com>
Cc: adam.sk@groovy.ffloth.com, parisc-linux@lists.parisc-linux.org
Subject: Correction Re: [parisc-linux] Tried to Install Debian 3r1 on C110, C180 and 2 712/60, no luck.
Message-Id: <20030201015012.0daca042.csuder@cisco.com>
In-Reply-To: <3E3B94EE.9010303@cisco.com>
References: <002d01c2c9aa$37400140$b601a8c0@pepp>
	<3E3B94EE.9010303@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Correction : the EG does show up as a fb device, and the correct spelling
would have been "built" in this case... ;-) 

	C. 


On Sat, 01 Feb 2003 01:35:42 -0800
Christian Suder <csuder@cisco.com> wrote:

> 
> Hi Adam,
> 
> no kidding, I am/have been running it on a C110, C180 and 712.... ;-) 
> Although the 712 is a /80 not a /60, and that was before the official 
> woody release. But the C110 and C180 were both installed from the same 
> release CD. No problems with either one, but the C180 does have a 
> visualize in it, the build in EG is not supported.
> 
> Regarding the keyboard disconnect/reconnect - that would only be needed 
> for HIL keyboards, AFAIK. I used whatever PS/2 keyboard and mouse I had 
> sitting around and that worked.
> 
> 	Christian
> 
> 
> 
> Adam Skaffloth wrote:
> > Hi !
> > 
> > I wonder if someone could give me a help in the right direction.
> > I have a C110, a C180 and 2 712/60.
> > C110 would boot fine until you get to the first menu, then the
> > keyboard would be out.
> > I have tried the previous tricks about disconnect/reconnect the
> > keyboard, but to no use.
> > The Visualize-EG in C180 seems not be working, seen threads about
> > that, so installed the Visualize-24 card from the C110 on the C180 and
> > get the same result.
> > Is this problem only related to the install or if I install using
> > serial console would it be a head-less machine = no use ?
> > 
> > I also read that their are no trouble with installing on 712/60.
> > I got 2, one with the second LAN/Serial Card (So I can use it as a
> > FW). Bot are starting but are hanging after the message:
> > 
> > The Installation Program is determining the current state
> > of your system and the next installation step that should
> >  be performed.
> > 
> > It hangs there forever on both boxes.
> > 
> > Anyone succeded with a install of Debian 3 on the above HW that could
> > give me a hand,
> > I am giving PA Risc a chance until I need to put the Sparc and the
> > Intel back into the plans.
> > 
> > / Adam
> > 
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 

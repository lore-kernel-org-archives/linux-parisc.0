Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id 067004829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Feb 2003 15:03:35 -0700 (MST)
Message-ID: <20030201220333.28997.qmail@web12507.mail.yahoo.com>
Date: Sat, 1 Feb 2003 14:03:33 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Tried to Install Debian 3r1 on C110, C180 and 2 712/60, no luck.
To: Christian Suder <csuder@cisco.com>, adam.sk@groovy.ffloth.com
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E3B94EE.9010303@cisco.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1371559043-1044137013=:28425"
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

--0-1371559043-1044137013=:28425
Content-Type: text/plain; charset=us-ascii


I was using the built in graphics interface in my C180 before I sold it including using X on it.
derek
 Christian Suder <csuder@cisco.com> wrote:
Hi Adam,

no kidding, I am/have been running it on a C110, C180 and 712.... ;-) 
Although the 712 is a /80 not a /60, and that was before the official 
woody release. But the C110 and C180 were both installed from the same 
release CD. No problems with either one, but the C180 does have a 
visualize in it, the build in EG is not supported.

Regarding the keyboard disconnect/reconnect - that would only be needed 
for HIL keyboards, AFAIK. I used whatever PS/2 keyboard and mouse I had 
sitting around and that worked.

Christian



Adam Skaffloth wrote:
> Hi !
> 
> I wonder if someone could give me a help in the right direction.
> I have a C110, a C180 and 2 712/60.
> C110 would boot fine until you get to the first menu, then the keyboard
> would be out.
> I have tried the previous tricks about disconnect/reconnect the keyboard,
> but to no use.
> The Visualize-EG in C180 seems not be working, seen threads about that,
> so installed the Visualize-24 card from the C110 on the C180 and get the
> same result.
> Is this problem only related to the install or if I install using serial
> console would it be a head-less machine = no use ?
> 
> I also read that their are no trouble with installing on 712/60.
> I got 2, one with the second LAN/Serial Card (So I can use it as a FW).
> Bot are starting but are hanging after the message:
> 
> The Installation Program is determining the current state
> of your system and the next installation step that should
> be performed.
> 
> It hangs there forever on both boxes.
> 
> Anyone succeded with a install of Debian 3 on the above HW that could give
> me a hand,
> I am giving PA Risc a chance until I need to put the Sparc and the Intel
> back into the plans.
> 
> / Adam
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-1371559043-1044137013=:28425
Content-Type: text/html; charset=us-ascii

<P>I was using the built in graphics interface in my C180 before I sold it including using X on it.
<P>derek
<P>&nbsp;<B><I>Christian Suder &lt;csuder@cisco.com&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><BR>Hi Adam,<BR><BR>no kidding, I am/have been running it on a C110, C180 and 712.... ;-) <BR>Although the 712 is a /80 not a /60, and that was before the official <BR>woody release. But the C110 and C180 were both installed from the same <BR>release CD. No problems with either one, but the C180 does have a <BR>visualize in it, the build in EG is not supported.<BR><BR>Regarding the keyboard disconnect/reconnect - that would only be needed <BR>for HIL keyboards, AFAIK. I used whatever PS/2 keyboard and mouse I had <BR>sitting around and that worked.<BR><BR>Christian<BR><BR><BR><BR>Adam Skaffloth wrote:<BR>&gt; Hi !<BR>&gt; <BR>&gt; I wonder if someone could give me a help in the right direction.<BR>&gt; I have a C110, a C180 and 2 712/60.<BR>&gt; C110 would boot fine until you get to the first menu, then the keyboard<BR>&gt; would be out.<BR>&gt; I have tried the previous tricks about disconnect/reconnect the keyboard,<BR>&gt; but to no use.<BR>&gt; The Visualize-EG in C180 seems not be working, seen threads about that,<BR>&gt; so installed the Visualize-24 card from the C110 on the C180 and get the<BR>&gt; same result.<BR>&gt; Is this problem only related to the install or if I install using serial<BR>&gt; console would it be a head-less machine = no use ?<BR>&gt; <BR>&gt; I also read that their are no trouble with installing on 712/60.<BR>&gt; I got 2, one with the second LAN/Serial Card (So I can use it as a FW).<BR>&gt; Bot are starting but are hanging after the message:<BR>&gt; <BR>&gt; The Installation Program is determining the current state<BR>&gt; of your system and the next installation step that should<BR>&gt; be performed.<BR>&gt; <BR>&gt; It hangs there forever on both boxes.<BR>&gt; <BR>&gt; Anyone succeded with a install of Debian 3 on the above HW that could give<BR>&gt; me a hand,<BR>&gt; I am giving PA Risc a chance until I need to put the Sparc and the Intel<BR>&gt; back into the plans.<BR>&gt; <BR>&gt; / Adam<BR>&gt; <BR>&gt; <BR>&gt; _______________________________________________<BR>&gt; parisc-linux mailing list<BR>&gt; parisc-linux@lists.parisc-linux.org<BR>&gt; http://lists.parisc-linux.org/mailman/listinfo/parisc-linux<BR><BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-1371559043-1044137013=:28425--

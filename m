Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp015.mail.yahoo.com (smtp015.mail.yahoo.com [216.136.173.59])
	by dsl2.external.hp.com (Postfix) with SMTP id 96AF8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 08:33:43 -0700 (MST)
Message-ID: <3CADB0AD.1050307@yahoo.com>
Date: Fri, 05 Apr 2002 15:11:57 +0100
From: Jbit <james_a_n_lee@yahoo.com>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Missing beep... and music too
References: <Pine.LNX.4.33.0204042038090.29216-100000@bob.ncssm.edu> <20020405055415.C6C54482B@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

 > 712/80i was one of the few systems that was sold w/o Floating Pointing
 > coprocessor (or FP was disabled) at a lower price point. I believe
 > parisc-linux kernel ignores the lies that PDC presents about the FP
 > not being present. But I'm wondering if something is really
 > disabled on the chip that causes FP to just not work.  I don't know
 > if our FP emulation will deal with a completely missing FP Unit.


My 80i plays mp3s (via mpg123) beutifly.. without FPU emulation..
(but i had lots of problems getting it to work in debian, works a treat under lfs ;)
I just always assumed debian compiled it weirdly... hrm...
Or it could be that when i compiled mpg123 i didn't put any FPU code in (needed a bit of hacking to compile)
I'll investigate.. see what happend...


BTW... Everybodys aware that the internal speaker is connected to the LASI Harmony chip, yeah?
(Theres no way to generate a beep in hardware, you'd need to make a driver that generated a PCM beep and sent it to the hardware)
At least AFAIK

--jbit



_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com

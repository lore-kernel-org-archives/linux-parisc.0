Return-Path: <cbeerse@lycos.nl>
Received: from lmfilto02.st1.spray.net (lmfilto02.st1.spray.net
	[212.78.202.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 872724838
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Apr 2004 05:00:59 -0600 (MDT)
Message-ID: <407FBCB1.1030601@lycos.nl>
Date: Fri, 16 Apr 2004 13:00:01 +0200
From: =?ISO-8859-1?Q?Corn=E9_Beerse?= <cbeerse@lycos.nl>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] B1000/C3000
References: <200404140944.LAA01567@xenon.pc.Uni-Koeln.DE>
	<200404142102.41913.deller@gmx.de>
In-Reply-To: <200404142102.41913.deller@gmx.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Ulrich Deiters <ukd@xenon.pc.Uni-Koeln.DE>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Helge Deller wrote:

> On Wednesday 14 April 2004 11:44, Ulrich Deiters wrote:
> 
>>I just wanted to install parisc-linux 3.0r2 on a HP C3000, 
>>using an external serial terminal. The installation went more 
>>or less smoothly, but the X server does not come up.
>>
>>The kdm log says "no screens found".
>>
>>I note that there is no X*screens file in /etc/kde2/kdm, but I do 
>>not know whether this is normal or not - this is my first Debian 
>>installation.
>>
>>What must I do to get my X server running? Or is it hopeless, 
>>because the HP graphics card (FX2) is not supported?
> 
> 
> FX2 is not supported, but since you install via serial terminal,
> you could still run a X Server on your local PC-machine (e.g. via Xnest)
> and display there what you would see on the PA-machine.
> 
That gave me the next idea:
Use Xvnc (the core of vnc from http://www.realvnc.com/) as the default Xserver. 
Then you have both a text console (the terminal or whatever) and a local display 
(be it that it is not hardware accelerated). Now you 'only' need a vncviewer at 
your desktop to use the graphical 'console'.

Be noted that the Xvnc fron DebianWoody crashes on my HP-D370...


CBee

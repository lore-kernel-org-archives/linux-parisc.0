Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5800F483D
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 13:02:45 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000/C3000
Date: Wed, 14 Apr 2004 21:02:41 +0200
References: <200404140944.LAA01567@xenon.pc.Uni-Koeln.DE>
In-Reply-To: <200404140944.LAA01567@xenon.pc.Uni-Koeln.DE>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200404142102.41913.deller@gmx.de>
Cc: Ulrich Deiters <ukd@xenon.pc.Uni-Koeln.DE>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wednesday 14 April 2004 11:44, Ulrich Deiters wrote:
> I just wanted to install parisc-linux 3.0r2 on a HP C3000, 
> using an external serial terminal. The installation went more 
> or less smoothly, but the X server does not come up.
> 
> The kdm log says "no screens found".
> 
> I note that there is no X*screens file in /etc/kde2/kdm, but I do 
> not know whether this is normal or not - this is my first Debian 
> installation.
> 
> What must I do to get my X server running? Or is it hopeless, 
> because the HP graphics card (FX2) is not supported?

FX2 is not supported, but since you install via serial terminal,
you could still run a X Server on your local PC-machine (e.g. via Xnest)
and display there what you would see on the PA-machine.

Helge

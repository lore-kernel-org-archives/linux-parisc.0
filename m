From: Meelis Roos <mroos@linux.ee>
Subject: Re: INEQUIVALENT ALIASES in 3.11-rc3
Date: Thu, 1 Aug 2013 12:28:03 +0300 (EEST)
Message-ID: <alpine.SOC.1.00.1308011226170.14037@math.ut.ee>
References: <alpine.SOC.1.00.1307310003070.19136@math.ut.ee> <51F8DC7B.9090504@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51F8DC7B.9090504@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I tried 3.11-rc3 yesterday on my RP3440. It works, but has acquired a 
> > new warning during Gentoo emerge cycle:
> > [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
> > [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
> > [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
> > [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
> > [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file conftest
> > [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
> > [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
> > [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
> > [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
> > [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file conftest
> > 
> > There is no file named conftest present after emerge, so it must have 
> > been some temporary program.
> 
> Those warnings are uncritical - but you should update binutils.
> See: http://permalink.gmane.org/gmane.linux.ports.parisc/3834

I did a full deep emerge update on Gentoo taht also installed binutils 
2.23.1. I will look for further messages when there is something new to 
upgrade - during the same upgrade, it got messages about locale-archive.

-- 
Meelis Roos (mroos@linux.ee)

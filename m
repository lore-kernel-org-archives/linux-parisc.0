From: Randolph Chung <randolph@tausq.org>
Subject: Re: missing compat_sys_ptrace conversions for mips and parisc
Date: Mon, 18 Aug 2008 09:42:53 +0800
Message-ID: <48A8D39D.3070005@tausq.org>
References: <20080817022924.GA23625@lst.de> <48A8081A.4080609@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48A8081A.4080609@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I could take care of this for parisc. Just looked into the code and it 
> seems it could cleanup the code nicely as well.
> 
> But I don't want to step on Kyle's toe, since I assume he prepares the 
> asm-parisc/ move in the parisc-2.6 git tree during the next days.

Whoever does this change, I would appreciate if you could run a gdb 
testsuite before and after and compare the results.

You can just build the debian package. I believe it runs the testsuite 
by default. (although i see from buildd.d.o that the latest version is 
FTBFS because of some header issues?)

thanks
randolph

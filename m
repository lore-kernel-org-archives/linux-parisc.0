Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jbit <james_a_n_lee@yahoo.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 712 Software Temperature 
In-Reply-To: Message from Jbit <james_a_n_lee@yahoo.com>
   of "Thu, 21 Feb 2002 11:51:46 GMT." <3C74DF52.7090308@yahoo.com>
References: <3C74DF52.7090308@yahoo.com> 
Date: Sat, 23 Feb 2002 00:41:28 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020223074128.1B3234865@dsl2.external.hp.com>
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

Jbit wrote:
...
> Since, if it was purley for fan control, it would be done in hardware,
> wouldn't it?

Caveat: I'm a SW engineer and this is from memory.

The fan speed is *generally* controlled by HW with PDC just setting
the "ramp" in HW registers. Some servers might "expose" the
temperature reading. I doubt the 712 does.

grant

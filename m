Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 567644841
	for <parisc-linux@parisc-linux.org>; Sat,  8 Nov 2003 08:57:47 -0700 (MST)
Date: Sat, 8 Nov 2003 10:52:47 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was: do_page_fault?]
Message-ID: <20031108155247.GC21080@systemhalted>
References: <3F969FFE00005DB3@ocpmta2.freegates.net> <3FACE5A4.7070003@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FACE5A4.7070003@tiscali.be>
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

On Sat, Nov 08, 2003 at 12:46:28PM +0000, Joel Soete wrote:
> More and more strange behaviour:
> 
> after my weekly apt-get dist-upgrade i relaunch evolution,
> it hang again at the same point with usual message:
> evolution (pid 2999): Protection id trap (code 27)
> [..]
> 
> But if I launch it a second time no more pb???
> 
> Very strange isn't it?

Not at all! Anything is possible with some imagination :)
If it's repeatable then we can catch it. Stick evolution under gdb and
remember to preload a debugging libc and catch it when it crashes. Send
the 'bt full' back to the list for analysis.

c.

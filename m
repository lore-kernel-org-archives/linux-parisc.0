Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEA19482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Jul 2002 11:49:33 -0600 (MDT)
Date: Fri, 26 Jul 2002 10:49:31 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: robert klough <bobklough@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] graphics console only displays the penguin
In-Reply-To: <F7044EomUPAmj10OcX80000c0e0@hotmail.com>
Message-ID: <Pine.LNX.4.44.0207261045180.2211-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 26 Jul 2002, robert klough wrote:

> Hi,
> 
> I've tried installing the latest iso available online (the entire 400MB 
> one), 9.3 I think, through serial console. It worked very well, but now I 
> would like to pass it now on a monitor. But all what I get when I boot is 
> the penguin logo on the top left corner and a blinking cursor. However I see 
> no displayed text at all (the serial console is still available)
> 
> I've been advised to uncomment the line containing ttyS0 in the 
> /etc/inittab, but this line is already uncommented (without the #).
Uncomment (or add) a line for tty0 instead.  If you want to see the linux
boot stuff on the monitor, you need to set the console in palo (not sure
the exact syntax for that).  

My inittab contains these relevant lines (I have all 6 vt's on the 
monitor)

1:2345:respawn:/sbin/getty 38400 tty1
2:23:respawn:/sbin/getty 38400 tty2
3:23:respawn:/sbin/getty 38400 tty3
4:23:respawn:/sbin/getty 38400 tty4
5:23:respawn:/sbin/getty 38400 tty5
6:23:respawn:/sbin/getty 38400 tty6

T0:23:respawn:/sbin/getty -L ttyS0 9600 vt102


-- 
If Karl, instead of writing a lot about Capital, had made a lot of Capital,
it would have been much better.
		-- Karl Marx's Mother

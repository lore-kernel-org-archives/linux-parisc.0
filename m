From: Keven Tipping <bytelogix@shaw.ca>
Subject: [parisc-linux] Console Kernel Panic
Date: Mon, 19 Dec 2005 20:50:18 -0700
Message-ID: <ce7b5dcee759.cee759ce7b5d@shaw.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Greetings to all!

I am currently running Kernel version 2.6.15-rc6-pa1.

This problem, however, is evident in 2.6.14.3-pa0, and 2.6.15-rc5-pa5, as well as 2.6.12.2 (Gentoo 2005 LiveCD). Problem remains regardless of SMP or Uniprocessor kernels.

On the K Class (it appears it is limited to these machines?), if nothing is currently running on the ttyB0 Serial Console, if you press any key, the system burps up the following:

Kernel Panic: Kernel Fault
Not Syncing...

What I mean by "nothing running" is if Agetty is NOT running, NOR is Bash. 

This "Gap" where nothing is running, is most evident when you quit Bash (mycomp# exit), and before Agetty has respawned for a login. Inbetween these two events, if any input is sent on the keyboard, the system panics and dies.

I'm not sure what the problem is- maybe related to the MUX driver somehow? Afaik only ttyB0 serial consoles are effected.

Cheers!
Keven Tipping

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

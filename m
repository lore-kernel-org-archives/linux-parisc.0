From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] b180_defconfig 2.6.9-pa1 keyboard support?
Date: Sat, 23 Oct 2004 22:57:16 -0600
Message-ID: <20041024045716.GA4263@colo.lackof.org>
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

Hi,
I just tried the prebuilt 2.6.9-pa1 kernel for B180
and the keyboard didn't work:

http://cvs.parisc-linux.org/download/linux-2.6/autobuild/b180_defconfig/palinux-b180-defconfig-2.6.9-pa1_0-2_all.deb

I didn't see any console output for keyboard/HID output like
I did for PS/2 mouse.  Is this a known bug or is something
wrong with the default config file?

Sorry, this is with gfx console and I couldn't grab the dmesg output.
Networking didn't come up and I didn't have time (machine went home with
the 13y old owner) to fixup the networking. I know the keyboard worked
fine with the 2.6.6 kernel that was already on the machine.

It was kinda frustrating to replace the kernel in order to pick up
harmony audio driver fixes and then have something like keyboard
not work.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

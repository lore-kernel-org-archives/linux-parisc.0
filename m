From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: [parisc-linux] Problems in getting X-Windows to run on HP Visualize
 785/B2000
 with rebuilt 2.6.12-rc6-pa1 kernel and Matrox Millennum II
Date: Thu, 16 Jun 2005 14:40:36 +0800
Message-ID: <5.1.1.6.1.20050616141324.02a2d920__8589.91692443869$1416623803$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
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

Yesterday I reported that I have set up successfully a Matrox Millennum II 
PCI video card on an HPPA RISC B2000 workstation and was able to connect an 
HP910 to the Matrox Millennum video port running it as a text console.

I tried today to install and configure X Windows and am encountering 
problems. I installed, upgraded and configured the X Windows package (not 
by selecting Debian Software selection's "Desktop Environment" selection 
but selecting X Windows package using Aptitute from the "Manual Selection" 
in the same menu).

I configured X according to the hardware I have and made sure it would boot 
up on Init State 2 and rebooted the B2000 with the Matrox Millennum II card 
inside. It hung after displayed the login prompt and followed almost 
immediately by "Backtrace:" (with no more output)!

I then removed the Matrox Millennum II card and rebooted again. It was 
successful this time with the same configuration files!

Any suggestion on where I should "shoot" next (next actions)?

Rgds,
Lee

ps. Last few lines of boot messages captured with the Matrox Millennum II 
card. If you need the full boot messages for both the boot with and without 
the Matrox Millennum II card pls let me know. I will send them as 
attachment to you.

Starting portmap daemon: portmap.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Thu Jun 16 13:48:27 SGT 2005

Initializing random number generator...done.
Setting up X server socket directory /tmp/.X11-unix...done.
Setting up ICE socket directory /tmp/.ICE-unix...done.

INIT: Entering runlevel: 2

Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting portmap daemon: portmap.
Starting internet superserver: inetd.
Setting up X font server socket directory /tmp/.font-unix...done.
Starting X font server: xfs.
Starting X-TT font server: xfs-xtt.
Starting Xprint servers: Xprt.
Starting file alteration monitor: FAM.
Starting periodic command scheduler: cron.
Starting WINGs display manager: wdm.
Not starting X display manager (xdm); it is not the default display manager.

Debian GNU/Linux 3.1 DebianHPPA.example.com ttyS0

DebianHPPA.example.com login:

Backtrace:



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

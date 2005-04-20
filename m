From: Anders <dizzey@ing.umu.se>
Subject: [parisc-linux] k-class and j3514A (tulip dual 100mbit tulip)
Date: Wed, 20 Apr 2005 16:38:50 +0200
Message-ID: <20050420143849.GB30984@ing.umu.se>
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

now im back and have almost everything working in my k460.
except the tulip dual 100mbit dino card.
i have tried the card with linux-2.6.9-bk6-pa7 and linux-2.6.12-rc2-pa3
with the same results it finds the card fine

Linux Tulip driver version 1.1.13 (December 15, 2004)
tulip0:  MII transceiver #1 config 3100 status 7849 advertising 01e1.
eth1: Digital DS21140 Tulip rev 34 at 80000080, 00:30:6E:27:99:EC, IRQ 
20.
tulip1:  MII transceiver #1 config 3100 status 786b advertising 01e1.
eth2: Digital DS21140 Tulip rev 34 at 80000100, 00:30:6E:27:99:ED, IRQ 
21.

but when i try to ping something it gives me
Dino 0xf1000000: stuck interrupt 2
Dino 0xf1000000: stuck interrupt 6

and then 

NETDEV WATCHDOG: eth0: transmit timed out
NETDEV WATCHDOG: eth0: transmit timed out
NETDEV WATCHDOG: eth0: transmit timed out

i can use the  mii-tool to change link status and have veriffied that it 
works on the switch that im using.

i have tried it as a module and in kernel and i have tried every 
combination of the options for  "DECchip Tulip (dc2114x) PCI support"
in menuconfig but it dosent make any diffrence i have tried placing the 
card in other slots in the system to.

here is a complete dmesg with linux-2.6.12-rc2-pa3

http://www.ing.umu.se/~dizzey/dmesg_k460.log 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

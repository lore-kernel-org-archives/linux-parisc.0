From: Bartlomiej Ochman <fback@fback.net>
Subject: [parisc-linux] [newbie] Where to start from?
Date: Wed, 01 Sep 2004 15:23:47 +0200
Message-ID: <4135CD63.9040507@fback.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc <parisc-linux@lists.parisc-linux.org>
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

Hello.

For some time now, I installed debian/testing on some spare C200+.
I didn't have much time to play around with it until now. Recently I 
discovered, it hangs completly, without any message, under heavy disc 
load (eg. bzip2 -cd kernel-source-2.6.8.tar.bz | tar xf -, or apt-get 
upgrade cycle).

As I am not familiar with hppa architecture, where should I start to 
snoop from? I've tried both 2.4.x and 2.6.x kernels, both stock and 
custom compiled and they both behave the same way.

TIA,
BO
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

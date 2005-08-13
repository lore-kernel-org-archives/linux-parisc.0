From: Schelstraete Bart <Bart.SCHELSTRAETE@dhl.com>
Subject: [parisc-linux] 712/60 LAN not working after kernel update to 2.6
Date: Sat, 13 Aug 2005 16:08:59 +0100
Message-ID: <1123945739.42fe0d0bae677@cyrus.bru-hub.dhl.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux <parisc-linux@parisc-linux.org>
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

Hello ,

As a lot of hppa users - I guess- I'm using an older 712/60 workstation.
In the past I installed Debian hppa on it , and it worked fine with the
2.4 kernel series.
Now, a few days ago  I finally upgraded the box to kernel 2.6, and the
machine boots. Which is already a start :)

But, after the kernel upgrade, the builtin network card doesn't work
anymore.

After doing an ifup it's complaining that he couldn't find the device:
'eth0: ERROR while getting interface flangs: No such device'


When I check the devices in the box , I can see that the kernel found
the network card:

--
Found devices:
..
4.  Gecko Core LAN (802.3) at 0xf0107000
--

Can somebody help me with this issue?


Bart

























--
DHL Aviation Webmail 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Wed, 07 Dec 2005 20:16:17 +0100
Message-ID: <43973501.5080005@broadpark.no>
References: <43971676.1010009@gmail.com>
	<20051207180130.GB11417@colo.lackof.org> <43972408.1020708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Fabio Bizzi <fbizzi@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <43972408.1020708@gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Fabio wrote (repeatedly ;-)
 > Hi Everybody!   :)
 >
 > Yesterday I've got a monitor and I've connected it to my C200.
 > At the boot I've selectet 1280x1024 at 75Hz VESA and the screen is
 > correctly displayed.
 > The Graphic adapter is an HCRX-24 (A4071B) on GSC.
 > The distribution is a Sarge with etch kernel 2.6.12-1
 > The system boots correctly, but no one consolle is displayed on the
 > monitor only a blank screen (no other problems), I've checked inittab
 > and it's ok with all the consoles started!
 > Here some DMESG output:
 >
 > Kernel command line: root=/dev/sda5 HOME=/ console=tty0 sti=8/4
 > sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux
 >
 > 14. Coral SGC Graphics at 0xf8000000 [10/8] { 10, 0x0, 0x004, 0x00077}
 >
 > STI GSC/PCI core graphics driver Version 0.9a
 >      id 2bcb015a-9a02587, conforms to spec rev. 8.04
 > STI init_graph failed (ret -1, errno 258)
 > sti: probe of 10:8 failed with error 1
 >

First things first - this ain't really a Coral SGC at all. Its a
Hyperbowl card (HCRX-24/A4071B). The lazy ***s in the HP graphics
hardware group reused the card identifiers!

The "init_graph failed" is worrying - that same card with the same id
is successfully detected and initialized in my B132L, and I'm pretty
sure the same was true in my C180 (kernel 2.6.11-rc1-pa4).

 > I've also tried to change boot args in palo from sti=8/4 to sti=10/0
 > but it didin't worked!

That ought to be sti=10/8 according to your dmesg. But as Grant said, it
shouldn't strictly be needed as long as there's just the one card in the 
box.

 > At Parisc-Linux Hardware Database is reported that Coral SGC Graphics 
 > is supported and the version is the same "0x0,0x4,0x77"
 > (http://hwdb.parisc-linux.org/view.php?
 >       type=padevice&name=Coral%20SGC%20Graphics)

Ignore this - believe me, you don't have a Coral SGC.

 > Thanks!!!
 >
 > P.S. I've experienced some mail server problems, i'm sorry for
 > eventual duouble posts!

I sent Helge Deller an A4071B a while back so he could work on the
stifb driver when he had time. I guess he hasn't had time.

I'm gonna try a couple of tests on the B132L this evening - first
thing is to make the Hyperbowl the console and see what happens.

-Andy
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
Subject: [parisc-linux] what null modem cable to use for B2600?
Date: Wed, 24 Nov 2004 15:18:42 +0100
Message-ID: <s1a4a671.027@MAIL.ZRT.NL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: <parisc-linux@lists.parisc-linux.org>
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

I've recently acquired a B2600 in a garage-sale. The seller was selling
lots of stuff acquired from a company gone broke, and clearly didn't 
know what he had ('But what can you do with this thing?').

It seems in good order, according to the little lcd-screen on the
front
it boots fine, eventually showing a hearbeat.
This screen also informs me the console is SER_1, which I take it is
the
first serial port. A monitor gets a sync signal (about 80 KHz) but no
display. I have no usb keyboard here, so I can't test that.

I know how a serial console should work (plug in the cable, start
minicom
with 9600 8N1 settings, and off you go). Unfortunately, this doesn't
work,
possibly due to my ill luck with rs232 cables. I've got a long history
if not working rs232 cables.

If I look at
http://www.lammertbies.nl/comm/info/nl_RS-232_null_modem.html
(in Dutch, unfortunately for you) I see different types of null-modem
cables.

- no handshaking, 3 wires
- loopback handshaking, 3 wires
- partial handshaking, 7 wires
- full handshaking, 7 wires

What cable would be advisable? I'm really looking forward to getting
linux
running on this thing - it's a lot more acceptable noise-wise than the
old
C200 I used to have, even if it has 4 fans on the front, one on the cpu
and
one in the powersupply.

Thanks,
Jurriaan
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

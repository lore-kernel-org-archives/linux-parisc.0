Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA10397
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 May 1999 16:31:51 -0600
Sender: mkp@socsci.auc.dk
To: parisc-linux@thepuffingroup.com
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 12 May 1999 00:31:45 +0200
Message-ID: <yq1vhdz9r1q.fsf@jaguar.socsci.auc.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] A180 Ignition Howto
List-ID: <linux-parisc.vger.kernel.org>


Alex asked me to post this...

My A180 arrived a couple of days ago.

Just like any other HP box there are loads of HP-UX docs but no
information on the hardware at all. Grrr. HP. When will you ever
learn?

The A180 has a builtin webconsole. On the back of the system unit
there are two RJ45 connectors. One of them is regular ethernet
(DEC2114x btw. Should be piece of cake to get running) and the other
is for the webconsole.

According to the docs on HP's website the system should autodetect
whether to use serial port or web as console. I was unable to get my
HP 70096 serial console running, though. Then I discovered a jumper on
the motherboard which could allegedly force it in either mode. I tried
moving it to serial with no avail.

Oh, well. Bugger. Then I decided to try out the webconsole. The
interface defaults to 192.0.0.192. Clickety-clik. *Blam* the Java
stuff in the webconsole nuked my Netscape. Grumble.

Ok. Then I tried connecting from a Windows-box. Much better. The web
interface appeared in the browser and I was able to configure IP and
access control for the web console.

I rebooted the web console and presto: I could configure HP-UX and
regular networking.

Phew.

I'm a bit annoyed about the serial console stuff. I'll try hooking up
a different terminal tomorrow.

-- 
Martin Kasper Petersen			BOFH, IC1&2, Aalborg University, DK
mailto:mkp@SunSITE.auc.dk		http://SunSITE.auc.dk/~mkp/

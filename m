Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id E678148BF
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Dec 2003 09:32:52 -0700 (MST)
Date: Tue, 23 Dec 2003 17:32:50 +0100
Message-ID: <3FB26525000187A7@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] serial 2 broken in 2.6.0 for b180?
To: "James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>>On Mon, 2003-12-22 at 10:29, Joel Soete wrote:
>> I just got a small problem with my 2.6.0 teting b180: no mean to use the
>> second serial port.
>
>It works just fine on my B180...I use one serial for the console and the
>other to communicate with my ADSL router.
>
>I suspect you may have a hardware or cable problem.
Hi Jame,

I trust you miss:
"(i reboot with 2.4.20-pa35 and it's working, so it exclude hw pb)"
(to be more accurate, I would mean that I reboot the b180 runing 2.6 with

2.4 without any other changes)

Anyway your comment help me to find out my pb:

To be absolutely sure I reboot it twice the system:
one with 2.4 and re-test minicom which works ok
second with 2.6 and just noticed more that at boot console:
[...]

Starting portmap daemon: portmap.
Loading the saved-state of the serial devices...
Trying to free nonexistent resource <fff83800-fff83807>

/dev/ttyS0 at 0x0000 (irq = 90) is a 16550A
/dev/ttyS1 at 0xfff83800 (irq = 106) is a 16550A

[...]

and so 'exit 0' the setserial startup script.

reboot again with 2.6 and now minicom works also fine :)

Thanks a lot and hth,
    Joel

PS: I will try to check (after end year holidays) what could be wrong with
setserial?





-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44605489F
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 08:56:28 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 1A2XXf-0006p7-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 16:56:27 +0200
Date: Thu, 25 Sep 2003 16:56:26 +0200
Message-ID: <3F5CC41F00008D27@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] N Class SMP pb ?  (follow up)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

Trying to continue investigation, I puted a printk at the begining of handle_interruption()
to get just the interruption's 'code' managed.

As already mentionned in previous mail that I could read many 6, 15 (but
it seems to be normal: e
en in UP kernel those interruption occurs) but
(most interesting) it is the very first time that I got the message making
failled the kernel:
[...]
handle_interruption(26, ...).
SMP CALL FUNCTION TIMED OUT (CPU=1)
handle_interruption(26, ...).



    Stack dump:

[...]

(unfortunately I couldn't grab this dump :( )

Could this be a pb with sync between cpu time ref? (because timeout = jiffies
+ HZ)

I have also a look for where this function is called but never see its return
code tested to launch a 'stack dump' and a stop of system?

Thanks in advance for help,
    Joel

PS: I don't know if it is important but the two cpus on this server are located
in slot 1 and 3 (not in slot 1 and 2 as we would logicaly expect) 



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 

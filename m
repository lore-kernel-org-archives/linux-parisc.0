Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server.pyrenet.fr (server.pyrenet.fr [194.250.190.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63D26482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 07:42:28 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by localhost.pyrenet.fr (Postfix) with ESMTP id 2244722ED7
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 15:42:27 +0200 (MET DST)
Received: from server.pyrenet.fr ([127.0.0.1])
 by localhost (server [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
 id 19228-03 for <parisc-linux@lists.parisc-linux.org>;
 Sun, 15 Jun 2003 15:42:05 +0200 (MET DST)
Received: from tyrann (numeris158.pyrenet.fr [194.250.190.158])
	by server.pyrenet.fr (Postfix) with ESMTP id 394BC22EA1
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 15:42:05 +0200 (MET DST)
Received: from ehuiban by tyrann with local (Exim 3.35 #1 (Debian))
	id 19RXnb-0000LH-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 15:43:59 +0200
Content-Type: text/plain;
  charset="iso-8859-1"
From: Eric Huiban <grompf@grompf.net>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 15 Jun 2003 15:43:59 +0200
MIME-Version: 1.0
Message-Id: <E19RXnb-0000LH-00@tyrann>
Subject: [parisc-linux] Serial port problem.
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

I just need to install an 'old' modem (USR Sportster V34) on a freshly 
installed HP 9000/730. Using minicom i only managed to communicate
with the modem up to 19200bps. I'm using ttyS0 as backup console port and 
ttyS1 as modem port.

here is the content of my serial.conf generated during the debian 
installation :

###PORT STATE GENERATED USING AUTOSAVE-ONCE###
###AUTOSAVE-ONCE###
###AUTOSAVE###
#
[snip : comments]
/dev/ttyS0 uart 16550A port 0x0000 irq 90 baud_base 454545 spd_vhi
/dev/ttyS1 uart 16550A port 0x0000 irq 89 baud_base 454545 spd_vhi

Is there something specific to the HP 9000 computers , or just a little 
something i missed somewhere ?

Thant you all !

Eric Huiban, aka Grompf.

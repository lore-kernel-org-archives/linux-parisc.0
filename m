Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E0E34A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Mar 2001 05:54:05 -0700 (MST)
Message-ID: <000701c0ac86$3972e4c0$0801a8c0@esiee.fr>
From: "Thomas Marteau" <marteaut@esiee.fr>
To: <arete@libero.it>
Cc: "parisc" <parisc-linux@lists.parisc-linux.org>
References: <GA6TJU$IaZLB7wOrtVXBGyjT2hK7uorzlGL5zwaTQyqBLYKP@libero.it>
Subject: Re: [parisc-linux] esiee root not work
Date: Wed, 14 Mar 2001 13:56:44 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi,

        this message told you that your /dev/console is not linked to our
choice of console. I think that our root FS is built with the idea that you
will use the sti-console!

If you use the serial port, you must change /dev/console
-- this is STI conf

demo@b132:~$ ls -l /dev/console
lrwxrwxrwx    1 root     root            4 Jan 29  1970 /dev/console -> tty0

-- this is SERIAL conf
demo@b132:~$ ls -l /dev/console
lrwxrwxrwx    1 root     root           10 Mar 14 13:42 /dev/console ->
/dev/ttyS0

Do NOT forget to modify the inittab file!

# Format:
#  <id>:<runlevels>:<action>:<process>
1:2345:respawn:/sbin/getty 38400 tty1        <------ Here for STI
#2:2345:respawn:/sbin/getty 38400 tty2
#3:23:respawn:/sbin/getty 38400 tty3
#4:23:respawn:/sbin/getty 38400 tty4
#5:23:respawn:/sbin/getty 38400 tty5
#6:23:respawn:/sbin/getty 38400 tty6

# Example how to put a getty on a serial line (for a terminal)
#
T0:23:respawn:/sbin/getty -L ttyS0 9600 vt100      <------ Here for SERIAL
#T1:23:respawn:/sbin/getty -L ttyS1 9600 vt100

# Example how to put a getty on a modem line.
#
#T3:23:respawn:/sbin/mgetty -x0 -s 57600 ttyS3

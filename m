Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.planb.de (aldebaran.planb.de [212.227.14.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B775482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Feb 2002 05:08:54 -0700 (MST)
Date: Thu, 7 Feb 2002 13:08:52 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020207130852.C3306@electra.intern.planb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
From: Enrik Berkhan <Enrik.Berkhan@planb.de>
Subject: [parisc-linux] serial baud_base, high baud rates and divisors
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

Hi,

when using a 720 (running linux, of course ;-) as serial console
for a 715(old) I've noticed that the terminal (720) produces garbage
when the 715 comes to the firmware prompt (both running at 115200).
This is not a flow control or something problem. Investigating on
that I've found some oddities concerning setserial, baud_base and
the divisor calculation in the serial driver ...

- by default all parisc serial devices' baud_base is set to 454545
  (derived from the LASI UART crystal's frequency). The actual divisor
  is calculated in change_speed() of serial.c to be

  quot = baud_base / baud;

  with all integers. Thus, 454545 / 115200 = 3. The resulting baud
  rate should be something like 454545 / 3 = 151515. That's somewhat
  far away from 115200, explaining the garbage.

- I've made a simple measurement of the actual baud rate using a DMM
  with builtin frequency counter: set the port to 8N1 and outputting
  0x55 continously should produce a square wave of half the baud rate
  frequency at the transmit pin. So I've verified that at least the
  720 seems to have a real baud_base of 460800 (the measured frequency
  was 57.6kHz for a divisor of 4).

- trying to change the baud_base using setserial to 460800 failed with
  EADDRINUSE. I've found the reason to be a loop in set_serial_info():

        /* Make sure address is not already in use */
        if (new_serial.type) {
                for (i = 0 ; i < NR_PORTS; i++)
                        if ((state != &rs_table[i]) &&
                            (rs_table[i].port == new_port) &&
                            rs_table[i].type)
                                return -EADDRINUSE;
        }

  Memory mapped parisc ports all have port == 0, so this has to fail.
  Temporary workaround: `setserial /dev/ttyS1 port 0x10000 ...' once
  will prevent the above loop from finding conflicts.

So, the following things have to be fixed:

- get/set_serial_info have to be enhanced for memory mapped ports
- setserial should be enhanced accordingly
- divisor calculation should be changed at least to round to nearest,
  not round towards zero, or LASI ports might still suffer from the first
  problem _if_ they really have baud_base 454545
- baud_base should be initialized correctly for other gsc based ports.

If someone can confirm my analysis and tell me the direction of how to
fix these things I would be willing to work on it (shouldn't be hard,
maybe boring ;-).

Enrik
-- 
Enrik Berkhan                                         plan b. GmbH
                                                      Rüppurrer Straße 4
+49-721-388582 (voice)                                76137 Karlsruhe
+49-721-388581 (fax)                                  Germany

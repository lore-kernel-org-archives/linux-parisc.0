Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE037482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Apr 2002 11:16:18 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by interzone.ucc.ie (8.9.3/8.9.3) with ESMTP id SAA27221
	for <parisc-linux@lists.parisc-linux.org>; Tue, 9 Apr 2002 18:17:38 +0100 (BST)
Date: Tue, 9 Apr 2002 18:15:52 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0204091813530.26756-200000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-275789367-1000145800-1018372552=:26756"
Subject: [parisc-linux] some bugs
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---275789367-1000145800-1018372552=:26756
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

I just played a little with my C240 (serial console and X11 forwarding),
and decided to install a 64bit kernel just for fun (and to help you
testing them). I know that 64bit doesn't make sense at all (at least
not in the near future, since there is no 64bit userland support and I guess
not many applications would profit from it even if there was one).
Needless to say that I'm running a 32bit kernel again ;)


on all 2.4.x kernels tested so far
==================================
- the 32bit kernel shipped with the 0.9.3 iso (IIRC 2.4.9)
- 2.4.18-pa4-32bit
- 2.4.18-pa5-32bit
- 2.4.18-pa14-32bit
- 2.4.18-pa14-64bit

I've seen following issues:

- leds don't seem to work (i.e. no heartbeat or other leds on or blinking - or
  is my hp really so idle ?)
  This is just with the latest 2.4.18-pa14 kernels (2.4.18-pa5-32bit worked,
  but IIRC not perfectly)

- 100Mbit is not supported properly (full-duplex support is always
  recognized, but 100Mbit just occationally).
  Of course it's a full 10/100Mbit SWITCH (no hub), and I checked the cables
  Moreover I just have 100Mbit network devices plugged into the switch.

- the 'poweroff' command doesn't work, it just shutdowns the machine, but does
  no real poweroff. (AFAIK 'poweroff' is a synonym for 'shutdown -p now', isn't
  it ? this doesn't work either).
  The powerkey works as expected (including powering off the workstation)
  with 32bit kernels.



for kernel 2.4.18-pa14-64bit (32bit PDC):
========================================
- if fs type "auto" is set for a ext3 partition, the kernel detects the /, but
  the mount command (in the bootscript) fails to detect the fstype. Setting the
  fstype entry in /etc/fstab to "ext3" or "ext2" fixes the problem.
  Since 'mount -a' fails to detect the fs type, it won't remount /
  in read-write mode, and thus the system won't boot correctly.

  But "auto" in /etc/fstab works with the corresponding 32bit kernel

- crashme is effective (example settings, after a few minutes kernel crashed,
  even MagicSysRq didn't work. It didn't seem to 'work' on 2.4.18-pa5-32bit,
  I didn't try with the 2.4.18-pa14-32bit kernel)

- once I got a kernel oops at interrupt_stack() at boot up (attached to mail),
  but eveything seemed to work. I didn't get any more kernel oops.

- shutdown&poweroff when hitting powerkey does not work (it just switches off
  the workstation immediately; it works properly on the corresponding 32bit
  kernel and 2.4.18-pa5-32bit)

- if I compile in support for STIcon/STIfb, it doesn't switch the output
  to the console (after the 'branching to kernel entry point' message).
  At least I waited for quite some time, and I didn't seem to go on.
  I didn't compile in support for STIcon/STIfb for the 32bit kernel,
  therefore I can't tell whether there is the same problem or not.
  STIcon/STIfb works with 2.4.18-pa5-32bit. Well, my FX/2 card isn't supported
  for fb, but at least the kernel doesn't hang with that kernel.



some things that work on both 32/64bit kernel (2.4.8-pa14), probably not worth
to mention:

- tmpfs, ext3, ext2, iso9660
- harmony audio
- serial console, MagicSysRq over serial console
- of course scsi, ethernet and running 32bit applications
- ventilators ;)


N.B. I didn't try the latest modutils, in which the pa8000 cpu issue is fixed.
therefore I didn't compile any modules
BTW, i use the tulip driver for ethernet. Is it also possible (and safe)
to use the generic DEC driver ?

greetings max

---275789367-1000145800-1018372552=:26756
Content-Type: TEXT/plain; name="dmesg-tail.txt"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0204091815520.26756@sal.ucc.ie>
Content-Description: tail of dmesg
Content-Disposition: attachment; filename="dmesg-tail.txt"

RVhUMyBGUyAyLjQtMC45LjE3LCAxMCBKYW4gMjAwMiBvbiBzZCg4LDIpLCBp
bnRlcm5hbCBqb3VybmFsDQpFWFQzLWZzOiBtb3VudGVkIGZpbGVzeXN0ZW0g
d2l0aCBvcmRlcmVkIGRhdGEgbW9kZS4NCmV0aDA6IFNldHRpbmcgZnVsbC1k
dXBsZXggYmFzZWQgb24gTUlJIzEgbGluayBwYXJ0bmVyIGNhcGFiaWxpdHkg
b2YgNDFlMS4NCmV0aDA6IG5vIElQdjYgcm91dGVycyBwcmVzZW50DQoNCiAg
ICAgWVpydldFU1RITE5YQkNWTWNiY2JjYmNiT0dGUlFQREkNClBTVzogMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAgTm90IHRhaW50ZWQNCnIw
MC0wMyAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDQwMDZmZmY4IDAwMDAw
MDAwNDA0MjUyZDcgMDAwMDAwMDA0MDBhNTYyOA0KcjA0LTA3ICAwMDAwMDAw
MDQwNDM1OGJjIDAwMDAwMDAwMDAwMDEyMDAgMDAwMDAwMDAwMDAyOWYwMCAw
MDAwMDAwMDNjNmVmMzVmDQpyMDgtMTEgIDAwMDAwMDAwMDAwNTQwMjAgMDAw
MDAwMDAwZmZmZmZmZiAwMDAwMDAwMDAwMDUxYzE4IDAwMDAwMDAwMDAwMjg2
NzgNCnIxMi0xNSAgMDAwMDAwMDAwMDAyOWU3OCAwMDAwMDAwMDAwMDJkMDMw
IDAwMDAwMDAwZmFmMDEzOTAgMDAwMDAwMDAwMDAxNzAwMA0KcjE2LTE5ICAw
MDAwMDAwMDAwMDI4Njc4IDAwMDAwMDAwMDAwMjg2NzggMDAwMDAwMDAwMDAw
MjAwMCAwMDAwMDAwMDQwMjA1YjUwDQpyMjAtMjMgIDAwMDAwMDAwMDAwMDAw
MDQgMDAwMDAwMDA0MDE4OTYzNCAwMDAwMDAwMDQwNDI1MmI4IDAwMDAwMDAw
MDAwMDA1ZTUNCnIyNC0yNyAgMDAwMDAwMDAwMDAwMTIwMCAwMDAwMDAwMDAw
MDI5ZjAwIDAwMDAwMDAwMDAwMDAwMDUgMDAwMDAwMDAwMDAyODY3OA0KcjI4
LTMxICBmZmZmZmZmZmZmZmZmZmYwIDAwMDAwMDAwMDAwMDFmZmYgMDAwMDAw
MDBmYWYwMjZjMCAwMDAwMDAwMDQwMTg5NjNmDQpzcjAtMyAgIDAwMDAwMDAw
MDAwMDAzODAgMDAwMDAwMDAwMDAwMDM4MCAwMDAwMDAwMDAwMDAwMDAwIDAw
MDAwMDAwMDAwMDAzODANCnNyNC03ICAgMDAwMDAwMDAwMDAwMDM4MCAwMDAw
MDAwMDAwMDAwMzgwIDAwMDAwMDAwMDAwMDAzODAgMDAwMDAwMDAwMDAwMDM4
MA0KDQpJQVNROiAwMDAwMDAwMDAwMDAwMzgwIDAwMDAwMDAwMDAwMDAzODAg
SUFPUTogMDAwMDAwMDA0MDA1MWE2ZiAwMDAwMDAwMDQwMDUxYTczDQogSUlS
OiAzYWY2NDc5NyAgICBJU1I6IDAwMDAwMDAwMDAwMDAzODAgIElPUjogMDAw
MDAwMDA0MDQzYzA2Nw0KIENQVTogICAgICAgIDAgICBDUjMwOiAwMDAwMDAw
MDJjZWQwMDAwIENSMzE6IDAwMDAwMDAwMTA2MTAwMDANCiBPUklHX1IyODog
MDAwMDAwMDAwMDAyYWU3OA0KDQogICAgIFlacnZXRVNUSExOWEJDVk1jYmNi
Y2JjYk9HRlJRUERJDQpQU1c6IDAwMDAwMDAwMDAwMDAxMDAxMTExMDExMTAw
MDAxMTExIE5vdCB0YWludGVkDQpyMDAtMDMgIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMTYwNWRkMiAwMDAwMDAwMDQwMDRjZThmIDAwMDAwMDAwMDAw
NTI3MjANCnIwNC0wNyAgMDAwMDAwMDAwMDA1MGMxNCAwMDAwMDAwMDAwMDAw
MDAyIDAwMDAwMDAwMDAwNTBjMTQgMDAwMDAwMDAwMDAwMDAxNg0KcjA4LTEx
ICAwMDAwMDAwMDAwMDRkZjU2IDAwMDAwMDAyMDE2MDNhZDAgMDAwMDAwMDAw
MDAwMDAwOSAwMDAwMDAwMDAwMDMxMWYwDQpyMTItMTUgIDAwMDAwMDAwMDAw
MDAwMjQgMDAwMDAwMDAwMDAwMDAwMiAwMDAwMDAwMDAwMDRlN2UwIDAwMDAw
MDAwMDE1ZmI2MzQNCnIxNi0xOSAgMDAwMDAwMDAwMDAyODY3OCAwMDAwMDAw
MDAwMDI4Njc4IDAwMDAwMDAwMDE1ZWE3ODggMDAwMDAwMDA0MDA2ZmZmOA0K
cjIwLTIzICAwMDAwMDAwMDAwMDBiNzQ4IDAwMDAwMDAwZmZmZWU5MWIgMDAw
MDAwMDAwMDAxYWI2MCAwMDAwMDAwMDAwMDUxMDE0DQpyMjQtMjcgIDAwMDAw
MDAwMDAwNTBjMTQgMDAwMDAwMDAwMDAwMDAwMSAwMDAwMDAwMDAwMDRmMzEw
IDAwMDAwMDAwMDAwMjg2NzgNCnIyOC0zMSAgMDAwMDAwMDAwMDAwMDAwMyAw
MDAwMDAwMDAwMDI1YTIyIDAwMDAwMDAwZmFmMDI3YzAgMDAwMDAwMDAwMDAw
MDAxMA0Kc3IwLTMgICAwMDAwMDAwMDAwMDAwNDAwIDAwMDAwMDAwMDAwMDA0
MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwNDAwDQpzcjQtNyAg
IDAwMDAwMDAwMDAwMDA0MDAgMDAwMDAwMDAwMDAwMDQwMCAwMDAwMDAwMDAw
MDAwNDAwIDAwMDAwMDAwMDAwMDA0MDANCg0KSUFTUTogMDAwMDAwMDAwMDAw
MDQwMCAwMDAwMDAwMDAwMDAwNDAwIElBT1E6IDAwMDAwMDAwNDAwNGJlOGYg
MDAwMDAwMDA0MDA0YmU5Mw0KIElJUjogZDJkNjFlNmMgICAgSVNSOiAwMDAw
MDAwMDAwMDAwNDAwICBJT1I6IDAwMDAwMDAwNDA0M2EwNjYNCiBDUFU6ICAg
ICAgICAwICAgQ1IzMDogMDAwMDAwMDAyY2VkMDAwMCBDUjMxOiAwMDAwMDAw
MDEwNjEwMDAwDQogT1JJR19SMjg6IDAwMDAwMDAwMDAwMmFlNzgNCg==
---275789367-1000145800-1018372552=:26756--

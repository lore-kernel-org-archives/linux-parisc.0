From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] Noise from hil_kbd?
Date: Tue, 22 Mar 2005 22:39:23 +0000
Message-ID: <20050322223923.GA21777@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

I just got the following when testing HIL:

1986u10:~# modprobe hil_kbd
1986u10:~# HIL KEYB: HIL keyboard found (did = 0xdf, lang = english.us)
input: HIL keyboard, ID: 223
hil_kbd: probe of serio4 failed with error -5
hil_kbd: probe of serio5 failed with error -5
hil_kbd: probe of serio6 failed with error -5
hil_kbd: probe of serio7 failed with error -5
hil_kbd: probe of serio8 failed with error -5
hil_kbd: probe of serio9 failed with error -5
hil_kbd: probe of serio10 failed with error -5
hil_kbd: probe of serio11 failed with error -5
hil_kbd: probe of serio12 failed with error -5
hil_kbd: probe of serio13 failed with error -5
hil_kbd: probe of serio14 failed with error -5
hil_kbd: probe of serio15 failed with error -5
hil_kbd: probe of serio16 failed with error -5
hil_kbd: probe of serio17 failed with error -5

1986u10:~#

The HIL keyboard worked fine, though.  Has anyone else seen this?  I'm
guessing it's related to the recent input layer changes.  I can't see
where the messages are coming from... it's not hil_kbd.c :-(

Also, rmmod hil_kbd hangs, but other processes carry on running okay,
and the HIL mouse still works.

Thanks,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

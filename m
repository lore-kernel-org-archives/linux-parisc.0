Return-Path: <aftli@optonline.net>
Received: from mta15.srv.hcvlny.cv.net (mta15.srv.hcvlny.cv.net
	[167.206.5.109])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E936484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 15 Jan 2004 19:34:24 -0700 (MST)
Received: from localhost.localdomain
	(ool-18baeb61.dyn.optonline.net [24.186.235.97]) by
	mta15.srv.hcvlny.cv.net
	(iPlanet Messaging Server 5.2 HotFix 1.16 (built May 14 2003))
	with SMTP id <0HRK007C39TBFK@mta15.srv.hcvlny.cv.net> for
	parisc-linux@lists.parisc-linux.org;
	Thu, 15 Jan 2004 21:34:23 -0500 (EST)
Date: Thu, 15 Jan 2004 21:34:23 -0500
From: Brett Gmoser <aftli@optonline.net>
To: parisc-linux@lists.parisc-linux.org
Message-id: <20040115213423.565692ec.aftli@optonline.net>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Raw I/O Problems with inb()
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello everybody.

I apologize if this is off topic, but I have seen relevant information posted to this list.  And believe me, I have searched everywhere else for a solution to this problem.

To give some short background information, I am programming the Linux client for a project that basically counts a users keystrokes, and sends the amount to a server which displays the count for all the world to see.  Teams and individuals compete from around the world, and we are approaching 5000 members.

At any rate, the application is written in C/C++.  I am using iopl() for permissions management, and inb() for reading raw data directly from the PS/2 keyboard to test if a key has been pressed.  All of this works great, and the program is complete, except for one problem.

It seems that on Athlon XP systems using PS/2 mice, inb(0x64) always says there is data waiting from the keyboard, when it is in fact mouse data.  I assume that different architecture on AMD systems is the cause of the problem, but is there a solution?  There must be.  Here is a snipped of the code I am using currently.  I apologize for the sloppiness of it - it's been modified about 30 times with 30 different solutions to the problem, all of which did not seem to fix it.  Commented out are solutions that I have tried and have not worked.

#define KEYBOARD_PORT 0x60
#define KEYBOARD_STATUS_PORT 0x64

bool keycounter::count(/*wplog* l*/) { // some very simple code to see if a key is being pressed or not.
  const unsigned char kbd_read_mask = 0x01;
  unsigned char status = inb_p(KEYBOARD_STATUS_PORT);
  /* unsigned char status = inb(KEYBOARD_STATUS_PORT);

  /* mouse data? */
//  if (status == 20 && ((status & kbd_read_mask) != 0x01) || (status & 0x21)) { fflush(0); return false; }
//  if(status & kbd_read_mask & 0x20) { fflush(0); return false; }
//  if(!(status & kbd_read_mask & 0x01)) { fflush(0); return false; }
//  if(!((inb(0x379) & 0x20) == 0x20)) { fflush(0); return false; }

  if(status!=20) { fflush(0); return false; }
  unsigned char c = inb(KEYBOARD_PORT);
  if(status==20 && c < TABLE_SIZE) {
    if(c==lastc) {
      fflush(0);
      return false;
    }
    lastc=c;
    fflush(0);
    return true;
  }
  else {   // key has been lifted
    lastc=0;
    fflush(0);
    return false;
  }
}

Thanks in advance for any insight you all may be able to give me!

-- 
Brett Gmoser
aftli@optonline.net

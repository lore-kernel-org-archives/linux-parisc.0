From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Working pci vis-eg in c3k,
	problem solution elucidated...
Date: Mon, 17 Jan 2005 12:03:08 -0500
Message-ID: <20050117170307.GC1281@baldric.uwo.ca>
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


pa,

The following fixed my problems:

a. Boot box.
b. Stop at firmware.
c. Issue 'co' to enter configuration.
d. Issue 'mo <video hardware path> 12' to dispalbe VESA and
   doublebuffer.

Then boot the box. The sticonsole still seems squished but the colours
are right and gdm seems to load. I don't have a keyboard or mouse yet so 
I can't test it fully. Though it looks pretty.

I'll do some more research.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

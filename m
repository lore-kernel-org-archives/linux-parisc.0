Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F548482A
	for <parisc-linux@parisc-linux.org>; Sat, 19 May 2001 22:23:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 151Kjq-0000Wh-00
	for parisc-linux@parisc-linux.org; Sun, 20 May 2001 05:22:42 +0100
Date: Sun, 20 May 2001 05:22:42 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010520052242.L23718@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] elf/resolvfail
List-ID: <linux-parisc.vger.kernel.org>

Here's what resolvfail does:

static const char obj[] = "testobj1.so";

int main (void) {
  void *d = dlopen (obj, RTLD_LAZY);
  int n;

  if (d == NULL) {
      printf ("cannot load %s: %s\n", obj, dlerror ());
      return 1;
  }
[...]

and it outputs:

cannot load testobj1.so: /home/willy/cvs/glibc-C/elf/testobj1.so: undefined symbol: foo

nm testobj1.so:
                 U foo

but i would have throught that RTLD_LAZY would mean that it didn't have to
resolve foo immediately, only when it was used.  Can someone explain what's
supposed to happen here?

-- 
Revolutions do not require corporate support.

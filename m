Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA09836
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 14:46:02 -0600
To: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 22 Jun 2000 14:33:09 MDT.
             <E135Dev-0007ho-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Jun 2000 14:35:39 -0600
Message-ID: <16486.961706139@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  > = Hello all,
  > =    The attached patch to puffin.external.hp.com CVS binutils-2.10
  > = implements a new linker stub scheme for elf32-hppa.  (Well, it's new for
  > = gnu - I believe the hp linker does something like this).
  > = 
  > = The new scheme works like this:  For any linker input section that needs 
  > a
  > = stub to reach called routines, the linker creates a stub section located
  > = immediately prior to the input section.  A call is simply redirected to
  > = the stub, which consists of a long branch
  > =   ldil LR'XXX,%r1
  > =   be,n RR'XXX(%sr4,%r1)
  > = to the destination.
An FYI -- this is precisely the kind of scheme that I've wanted to see
for the GNU PA tools.

I'd like to get this code integrated into the official binutils releases.

  > = to the implicit %r31 used by "be,l".  Additionally, when we finally
  > = implement elf32-hppa shared libraries, there are going to be a _lot_ more
  > = stubs.  We may even exceed the maximum 256k of stubs, especially if we tr
  > = to combine .plt and .got with stubs to get a register back.
Not only that, the old scheme was not relocatable since it assumed all the
stubs sat in the first 256k of the address space .

jeff

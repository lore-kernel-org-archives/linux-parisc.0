Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA07169
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jan 2000 14:44:10 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id QAA11596
	for parisc-linux@thepuffingroup.com; Fri, 7 Jan 2000 16:47:04 -0500
Date: Fri, 7 Jan 2000 16:47:03 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000107164703.B11300@thepuffingroup.com>
References: <20000106210702.S5882@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000106210702.S5882@thepuffingroup.com>; from Matthew Wilcox on Thu, Jan 06, 2000 at 09:07:02PM -0500
Subject: [parisc-linux] State Of The Port
List-ID: <linux-parisc.vger.kernel.org>


Summary of the telephone meeting held 7/Jan/2000.

Participants:

Michael Ang
Paul Bame
Grant Grundler
R. Scott Holbrooke
David Kennedy
John Marvin
Martin Peterson
Philipp Rumpf
Alex deVries
Matthew Wilcox

1. The Linux 2.3 tree will be opened up today for the general public.

2. The PCI code compiles but has not yet been tested.  Extra work will
   need to be done to support PAT PDC, and Grant will look into this.

3. David will get the Tulip driver working.

4. Martin volunteered to take care of the serial driver problems we are
   experiencing

5. John & Philipp will work on the TLB miss handlers which are currently
   limiting development in a couple of areas.

6. Matthew will work on the proper syscall code.

7. Philipp has the fork() code working, and will next examine exec().

8. Scott volunteered to take care of writing TCP and UDP checksumming
   routines in PA-RISC assembler.

9. Matthew will arrange for a suitable `ifconfig' binary to be available
   for the purposes of testing the network driver.

10. Michael will work on implementing more HPUX syscalls in Linux to
    allow Apache to work.

11. David volunteered to set up a random config test system.

12. Matthew will remove some config options which are known to not work
    (and are unlikely to work in the near future).

13. Grant is currently building a 712 system for Sammy who will be
    transferring his energies from the sun3 port.

14. Frank Rowand is leaving HP.  He has a couple of loan machines
    and may continue to contribute to the port if he has spare time.
    Paul volunteered to liase with Frank to look at the kernel debugger
    code that Frank had written.

15. We discussed a possible hackfest in Fort Collins, and agreed to it
    in principle, but not before Feb 1st.


P.S.  I was tempted to start this email with `The Linux/PA-RISC Core
Team had a Secret Meeting and have deigned to share the results with the
Unwashed Masses', but given how much trouble my last sarcastic comment
caused, I decided to refrain.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA02759
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 17:18:59 -0700
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id 797566F9
	for <parisc-linux@thepuffingroup.com>; Tue, 23 Jan 2001 19:22:10 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id RAA25023
	for <parisc-linux@thepuffingroup.com>; Tue, 23 Jan 2001 17:22:09 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 14LDhQ-0002Uc-00
	for <parisc-linux@thepuffingroup.com>; Tue, 23 Jan 2001 17:22:08 -0700
To: parisc-linux@thepuffingroup.com
Date: Tue, 23 Jan 2001 17:22:08 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14LDhQ-0002Uc-00@noam.fc.hp.com>
Subject: [parisc-linux] Tulip bug "resolution"
List-ID: <linux-parisc.vger.kernel.org>


Some may remember I put a hack in drivers/net/tulip/interrupt.c to
avoid a null pointer deref caused by a data structure being referenced
before being allocated.  I've only seen this on B180 I think.  I posted
my patch to the sourceforge tulip project and received the following
reply.  I don't know enough about the network driver stuff and our
changes to it to figure out what to do next.  Maybe this bug has
magically disappeared but I bet not.

	-P

------- Forwarded Message

To: bame@puffin.external.hp.com, jgarzik@mandrakesoft.com
Subject: [Patch #103298] [Bug #124918] packet received prior to buffer allocation cr
Message-Id: <E14LCCc-0008AO-00@usw-sf-web2.sourceforge.net>
Date: Tue, 23 Jan 2001 14:46:14 -0800

Patch #103298 has been updated. 

Project: tulip
Category: Bug fix
Status: Open
Submitted by: paulbame
Assigned to : jgarzik
Summary: [Bug #124918] packet received prior to buffer allocation cr

Follow-Ups:

Date: 2001-Jan-23 14:46
By: nobody

Comment:
bogus patch -- the Tulip receiver is started up after the skbuffs are
allocated. This user must have broken hardware.
- -------------------------------------------------------

- -------------------------------------------------------
For more info, visit:

http://sourceforge.net/patch/?func=detailpatch&patch_id=103298&group_id=13004


------- End of Forwarded Message

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns1.rz.fh-heilbronn.de (unknown [141.7.1.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61F684829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 10:00:09 -0700 (MST)
Received: from lisa.stud.fh-heilbronn.de (lisa.stud.fh-heilbronn.de [141.7.11.14])
	by dns1.rz.fh-heilbronn.de (8.12.2/8.12.2) with ESMTP id gAQGxMcB014541
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 17:59:23 +0100 (MET)
Received: from acid (acid.stuwo.fh-heilbronn.de [141.7.150.31])
	by lisa.stud.fh-heilbronn.de (8.12.2/8.12.2) with SMTP id gAQGxKVq023931
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 17:59:21 +0100 (MET)
Message-ID: <000701c2956d$61884690$1f96078d@acid>
From: "Yves Bodack" <bodack@stud.fh-heilbronn.de>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Disk problems
Date: Tue, 26 Nov 2002 18:00:52 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

From: "Derek Engelhaupt" <derekengelhaupt@rocketmail.com>
Subject: RE: [parisc-linux] Disk problems

>I had a 712/100 at work that we (ok I) modified to take 2 internal disks
and it ran
> well even though it got extremely hot inside since the 712 wasn't designed
for
> efficiant cooling.  I was using 2 C2490s in it, but quit doing so because
of the
> heat and also moved one of the disks to an external chassis.  The mod was
done by
> using the internal SCSI cable of a 715 and removing the floppy drive.  Not
a
> recommended solution, but the 712 power supply seemed to be able to keep
up.

This is definitively NOT recommended. I tried this in a 712/60 and almost
lost one of the disks. Powerer supply wasn't strong enough to spinn up 2
disks, and a varistor blow up.

Greetings, Yves...

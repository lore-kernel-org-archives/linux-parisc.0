Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A3D04852
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 20:40:53 -0600 (MDT)
Received: from garibaldi.apptechsys.com (ats164.apptechsys.com [207.14.35.164])
	by mail.apptechsys.com (Postfix) with ESMTP id 7CDA27BC45
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 19:40:52 -0700 (PDT)
Date: Tue, 9 Jul 2002 19:40:52 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0207091919340.19290-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] SMP (in)stability
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

After having read on this list that some SMP-related problems were fixed,
I decided to try out the latest kernel as SMP on my J5k.  I tried my old
test, apt-get update, on it.  It downloaded the package lists fine, but
stopped after printing "Reading Package Lists... 0%".  Since I was running
over an ssh session, I don't have any console log messages that may have
appeared, but every time before this (on older smp kernels) it has stopped
at an unaligned access message.  As a point of reference, the last smp 
kernel that was stable for me was 2.4.17-32-smp in debian.  There was an 
updated version of it that was not stable, the stable one was the release 
before (if the box was up, I could get more info from the .deb I grabbed 
of it).  Hopefully that info will help you figure out what change was 
likely to have caused the problems.  I'll get you specifics on that kernel 
package tomorrow.

-- 
FORTUNE PROVIDES QUESTIONS FOR THE GREAT ANSWERS: #4
A:	Go west, young man, go west!
Q:	What do wabbits do when they get tiwed of wunning awound?

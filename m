Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2ED46482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 11:20:04 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g35IK1FN014582
	for <parisc-linux@lists.parisc-linux.org>; Fri, 5 Apr 2002 13:20:02 -0500 (EST)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) id g35IK0k2014579
	for parisc-linux@lists.parisc-linux.org; Fri, 5 Apr 2002 13:20:00 -0500 (EST)
Message-Id: <200204051820.g35IK0k2014579@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 5 Apr 2002 13:19:59 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] GCC support for dwarf2
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

I posted a patch to the gcc trunk a couple of days ago that provides
the first working dwarf2 exception and unwind support under hppa-linux.
The g++ testresults look pretty good but it hasn't had any real world
testing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

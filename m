Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id D812E4837
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Aug 2002 18:11:34 -0600 (MDT)
Message-ID: <20020815001133.84971.qmail@web12507.mail.yahoo.com>
Date: Wed, 14 Aug 2002 17:11:33 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020813131329.C4BD34829@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Autoraid supported?
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

Hey all,

Basically I have an AutoRAID Model 12 (not a 12H) that I want to use on
my newly installed C180 (finally got it workin). Being an HP-UX man I
was wondering how Debian handles alternate (pv) links?  I'm curious
because the AutoRAID has 2 controllers (only one active at a time) and
I have 2 F/W controller cards installed in the C180 besides the onboard
F/W controller.  I'm just starting to figure out some of the
differences in the file system structure from HP-UX and Linux.  I did
d/l some info from "The Linux Cookbook," but I still have questions. 
Normally on my HP-UX side I would hook up the AutoRAID, do an ioscan
-f, insf -e, and proceed to pvcreate/vgcreate/lvcreate, etc.  Since
there is no ioscan in Linux, how can you do a physical scan of the
hardware? Any hardware diagnostics?  Or if anyone can point me to some
other online resources that might be helpful, that would be great too. 
Thanks....

derek (lost in the Linux world)



P.S. If I start to get annoying with the basic questions about Linux,
you can blame HP for spoon feeding all of us hardware techs. ;)  I'm
just interested in furthering my knowledge of Linux since I don't
really get to fool around with HP-UX since most of the boxes I'm
working on are in a production environment.

__________________________________________________
Do You Yahoo!?
HotJobs - Search Thousands of New Jobs
http://www.hotjobs.com

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73AFC48E4
	for <parisc-linux@parisc-linux.org>; Sat,  9 Mar 2002 11:56:54 -0700 (MST)
Message-Id: <200203091856.g29IunwI010743@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] FYI: state of toolchain for Debian woody release
To: randolph@tausq.org
Date: Sat, 9 Mar 2002 13:56:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020309183524.GC628@tausq.org> from "Randolph Chung" at Mar 9, 2002 10:35:24 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> gdb also seems to be rather broken on hppa at the moment. Single
> stepping doesn't always (doesn't usually) work, and there's a problem 
> with recognizing core files. If anyone has time to look into these 
> and submit patches, that'll be great!

I haven't noticed any single stepping issues with the gdb that I built.
Stepping into functions doesn't work but single stepping does.  I have
made some changes to the dwarf2 frame note code in gcc and a working dwarf2
unwind mechanism is real close now.  I'm down to 4 fails in the g++ testsuite.

There are issues with loading symbols from shared libs.  They don't
load automatically even though they should.  You can't set new breakpoints
while a program is executing.  You have to run it again.  You can't
set breakpoints in shared libraries.

Also, can't print a function result.  This problem is probably related
to the stepping into function problem.

Info reg r3 prints the value of r3 saved in the frame and not the current
value in r3.  Not sure what happens if r3 is not saved in the frame.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C312482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Mar 2002 11:09:04 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g2BI8vFN013883
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Mar 2002 13:08:57 -0500 (EST)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) id g2BI8u5N013881
	for parisc-linux@lists.parisc-linux.org; Mon, 11 Mar 2002 13:08:56 -0500 (EST)
Message-Id: <200203111808.g2BI8u5N013881@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 11 Mar 2002 13:08:56 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] dynamic loader problem
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

In looking at the the failure of the g++.brendan/new3.C, I have observed
what appears to be a problem with the dynamic loader.  The function
_Znwj appears as a global symbol in the main program and in
libstdc++.so.4.0.0.  The version in the main program should be selected
in preference to the one in the shared library.  However, the dynamic
loader actually uses the version in the shared library causing the
test to fail.  The program works ok with static linkage.

It looks like the symbol search procedure used in glibc needs some work.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A717482A
	for <parisc-linux@parisc-linux.org>; Thu, 19 Apr 2001 16:23:55 -0600 (MDT)
Sender: bdale@rover.gag.com
To: debian-hppa@lists.debian.org
Cc: parisc-linux@parisc-linux.org
From: Bdale Garbee <bdale@gag.com>
Date: 19 Apr 2001 16:23:48 -0600
Message-ID: <87snj44jgr.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Build Daemon Statistics
List-ID: <linux-parisc.vger.kernel.org>

Since it has been awfully quiet on debian-hppa lately, I'm going to start
posting some status information here.  This time only, I'm going to cc the
parisc-linux list.  Those of you who read parisc-linux but not debian-hppa 
and care to see Debian-specific information like this in the future, please
go subscribe, http://www.debian.org/MailingLists/ is a good place to start.

We're close to have X packages that work.  Much of what remains unbuilt is
blocked one way or another waiting for X libraries...  ergo the awesomely
high "dep-wait" percentage.

Bdale



Build daemon statistics from 20010411-1955 to 20010418-1955 (7.00 days):

           #packages  % of taken  pkgs/day
-------------------------------------------
taken    :  9248                  1321.10
builds   :  9244         99.96%   1320.53
uploaded :   121          1.31%     17.29
failed   :    81          0.88%     11.57
dep-wait :  8139         88.01%   1162.68
give-back:   709          7.67%    101.28
no-build :    17          0.18%      2.43

          time          % of total
----------------------------------
total   :  168:00:18
building:   13:27:02     8.01%
idle    :  146:55:53    87.46%

processed package (upl+fail+dep+nob):    9067
slipped (proc-taken)                :    -181
builds/taken package                :    1.00
avg. time/taken package             :   00:00:05
avg. time/processed package         :   00:00:05
avg. time/build                     :   00:00:05

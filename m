Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6D604829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Sep 2002 01:01:26 -0600 (MDT)
Date: Tue, 3 Sep 2002 00:05:55 -0700
From: Randolph Chung <tausq@debian.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
Message-ID: <20020903070555.GR25710@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20020902164424.GE14634@tausq.org> <3D3815BD0000AB5F@ocpmta5.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3815BD0000AB5F@ocpmta5.be.tiscali.com>
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

> Too bad, I forget to mentionned that I just read some HPMC messages on the
> LCD display of my b2k and do not get any status dump info on console (which
> just stay locked at login prompt). Do you think that kdb works now? (if yes
> where can I learn how to get iaoq and gr02 info?)

at the firmware prompt, 'ser pim' will read the hpmc info that's stored
in pim.

kdb should work, although i haven't tried recently.

randolph

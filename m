Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C80B64829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 22:34:50 -0600 (MDT)
Date: Wed, 4 Sep 2002 21:38:21 -0700
From: Randolph Chung <randolph@tausq.org>
To: Stefan Pfetzing <dreamind@dreamind.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFS - blkgetsize64
Message-ID: <20020905043821.GC8310@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020904143013.GC4386@dreamind.de> <20020904165147.A33FC4829@dsl2.external.hp.com> <20020904182814.GA17156@dreamind.de> <20020904205744.GA29749@dreamind.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020904205744.GA29749@dreamind.de>
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

> I just got a blkgetsize* testprogram...
> (https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=62038)

the test program has a nasty bug in it...
#define BLKGETSIZE64 _IOR(0x12,114,sizeof(unsigned long long)) /* return device

that's wrong.. it should be
#define BLKGETSIZE64 _IOR(0x12,114,unsigned long long) /* return device

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

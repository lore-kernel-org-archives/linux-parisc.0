Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Peter Mottram <peter@petescaff.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] partitioned md to enable root on raid 
In-Reply-To: Message from Peter Mottram <peter@petescaff.com>
   of "Sun, 20 Jan 2002 14:48:34 +0100." <Pine.LNX.4.42.0201201438560.9287-100000@r6.petescaff.com>
References: <Pine.LNX.4.42.0201201438560.9287-100000@r6.petescaff.com> 
Date: Mon, 21 Jan 2002 13:32:37 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020121203237.74F8C482A@dsl2.external.hp.com>
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

Peter Mottram wrote:
> In order to use md on root devices with parisc there must be kernel
> support for partitioned md (due to F0 partition).

Are you implying that CONFIG_MD can only use full disks?
linux/Documentation/Configure.help suggests CONFIG_MD only knows
about the partitions you configure it for.

I've never used CONFIG_MD (it's enabled) and don't understand
what F0 partition has to do with CONFIG_MD.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E3594A19
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 13:43:03 -0700 (MST)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel2.hp.com (Postfix) with ESMTP id E7F63A26
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 15:43:01 -0500 (EST)
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] New native gcc debs 
In-Reply-To: Your message of "Tue, 06 Mar 2001 01:50:14 MST."
             <20010306085014.D58AB38BD7@carmen.fc.hp.com>
References: <20010306085014.D58AB38BD7@carmen.fc.hp.com> 
Date: Wed, 07 Mar 2001 13:42:59 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14aklv-0002kR-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= I have noticed that quite a few 
= packages in Debian that use c++ don't seem to be 2.97(v3) clean yet. So far I
= can't build apt, jade, and ncurses.  I have been able to build quite a few 
= other things though and I have placed the debs in the above directory.

The apt build failure seems to be that the apt compile is unable
to see things in the 'std' namespace -- possibly a new mode of 2.9.7
and I have no clue how to fix this (namespaces are newer than my
working C++ knowledge).

	-P

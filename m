Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3573E4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Mar 2001 11:11:46 -0700 (MST)
Message-Id: <200103071811.NAA00307@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] INLINE_SYSCALL/gcc-bug? (Was Re: pipes)
To: bame@fc.hp.com (Paul Bame)
Date: Wed, 7 Mar 2001 13:11:26 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rhirst@linuxcare.com, alan@linuxcare.com.au,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <E14ahuS-0001t2-00@noam.fc.hp.com> from "Paul Bame" at Mar 7, 2001 10:39:35 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 		    __set_errno(-__sys_res);                        \
> 		    __sys_res == (unsigned long)-1;                 \
			      ^^
Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

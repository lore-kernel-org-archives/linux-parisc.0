Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD5A34829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 21:14:09 -0600 (MDT)
Message-Id: <200306160314.h5G3E2SF003545@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.5.71-pa1 do_sigaction problem
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Sun, 15 Jun 2003 23:14:01 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.53.0306150945230.651@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at Jun 15, 2003 09:52:19 am
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

>  IAOQ[0]: __canonicalize_funcptr_for_compare+0x38/0x134
>  IAOQ[1]: __canonicalize_funcptr_for_compare+0x3c/0x134
>  RP(r2): do_sigaction+0xe0/0x290

Fixes for this have been discussed on the list several times before.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

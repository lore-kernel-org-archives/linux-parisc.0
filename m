Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFB7B4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 14:20:06 -0600 (MDT)
Message-Id: <200305182020.h4IKK5KR017492@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Sun, 18 May 2003 16:20:05 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.53.0305181942400.86062@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at May 18, 2003 07:44:36 pm
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

> didn't :((
> 
> rebuild vim by hand with gcc 3.3 and it again segfaulted on startup :(
> seems like this is a problem with shared libs ?

Did you rebuild or downgrade glibc as suggested?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

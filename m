Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C9C44841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 07:54:20 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id hA9Es6Y11089;
	Sun, 9 Nov 2003 09:54:06 -0500
Subject: Re: [parisc-linux] Allow palo partition to be mounted as ext2
From: James Bottomley <James.Bottomley@steeleye.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Paul Bame <bame@riverrock.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0311080401180.19538@sal.ucc.ie>
References: <1068254037.2120.93.camel@mulgrave>
	<Pine.LNX.4.58.0311080401180.19538@sal.ucc.ie>
Content-Type: text/plain
Date: 09 Nov 2003 08:54:05 -0600
Message-Id: <1068389646.2086.5.camel@mulgrave>
Mime-Version: 1.0
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

On Fri, 2003-11-07 at 22:12, M. Grabert wrote:
> I don't know much ext2/3 details, but is there a way that a fsck
> could mess things up? Eg. not an ordinary fsck, but if the user
> runs it manually with special options?

Not fsck, no.  The bad blocks are treated as though they belonged to an
invisible file.  redoing the mke2fs, of course, would destroy the
bootability.

> I suppose the same technique could be also used for other filesystems
> palo supports (in the future).

As long as they have bad block support, yes---that's not a given;
reiserfs doesn't seem to have it, for instance.

Also, since the command has to be run by palo and palo has to know how
to format the bad block list, it's not trivial to do.

However, the ultimate argument is because palo's iplboot loader only
knows about ext2/3, even if you could format the partition as anything
else, you currently wouldn't be able to boot from it.

James

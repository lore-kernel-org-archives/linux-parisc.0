Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29B754829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 11:10:53 -0600 (MDT)
Message-Id: <200208291710.g7THAnVF025339@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: jsoe0708@tiscali.be
Date: Thu, 29 Aug 2002 13:10:49 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D53B3B70000896D@ocpmta1.be.tiscali.com> from "jsoe0708@tiscali.be" at Aug 29, 2002 06:59:07 pm
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

> p is of type partition define as follow:
> struct partition {
>     unsigned char boot_ind;     /* 0x80 - active */
>     unsigned char head;     /* starting head */
>     unsigned char sector;       /* starting sector */
>     unsigned char cyl;      /* starting cylinder */
>     unsigned char sys_ind;      /* What partition type */
>     unsigned char end_head;     /* end head */
>     unsigned char end_sector;   /* end sector */
>     unsigned char end_cyl;      /* end cylinder */
>     unsigned int start_sect;    /* starting sector counting from 0 */
>     unsigned int nr_sects;      /* nr of sectors in partition */
> };

The problem is that a struct of the above type is being allocated
at an unaligned address.  That's not normal.  The cast isn't the
problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id D36DC482D
	for <parisc-linux@parisc-linux.org>; Fri, 18 Oct 2002 09:29:56 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscalinet)
	id 182Z4T-0000nH-00
	for <parisc-linux@parisc-linux.org>; Fri, 18 Oct 2002 17:29:53 +0200
Date: Fri, 18 Oct 2002 18:25:42 +0200
Message-ID: <3DA56CAE00003217@ocpmta8.be.tiscali.com>
In-Reply-To: <3DA56CAE000020FE@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] XFS (CVS release problem)
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Hi all,
>
>...
>#define xfs_bmbt_disk_set_allf(r, 0, b, c, v) \
>        xfs_bmbt_set_allf(r, 0, b, c, v)
>#endif
>...
>"
This was a typo fixed in last cvs.

Cheers,
    Joel

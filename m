Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F4D24829
	for <parisc-linux@parisc-linux.org>; Wed, 16 Oct 2002 07:49:14 -0600 (MDT)
Date: Wed, 16 Oct 2002 16:45:34 +0200
Message-ID: <3DA56CAE000020FE@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] XFS (CVS release problem)
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

For kernel 2.4.19 I prefer to go to cvs release of xfs;?

So I build a 'patch' against vanilla k-2.4.19 and apply it against k-2.4.19-pa22.

(Just met a problem of conflict: see early in this ml)

But the build failled because:
"../xfs_bmap_btree.h:661:35: "0" may not appear in macro parameter list"

and in this header I found:
"...
#else
...
#define xfs_bmbt_disk_set_allf(r, 0, b, c, v) \
        xfs_bmbt_set_allf(r, 0, b, c, v)
#endif
...
"

just above there are:
void
xfs_bmbt_disk_set_allf(
        xfs_bmbt_rec_t  *r,
        xfs_fileoff_t   o,
        xfs_fsblock_t   b,
        xfs_filblks_t   c,
        xfs_exntst_t    v);

What do you think?
(is it a typo to be reported or a problem specific to hppa gcc?)

Thanks in advance for advise,
    Joel

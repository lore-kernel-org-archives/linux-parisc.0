Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA20608
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Nov 1999 18:23:26 -0700
Received: from sophia.localdomain (mg130-035.ricochet.net [204.179.130.35])
	by rgate.ricochet.net (8.9.3/8.9.3) with ESMTP id TAA05350
	for <parisc-linux@thepuffingroup.com>; Wed, 3 Nov 1999 19:24:38 -0600 (CST)
Received: from localhost (kvajk@localhost)
	by sophia.localdomain (8.9.3/8.9.3) with ESMTP id RAA26072
	for <parisc-linux@thepuffingroup.com>; Wed, 3 Nov 1999 17:29:30 -0800
Date: Wed, 3 Nov 1999 17:29:30 -0800 (PST)
From: Kevin Vajk <kvajk@ricochet.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] getdents
In-Reply-To: <Pine.LNX.4.10.9911031645490.25873-100000@sophia.localdomain>
Message-ID: <Pine.LNX.4.10.9911031724290.26045-100000@sophia.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



OK, here we go:

   struct __dirent {
      uint64_t __d_off;                 /* "magic cookie" */
      _T_INO_T __d_ino;                 /* file number of entry */
      short    __d_reclen;              /* length of this record */
      short    __d_namlen;              /* length of string in d_name */
      char     __d_name[_MAXNAMLEN + 1];/* name must be no longer than this */
   };

Note that sizeof(_T_INO_T) varies depending on your system's bit-ness,
so this is really two structure definitions.

The d_off structure member is an offset for that directory entry.  I
don't know if anybody in user-space ever uses it; I doubt it.

- Kevin Vajk
  <kvajk@ricochet.net>

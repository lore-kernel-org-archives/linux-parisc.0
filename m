Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA20396
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Nov 1999 18:07:15 -0700
Received: from sophia.localdomain (mg130-035.ricochet.net [204.179.130.35])
	by rgate2.ricochet.net (8.9.3/8.9.3) with ESMTP id TAA14032
	for <parisc-linux@thepuffingroup.com>; Wed, 3 Nov 1999 19:08:06 -0600 (CST)
Received: from localhost (kvajk@localhost)
	by sophia.localdomain (8.9.3/8.9.3) with ESMTP id RAA26027
	for <parisc-linux@thepuffingroup.com>; Wed, 3 Nov 1999 17:12:57 -0800
Date: Wed, 3 Nov 1999 17:12:57 -0800 (PST)
From: Kevin Vajk <kvajk@ricochet.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] getdents
In-Reply-To: <19991103031152.F25252@mencheca.ch.genedata.com>
Message-ID: <Pine.LNX.4.10.9911031645490.25873-100000@sophia.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Wed, 3 Nov 1999, Matthew Wilcox wrote:

> struct hpux_dirent {
> 	ino_t	d_ino;
> 	short	d_reclen;
> 	short	d_namlen;
> 	char	d_name[1];
> };

Shouldn't that be d_name[256]?

Anyhow, here's how I think it works on HP-UX (somebody please correct
me if I'm wrong!):

There is a struct dirent, which applications know about, and then
there is a struct __dirent32 and a struct __dirent64, depending on
whether this is a 32- or 64-bit process.  sizeof(ino_t) is the
only difference between the 32- and 64-bit structures.
Let's just call this struct __dirent.

Now, this struct __dirent is just struct dirent, with some additional
stuff at the front.  The trouble is, I don't know what's tacked onto
the front of it, yet...  I'm looking.  If anybody knows, please
tell me!!!

Anyhow, here's the prototype:
    int getdents(int fd, char *buf, unsigned int count);
It fills in buf with struct __dirent entries.  libc then turns each
struct __dirent into a struct dirent for user consumption by just
returning &(__dirent->d_ino).

I realize this isn't much use, without a concrete definition of
the extra field(s) of struct __dirent, but I'll get one tomorrow,
I expect.  (I'm probably just looking in the wrong place or something.)

- Kevin Vajk
  <kvajk@ricochet.net>

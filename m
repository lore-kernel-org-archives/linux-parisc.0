Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA20920
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Nov 1999 18:41:18 -0700
Date: Thu, 4 Nov 1999 02:43:07 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Kevin Vajk <kvajk@ricochet.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] getdents
Message-ID: <19991104024307.I25252@mencheca.ch.genedata.com>
References: <Pine.LNX.4.10.9911031645490.25873-100000@sophia.localdomain> <Pine.LNX.4.10.9911031724290.26045-100000@sophia.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911031724290.26045-100000@sophia.localdomain>; from Kevin Vajk on Wed, Nov 03, 1999 at 05:29:30PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 03, 1999 at 05:29:30PM -0800, Kevin Vajk wrote:
> 
> 
> OK, here we go:
> 
>    struct __dirent {
>       uint64_t __d_off;                 /* "magic cookie" */
>       _T_INO_T __d_ino;                 /* file number of entry */
>       short    __d_reclen;              /* length of this record */
>       short    __d_namlen;              /* length of string in d_name */
>       char     __d_name[_MAXNAMLEN + 1];/* name must be no longer than this */
>    };
> 
> Note that sizeof(_T_INO_T) varies depending on your system's bit-ness,
> so this is really two structure definitions.
> 
> The d_off structure member is an offset for that directory entry.  I
> don't know if anybody in user-space ever uses it; I doubt it.

I've done the following:

struct hpux_dirent {
	long	d_off_pad; /* we only have a 32-bit off_t */
	long	d_off;
	ino_t	d_ino;
	short	d_reclen;
	short	d_namlen;
	char	d_name[1];
};

I think that's the right way round to put the padding for a big-endian
machine.  Yes, I know it ought to be done properly, but we don't have
a put_user() that will cope with an 8-byte quantity yet.  Any volunteers?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

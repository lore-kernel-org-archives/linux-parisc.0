Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA21704
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Nov 1999 22:49:58 -0700
Message-Id: <199911040552.VAA11478@milano.cup.hp.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] getdents 
In-reply-to: Your message of "Thu, 04 Nov 1999 02:43:07 PST."
             <19991104024307.I25252@mencheca.ch.genedata.com>
Date: Wed, 03 Nov 1999 21:52:06 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> I've done the following:
> 
> struct hpux_dirent {
> 	long	d_off_pad; /* we only have a 32-bit off_t */
> 	long	d_off;
> 	ino_t	d_ino;
> 	short	d_reclen;
> 	short	d_namlen;
> 	char	d_name[1];
> };
> 
> I think that's the right way round to put the padding for a big-endian
> machine.

Mathew,
Sorry, it doesn't look right to me.
I not sure the following is "right" either but "looks more right":

#ifdef __LP64__
	long d_off;
#else
	int d_off_pad;
	int d_off;
#endif

The problem is the offset for the d_off has to be different for
32-bit applications than it will be for 64-bit applications.
gcc has to behave the same way if we want binary compatibility.
In "wide-mode" HP-UX compiler uses 64-bit long/pointer and int
remains 32-bit.  Ergo the name "LP64".

devresource.hp.com has a "HP-UX 64-bit Porting and Transition Guide,
June 1998" in the Document library. It's an interesting reference on
HP-UX kernel interacts with 32/64-bit binaries and has some interesting
gotchas.

hope this helps,
grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253

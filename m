Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA04028
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 09:27:42 -0600
Message-Id: <199906211527.LAA02313@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Assembly error: entry.S
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 21 Jun 1999 11:27:31 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990621172015.P30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 21, 99 05:20:15 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> On Mon, Jun 21, 1999 at 11:06:27AM -0400, John David Anglin wrote:
> > The following error occurs building the kernel:
> > 
> > gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
> > entry.S:219: macro `ENTRY_NAME' used without args
> > make[1]: *** [entry.o] Error 1
> 
> Delete line 219.  Oops.

and then

gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
entry.S: Assembler messages:
entry.S:228: Error: bad or irreducible absolute expression; zero assumed
make[1]: *** [entry.o] Error 1

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

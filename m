Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA08541
	for <parisc-linux@puffin.external.hp.com>; Sun, 13 Jun 1999 00:45:19 -0600
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] binfmt_som 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sun, 13 Jun 1999 03:52:54 +0200.
             <19990613035254.D31472@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 13 Jun 1999 00:40:06 -0600
Message-ID: <24471.929256006@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19990613035254.D31472@mencheca.ch.genedata.com>you write:
  > ``exec_dsize
  > This field specifies the size in bytes of the initialised data (does
  > not have to be a multiple of 4k).  The actual size of the data section
  > in the file must be a multiple of 4k and can be padded with zeroes to
  > make it a multiple of 4k.''
  > 
  > Does this mean in the case where exec_dsize is not a multiple of 4k, it
  > MUST be padded with zeroes, or merely might be padded with zeroes?  If the
  > former, I don't need to zero them myself in the loader which would be nice.
Strictly reading the size in the file is guaranteed to be a multiple of 4k,
but you can't necessarily depend on the pad being zero filled.

However, HP's linker always zero pads.

  > Also, where does the bss section start?  Is it immediately after the
  > initialised data or at the next page boundary after it?
It beings immediately after the initialized data.  Note that HP's linker will
decrease the size of the bss space by the amount of pad needed to fill out the
data space's size to a multiple of 4k.  This saves a little bit of memory in
the resident image.  Note this is only possible when the pad is zero filled.

To the best of my knowledge this behavior is not documented by HP anywhere.  It
is documented in bfd/som.c, as are many of SOM's wonderful quirks.  Search for
exec_header.

In case you're wondering why BFD has to know about this -- consider strip and
objcopy.  If you muck up an executable with those programs BFD has to be
able to recreate the exec header based on the sections that will exist in the
final output file.

jeff

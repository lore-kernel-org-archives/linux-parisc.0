Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA25247
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 12:38:18 -0600
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: adevries@thepuffingroup.com (Alex deVries),
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A quick update 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 18 Jun 1999 09:05:50 EDT.
             <199906181305.JAA06811@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 18 Jun 1999 12:29:04 -0600
Message-ID: <1617.929730544@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <199906181305.JAA06811@hiauly1.hia.nrc.ca>you write:
  > After the kernel is built, take a look at where the sections start
  > in SOM executable.  Each section must be copied to its corresponding
  > starting address in the LIF image.  Space must be reserved for the bss
  > data if there is a section after it that contains necessary data.
Right.  Use the exec header to find a.out-like boundaries for text, data & bss.

Do not try to build up a memory image using the space/subspace stuff.  You'll
be bitterly disappointed to find out that the info on the space/subspaces is
not wholly accurate in an executable image.

jeff

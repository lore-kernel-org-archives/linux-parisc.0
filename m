To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: elf32-hppa bfd: $global$ and -fpic 
Reply-To: law@cygnus.com
In-reply-to: Your message of Tue, 01 Jun 1999 18:42:27 EDT.
             <199906012242.SAA27523@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 Jun 1999 18:13:23 -0600
Message-ID: <5400.928282403@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>


  In message <199906012242.SAA27523@hiauly1.hia.nrc.ca>you write:
  > Hi Jeff,
  > 
  > The following happens when linking pic code (see below): undefined referenc
  > e
  > to `$global$'.  The problem seems to occur in elf32-hppa.c when $global$ is
  > not found (see code in elf32_hppa_bfd_final_link_relocate).  Do you see an
  > easy solution to handle gcc pic code which does not use $global$?
The existing elf32-hppa tools are not PIC aware or PIC compatible and are
totally inappropriate for just about any work you might be trying to do.  Do
not try to use them, they'll only make your life miserable.  That code is going
to be 100% totally trashed and started over.

jeff

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

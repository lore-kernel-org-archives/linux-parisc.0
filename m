Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA30375
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 17:14:40 -0600
To: Alan Modra <alan@linuxcare.com.au>
cc: Paul Bame <bame@fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Another possible linker problem 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 07 Jul 2000 09:06:26 +1000.
             <Pine.LNX.4.21.0007070848540.12175-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 17:16:07 -0600
Message-ID: <13488.962925367@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0007070848540.12175-100000@front.linuxcare.com.au>y
ou write:
  > [cc to list in case others have the same problem.]
  > I reckon this error is probably fixed by the patch I checked in last
  > night.  elf32_hppa_size_stubs had this code in it
  > 
  > 		      if (hash->root.type == bfd_link_hash_undefined
  > 			  || hash->root.type == bfd_link_hash_undefweak)
  > 			continue;
  > 
  > 		      while (hash->root.type == bfd_link_hash_indirect
  > 			     || hash->root.type == bfd_link_hash_warning)
  > 			hash = (struct elf_link_hash_entry *)
  > 			  hash->root.u.i.link;
  > 
  > and the problem is that we may have an indirect symbol (results from
  > symbol versioning) pointing to an undefined symbol.  The simple fix is to
  > traverse the indirect links before checking for undefined syms.
Yea, I don't think I ever implemented indirects in the PA tools.  I suspect
there's other PA code that doesn't handle them correctly.

I'm glad to see someone making the right things happen with that old crusty
code.


jeff
